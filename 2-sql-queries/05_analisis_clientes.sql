-- ANÁLISIS DE CLIENTES Y UBICACIÓN
-- Archivo: 05_analisis_clientes.sql
-- Propósito: Comportamiento y distribución de clientes

-- Clientes activos vs inactivos
SELECT 
    SUM(CASE WHEN status = 'active' THEN 1 ELSE 0 END) AS clientes_activos,
    SUM(CASE WHEN status = 'inactive' THEN 1 ELSE 0 END) AS clientes_inactivos
FROM clientes_clean;

-- Top 10 clientes por ingresos totales
SELECT 
    clientes_clean.customer_name, 
    SUM(quantity*unit_price) AS ingresos_totales 
FROM ventas_clean
JOIN clientes_clean ON clientes_clean.﻿customer_id = ventas_clean.customer_id
GROUP BY clientes_clean.customer_name
ORDER BY ingresos_totales DESC
LIMIT 10;

-- Análisis total de clientes por ubicación de tienda
SELECT 
    store_location, 
    COUNT(﻿customer_id) AS Total_clientes 
FROM ventas_clean
JOIN clientes_clean ON clientes_clean.﻿customer_id = ventas_clean.customer_id
WHERE store_location IS NOT NULL AND store_location <> ""
GROUP BY store_location
ORDER BY Total_clientes DESC;

-- Ventas por región (cantidad y monto)
SELECT 
    ventas_clean.store_location, 
    SUM(quantity) AS cantidad_vendida, 
    SUM(price*quantity) AS total_vendido 
FROM productos_clean 
JOIN ventas_clean ON ventas_clean.product_id = productos_clean.product_id
GROUP BY store_location 
ORDER BY cantidad_vendida DESC;
