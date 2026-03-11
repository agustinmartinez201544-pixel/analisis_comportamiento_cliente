# Data Analytics End-to-End Project: **analisis_comportamiento_cliente**

## 📋 Resumen (Overview)

Este proyecto consiste en un ciclo completo de análisis de datos, desde la ingesta de datos crudos hasta la comunicación de hallazgos estratégicos. El objetivo principal fue identificar patrones clave en el comportamiento de compra de clientes del sector retail para optimizar la toma de decisiones mediante el uso de Python, SQL y Power BI.

---

## 📊 Conjunto de Datos (Dataset)

- **Origen:** Kaggle
- **Descripción:** Contiene registros de transacciones de compra de clientes en diversas categorías de productos (Ropa, Accesorios, Calzado, Abrigos), con un volumen de 3.900 filas y 18 columnas.
- **Variables clave:** `customer_id`, `age`, `gender`, `location`, `item_purchased`, `category`, `purchase_amount`, `season`, `size`, `color`, `discount_applied`, `previous_purchases`, `frequency_of_purchases`, `review_rating`, `shipping_type`, `subscription_status`
- **Datos faltantes:** 37 valores nulos en la columna `review_rating`, imputados con la mediana por categoría de producto.

---

## 🛠️ Herramientas

- **Lenguaje:** Python (Pandas)
- **Base de Datos:** PostgreSQL
- **Visualización:** Power BI (DAX, Power Query)
- **Documentación:** Microsoft Word (Reporte)
- **Presentaciones:** Gamma (presentación visual asistida por IA) y NotebookLM (presentación generada desde el reporte)

---

## 🚀 Pasos (Workflow)

### 1. Extracción y EDA (Python)

Se realizó un Análisis Exploratorio de Datos (EDA) con Pandas para comprender la estructura del dataset y preparar los datos para el análisis.

- Limpieza e imputación de nulos en `review_rating` usando la mediana por categoría.
- Estandarización de columnas a `snake_case`.
- **Feature Engineering:**
  - Creación de columna `age_group` (binning de edades: Joven, Mediana Edad, Adulto, Adulto Mayor).
  - Creación de columna `purchase_frequency_days` a partir de los datos de compra.
- Verificación de redundancia entre `discount_applied` y `promo_code_used`; se eliminó `promo_code_used`.
- Carga del DataFrame limpio a PostgreSQL para análisis SQL.

### 2. Gestión de Datos (SQL)

Los datos procesados se cargaron en PostgreSQL para realizar consultas complejas y segmentaciones de alto rendimiento.

- Creación del esquema y tabla `customer`.
- Ejecución de consultas con **GROUP BY**, **subqueries**, **CTEs** y **Window Functions** (`ROW_NUMBER OVER PARTITION BY`) para preparar las vistas del reporte.
- 10 consultas de negocio cubriendo ingresos, segmentación de clientes, análisis de descuentos y comportamiento de suscripción.

### 3. Visualización (Power BI)

Desarrollo de un tablero interactivo centrado en KPIs de negocio.

- Modelado directo sobre la tabla de hechos `customer`.
- Creación de medidas DAX para KPIs (promedio de compra, promedio de review, conteo de clientes).
- Configuración de tooltips personalizados (ej.: cantidad de ventas por grupo etario).

---

## 🖥️ Tablero (Dashboard)

El dashboard final permite filtrar por **Suscripción** (No / Sí), **Género** (Femenino / Masculino), **Categoría** (Abrigos, Accesorios, Calzado, Ropa) y **Medio de Compra** (Envío al Día Siguiente, Envío en 2 Días, Envío Gratis, Express, Retiro en Tienda, Standard).

- **Sección de Resumen:** KPIs principales — Número de Clientes (3,9K), Promedio de Monto de Compra ($59,76), Promedio de Review (3,75).
- **Proporción de Suscriptores:** Gráfico de dona — Sí 27% / No 73%.
- **Ingresos y Ventas por Categoría:** Gráficos de barras verticales con valores absolutos.
- **Ingresos y Ventas por Grupo Etario:** Barras horizontales con ingresos en el eje principal y cantidades de venta en tooltip.
- **Lealtad por Cantidad de Compras:** Segmentación en Nuevos (0–5): 424, Regulares (6–20): 1.137, VIP (≥20): 2.339 clientes.

---

## 📈 Resultados

- **Hallazgo 1 — Dominio masculino en ingresos:** Los clientes masculinos generan más del doble de ingresos que los femeninos ($157.890 vs $75.191), lo que sugiere una oportunidad de crecimiento en el segmento femenino.
- **Hallazgo 2 — Alta dependencia de descuentos:** Productos como Sombrero (50%), Zapatillas (49,66%) y Abrigo (49,07%) concentran la mayor proporción de compras con descuento, presionando los márgenes.
- **Hallazgo 3 — Grupo etario Joven lidera ingresos:** Los Adultos Jóvenes contribuyeron $62.143 en ingresos totales, siendo el segmento de mayor valor.
- **Hallazgo 4 — Base de clientes VIP dominante:** El 79,7% de los clientes tienen ≥20 compras previas (segmento VIP: 2.339), indicando una base fidelizada pero con bajo ingreso de clientes nuevos (424).
- **Acción recomendada:** Diseñar campañas de adquisición orientadas al segmento femenino y joven, implementar un programa VIP para retener a los compradores frecuentes, y revisar la política de descuentos en los productos con mayor dependencia promocional.

---

## ⚙️ Cómo ejecutarlo

- **Dataset:** Cargar el archivo `customer_shopping_behavior.csv` como fuente de datos.
- **Python:** Abrir y ejecutar el notebook `Project.ipynb` (requiere `pandas`).
- **SQL:** Importar el archivo `ProyectoFinal.sql` en PostgreSQL.
- **Power BI:** Abrir el archivo `Proyecto GitHub.pbix` con Power BI Desktop.
- **Reporte:** El análisis completo se encuentra en `Analisis_Comportamiento_Compras.pdf`.
- **Presentaciones:** `Presentación 1.pdf` (Gamma) y `Presentación 2.pdf` (NotebookLM).

---

## 📬 Contacto

**Agustín Martínez** — [linkedin.com/in/amartinez-ingind](https://www.linkedin.com/in/amartinez-ingind)  
🔗 github.com/amartinez-ingind/analisis_comportamiento_cliente
