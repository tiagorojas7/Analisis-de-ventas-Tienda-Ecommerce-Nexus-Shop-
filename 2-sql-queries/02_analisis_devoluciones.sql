-- ANÁLISIS DE DEVOLUCIONES
-- Archivo: 02_analisis_devoluciones.sql
-- Propósito: Identificar productos con mayor tasa de devolución

-- Total de ventas vs total devoluciones vs tasa de devolución
SELECT 
    p.product_name,
    v.total_ventas,
    IFNULL(d.total_devoluciones, 0) AS total_devoluciones,
    (IFNULL(d.total_devoluciones, 0)/v.total_ventas)*100 AS tasa_devolucion
FROM productos_clean p
JOIN (
    -- Total de ventas por producto
    SELECT product_id, SUM(quantity) AS total_ventas
    FROM ventas_clean
    GROUP BY product_id
) v ON p.product_id = v.product_id
LEFT JOIN (
    -- Total de devoluciones por producto
    SELECT v.product_id, COUNT(o.return_reason) AS total_devoluciones
    FROM ventas_clean v
    JOIN opiniones_clean o ON o.sale_id = v.sale_id
    GROUP BY v.product_id
) d ON p.product_id = d.product_id
ORDER BY tasa_devolucion DESC;

-- Top 10 productos con más devoluciones
SELECT 
    productos_clean.product_name, 
    COUNT(return_reason) AS total_devoluciones 
FROM ventas_clean 
JOIN opiniones_clean ON opiniones_clean.sale_id = ventas_clean.sale_id
JOIN productos_clean ON productos_clean.product_id = ventas_clean.product_id
GROUP BY product_name
ORDER BY total_devoluciones DESC
LIMIT 10;
