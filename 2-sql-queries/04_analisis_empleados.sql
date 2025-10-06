- ANÁLISIS DE EMPLEADOS Y DEPARTAMENTOS
-- Archivo: 04_analisis_empleados.sql
-- Propósito: Desempeño del equipo comercial

-- Total ventas por empleado
SELECT 
    trabajadores_clean.employee_name, 
    department, 
    COUNT(sale_id) AS total_ventas 
FROM trabajadores_clean 
JOIN ventas_clean ON ventas_clean.employee_id = trabajadores_clean.﻿employee_id
GROUP BY employee_name, department
ORDER BY total_ventas DESC;

-- Ingresos gestionados por departamento
SELECT 
    trabajadores_clean.department, 
    SUM(quantity*unit_price) AS ingresos_totales 
FROM trabajadores_clean
JOIN ventas_clean ON ventas_clean.employee_id = trabajadores_clean.﻿employee_id
GROUP BY department
ORDER BY ingresos_totales DESC;
