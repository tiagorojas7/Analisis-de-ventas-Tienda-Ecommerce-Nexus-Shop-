
Análisis de Ventas - Tienda E-commerce Nexus Shop
De Datos Crudos a Insights: Pipeline Completo de Análisis con SQL + Power Query + Power BI

## 📊 Resumen del Proyecto
Transformé **5 datasets desorganizados** en un **dashboard interactivo** que identificó **79 devoluciones críticas** y **oportunidades de crecimiento** para Nexus Shop, analizando **373 ventas** y **4.66M en ingresos**.


## 🔧 Herramientas que utilice
- **SQL** para unir y analizar los datos
- **Power Query** para limpiar y organizar la información  
- **Power BI** para crear gráficos y reportes interactivos

## 📁 Estructura del Proyecto

### [1. Datos Originales](https://github.com/tiagorojas7/Analisis-de-ventas-Tienda-Ecommerce-Nexus-Shop-/tree/main/%3A%201-datos-crudos)
- `clientes.csv` - Base de datos de clientes
- `ventas.csv` - Transacciones comerciales
- `productos.csv` - Catálogo de productos
- `trabajadores.csv` - Información del equipo
- `opiniones.csv` - Feedback y devoluciones

### [2. Consultas SQL](https://github.com/tiagorojas7/Analisis-de-ventas-Tienda-Ecommerce-Nexus-Shop-/tree/main/2-sql-queries)
- [`01_union_tablas.sql`](2-sql-queries/01_union_tablas.sql) - Uniones básicas entre tablas
- [`02_analisis_devoluciones.sql`](2-sql-queries/02_analisis_devoluciones.sql) - Tasa de devolución por producto
- [`03_analisis_ventas_productos.sql`](2-sql-queries/03_analisis_ventas_productos.sql) - Métricas por producto y categoría
- [`04_analisis_empleados.sql`](2-sql-queries/04_analisis_empleados.sql) - Desempeño del equipo comercial
- [`05_analisis_clientes.sql`](2-sql-queries/05_analisis_clientes.sql) - Comportamiento y distribución geográfica
- [`06_consulta_final_dashboard.sql`](2-sql-queries/06_consulta_final_dashboard.sql) - Datos consolidados para Power BI

### [3. Dashboard Power BI](https://github.com/tiagorojas7/Analisis-de-ventas-Tienda-Ecommerce-Nexus-Shop-/tree/main/3-power-bi)
**📊 Dashboard Interactivo Nexus Shop:**
- [`Dashboard Nexus Shop.pbix`](https://github.com/tiagorojas7/Analisis-de-ventas-Tienda-Ecommerce-Nexus-Shop-/blob/main/3-power-bi/Dashboard%20Nexus%20Shop.pbix) - Archivo completo interactivo
- [`dashboard_documentation.md`](https://github.com/tiagorojas7/Analisis-de-ventas-Tienda-Ecommerce-Nexus-Shop-/blob/main/3-power-bi/dashboard_documentation.md) - Documentación detallada

**🖼️ Vistas Destacadas:**
![Vista General](3-power-bi/01_dashboard_completo.png)
*Dashboard completo con filtros por categoría, año y ubicación*

![Tendencias Mensuales](3-power-bi/02_tendencias_mensuales.png)  
*Evolución de ingresos y ventas por mes 

![Análisis Específico](3-power-bi/04_filtros_interactivos.png)
*Filtros en acción: Tecnología 2024 

(3-power-bi/04_filtros_interactivos_2.png)
*Filtros de ubicacion, categoria y año aplicados en el dashboard 

**🔧 Lo que demuestra:**
- ✅ **Segmentadores interactivos** que responden preguntas específicas
- ✅ **Análisis de tendencias** temporales y por empleado
- ✅ **Top productos** con impacto de devoluciones
- ✅ **Capacidad de drill-down** geográfico y por categoría

### [4. Datos Procesados](https://github.com/tiagorojas7/Analisis-de-ventas-Tienda-Ecommerce-Nexus-Shop-/tree/main/4_datos_procesados)

**🧹 Datos Limpios y Listos para Análisis:**
- Dataset final unificado y depurado
- Datos consistentes después de procesos ETL
- Estructura optimizada para reporting
- Base para el dashboard de Power BI

**📊 Procesos de Limpieza Aplicados:**
- Eliminación de duplicados y valores nulos
- Transformacion de palabras mal escritas
- Estandarización de formatos y categorías
- Cálculo de métricas derivadas (márgenes, tasas)
- Unificación de múltiples fuentes de datos

### [5. Documentación](https://github.com/tiagorojas7/Analisis-de-ventas-Tienda-Ecommerce-Nexus-Shop-/blob/main/Reporte/reporte-desempeno-detallado.md)
- [`reporte-desempeno-detallado.md`](5-documentacion/reporte-desempeno-detallado.md) - Análisis completo de resultados

**📋 Análisis Ejecutivo Completo - Nexus Shop:**

- **Análisis de 373 ventas** y 4.66M en ingresos netos
- **Identificación de 79 devoluciones** como área crítica
- **5 insights estratégicos** priorizados por impacto
- **Recomendaciones accionables** para optimización

**📊 Hallazgos Principales:**
- 🚨 **Smartphone Ultra** con mayor tasa de devolución (21.2%)
- 📦 **Dependencia** de productos de alto valor (Escritorio Madera: 946.5K)
- 👥 **Equipo equilibrado** con distribución 16.4%-22.9%
- 📅 **Estacionalidad marcada** (Febrero: 987.7K vs Marzo: 253.6K)
- 🌍 **Oportunidad geográfica** en Sevilla y Valencia

**🔍 Metodología de Análisis:**
- Procesamiento ETL con Power Query
- Uniones SQL avanzadas entre 5 tablas
- Dashboard interactivo en Power BI

### 🚀 Recomendaciones Clave
- Reducir devoluciones mediante mejoras en calidad/descripciones
- Diversificar cartera de productos y equilibrar desempeño del equipo
- Capitalizar estacionalidad con campañas específicas

---
Proyecto creado por Tiago Rojas - Analista de Datos
¿Preguntas o oportunidades? ¡Conectemos en Linkedin:[https://www.linkedin.com/in/tiago-rojas-047658317/?trk=opento_sprofile_details]!*
