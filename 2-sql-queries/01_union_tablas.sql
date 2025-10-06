-- UNION DE TABLAS BÁSICAS
-- Archivo: 01_union_tablas.sql
-- Propósito: Uniones iniciales para exploración de datos

-- Unión ventas con productos
SELECT * FROM ventas_clean
JOIN productos_clean ON productos_clean.product_id = ventas_clean.product_id;

-- Unión ventas con opiniones
SELECT * FROM ventas_clean
JOIN opiniones_clean ON opiniones_clean.sale_id = ventas_clean.sale_id;

-- Unión completa de todas las tablas
SELECT * FROM ventas_clean
JOIN opiniones_clean ON opiniones_clean.sale_id = ventas_clean.sale_id
JOIN productos_clean ON productos_clean.product_id = ventas_clean.product_id;
