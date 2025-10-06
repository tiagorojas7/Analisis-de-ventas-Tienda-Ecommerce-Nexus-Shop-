-- CONSULTA FINAL PARA DASHBOARD POWER BI
-- Archivo: 06_consulta_final_dashboard.sql
-- Propósito: Datos consolidados para visualización en Power BI

SELECT 
    YEAR(STR_TO_DATE(ventas_clean.sale_date,"%d/%m/%Y")) AS año,
    MONTHNAME(STR_TO_DATE(ventas_clean.sale_date,"%d/%m/%Y")) AS mes, 
    MONTH(STR_TO_DATE(ventas_clean.sale_date,"%d/%m/%Y")) AS numero_mes,
    SUM(quantity) AS total_ventas,
    SUM(quantity*unit_price) AS total_ingresos_brutos,
    
    SUM(quantity*unit_price) - 
    SUM(CASE 
        WHEN opiniones_clean.return_reason IS NOT NULL 
        THEN 1*unit_price
        ELSE 0 
    END) AS ingresos_netos,
    
    SUM(quantity*(price-costo)) - 
    SUM(CASE 
        WHEN opiniones_clean.return_reason IS NOT NULL 
        THEN 1*(price-costo)
        ELSE 0 
    END) AS margen_neto,
    
    ventas_clean.store_location, 
    productos_clean.category, 
    productos_clean.product_name,
    COUNT(opiniones_clean.sale_id) AS total_devoluciones,
    
    SUM(CASE 
        WHEN opiniones_clean.return_reason IS NOT NULL 
        THEN 1*unit_price 
        ELSE 0 
    END) AS monto_total_devolver,
    
    trabajadores_clean.employee_name, 
    department
    
FROM productos_clean 
JOIN ventas_clean ON ventas_clean.product_id = productos_clean.product_id
LEFT JOIN opiniones_clean ON opiniones_clean.sale_id = ventas_clean.sale_id
LEFT JOIN trabajadores_clean ON trabajadores_clean.﻿employee_id = ventas_clean.employee_id
    
GROUP BY 
    YEAR(STR_TO_DATE(ventas_clean.sale_date,"%d/%m/%Y")), 
    MONTHNAME(STR_TO_DATE(ventas_clean.sale_date,"%d/%m/%Y")), 
    ventas_clean.store_location,
    productos_clean.category, 
    productos_clean.product_name, 
    numero_mes,
    trabajadores_clean.employee_name, 
    department
    
ORDER BY numero_mes ASC;
