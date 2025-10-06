-- union de tablas
select * from ventas_clean
join productos_clean on productos_clean.product_id = ventas_clean.product_id;

select * from ventas_clean
join opiniones_clean on opiniones_clean.sale_id=ventas_clean.sale_id;

select * from ventas_clean
join opiniones_clean on opiniones_clean.sale_id=ventas_clean.sale_id
join productos_clean on productos_clean.product_id = ventas_clean.product_id;

-- BUSCANDO POSIBLES INSIGHTS PARA MI ANALISIS 

-- total de ventas vs total devoluciones vs tasa devolucion. 
select 
    p.product_name,
    v.total_ventas,
    ifnull(d.total_devoluciones, 0) as total_devoluciones,
    (ifnull(d.total_devoluciones, 0)/v.total_ventas)*100 as tasa_devolucion
from productos_clean p
join (
    -- Total de ventas por producto
    select product_id, sum(quantity) as total_ventas
    from ventas_clean
    group by product_id
    
) v on p.product_id = v.product_id
left join (
    -- Total de devoluciones por producto
    select v.product_id, count(o.return_reason) as total_devoluciones
    from ventas_clean v
    join opiniones_clean o on o.sale_id = v.sale_id
    group by v.product_id
) d on p.product_id = d.product_id
order by tasa_devolucion desc;

-- top 10 productos con mas devoluciones
select productos_clean.product_name, count(return_reason) as total_devoluciones from ventas_clean 
join opiniones_clean on opiniones_clean.sale_id=ventas_clean.sale_id
join productos_clean on productos_clean.product_id = ventas_clean.product_id
group by product_name
order by total_devoluciones desc
limit 10; 

-- cantidad vendida vs ingresos totales por producto.
select p.product_name, sum(quantity) as cantidad,  sum(price*quantity) as ingresos_totales
 from ventas_clean
join productos_clean p on p.product_id = ventas_clean.product_id
group by p.product_name
order by ingresos_totales desc;

-- total ventas por empleado 
select trabajadores_clean.employee_name, department, count(sale_id) as total_ventas from trabajadores_clean 
join ventas_clean on ventas_clean.employee_id=trabajadores_clean.﻿employee_id
group by employee_name, department
order by total_ventas desc;

-- ingresos gestionados por departamento
select trabajadores_clean.department, sum(quantity*unit_price) as ingresos_totales from trabajadores_clean
join ventas_clean on ventas_clean.employee_id=trabajadores_clean.﻿employee_id
group by department
order by ingresos_totales desc; 

-- clientes activos vs inactivos 
select 
sum(case when status = 'active' then 1 else 0 end) as clientes_activos,
sum(case when status = 'inactive' then 1 else 0 end) as clientes_inactivos
from clientes_clean;

-- top 10 clientes por ingresos totales 
select clientes_clean.customer_name, sum(quantity*unit_price) as ingresos_totales from ventas_clean
join clientes_clean on clientes_clean.﻿customer_id = ventas_clean.customer_id
group by clientes_clean.customer_name
order by ingresos_totales desc
limit 10;

-- Analis total de clientes por ubicacion tienda
select store_location , count(﻿customer_id) as Total_clientes from ventas_clean
join clientes_clean on clientes_clean.﻿customer_id=ventas_clean.customer_id
where store_location is not null and store_location <> ""  -- trae las filas con valor distinto de vacio. 
group by store_location
order by Total_clientes desc; 

-- ventas por region ( cantidad y monto ) 
select ventas_clean.store_location, sum(quantity) as cantidad_vendida, sum(price*quantity)  as total_vendido from productos_clean 
 Join ventas_clean ON ventas_clean.product_id=productos_clean.product_id
group by store_location 
order by cantidad_vendida desc; 

-- Margen bruto por categoria 
select productos_clean.category, sum(quantity*(price-costo)) as margen_bruto from productos_clean 
Join ventas_clean ON ventas_clean.product_id=productos_clean.product_id
group by productos_clean.category
order by margen_bruto desc; 

-- CONSULTA GENERAL PARA EXPORTARLA A POWER BI PARA REALIZAR EL DASHBOARD 

-- Consulta final para la construccin del dashboard
select year(str_to_date(ventas_clean.sale_date,"%d/%m/%Y")) as año,
 monthname(str_to_date(ventas_clean.sale_date,"%d/%m/%Y")) as mes, 
 month(str_to_date(ventas_clean.sale_date,"%d/%m/%Y")) as numero_mes,
 sum(quantity) as total_ventas,
 sum(quantity*unit_price) as total_ingresos_brutos,
 
  SUM(quantity*unit_price) - 
    SUM(CASE 
        WHEN opiniones_clean.return_reason IS NOT NULL 
        THEN 1*unit_price
        ELSE 0 
    END) as ingresos_netos,
    
    SUM(quantity*(price-costo)) - 
    SUM(CASE 
        WHEN opiniones_clean.return_reason IS NOT NULL 
        THEN 1*(price-costo)
        ELSE 0 
    END) as margen_neto,
    
 ventas_clean.store_location, 
 productos_clean.category, 
 productos_clean.product_name,
 count(opiniones_clean.sale_id) as total_devoluciones,
 
 SUM(CASE 
        WHEN opiniones_clean.return_reason IS NOT NULL 
        THEN 1*unit_price 
        ELSE 0 
    END) as monto_total_devolver,
    
 trabajadores_clean.employee_name, department
 from productos_clean 
 Join ventas_clean ON ventas_clean.product_id=productos_clean.product_id
 left join opiniones_clean on opiniones_clean.sale_id= ventas_clean.sale_id
 left join trabajadores_clean on trabajadores_clean.﻿employee_id=ventas_clean.employee_id
 group by year(str_to_date(ventas_clean.sale_date,"%d/%m/%Y")), monthname(str_to_date(ventas_clean.sale_date,"%d/%m/%Y")), ventas_clean.store_location,productos_clean.category, productos_clean.product_name, numero_mes,trabajadores_clean.employee_name, department
 order by numero_mes asc;

