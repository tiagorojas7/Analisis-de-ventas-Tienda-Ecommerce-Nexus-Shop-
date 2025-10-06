-- ANÁLISIS DE VENTAS Y PRODUCTOS
-- Archivo: 03_analisis_ventas_productos.sql
-- Propósito: Métricas de rendimiento por producto y categoría

-- Cantidad vendida vs ingresos totales por producto
SELECT 
    p.product_name, 
    SUM(quantity) AS cantidad,  
    SUM(price*quantity) AS ingresos_totales
FROM ventas_clean
JOIN productos_clean p ON p.product_id = ventas_clean.product_id
GROUP BY p.product_name
ORDER BY ingresos_totales DESC;

-- Margen bruto por categoría
SELECT 
    productos_clean.category, 
    SUM(quantity*(price-costo)) AS margen_bruto 
FROM productos_clean 
JOIN ventas_clean ON ventas_clean.product_id = productos_clean.product_id
GROUP BY productos_clean.category
ORDER BY margen_bruto DESC;
