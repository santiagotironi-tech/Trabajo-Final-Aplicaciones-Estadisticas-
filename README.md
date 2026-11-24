# Taller Calificado 4 – Aplicaciones Estadísticas (AGL 280)

Código en R de respaldo para el análisis del rendimiento de raps (450 parcelas, 3 regiones, 2 suelos, 2 manejos). Un script por pregunta, para poder copiar cada bloque a su apartado del informe.

## Cómo ejecutarlo

1. Abrir R/RStudio en la carpeta del proyecto (`taller-4-raps/`).
2. Instalar los paquetes una sola vez desde la consola: `install.packages(c("dplyr", "tidyr", "ggplot2", "car"))`.
3. Poner `Rendimiento_Raps.csv` en la carpeta `datos/` (la base no se sube al repositorio).
4. Correr un script suelto (cada uno carga `R/00_setup.R` por su cuenta) o todo junto con `source("R/run_all.R")`.

## Qué hace cada script

| Pregunta | Script | Qué produce |
|---|---|---|
| Configuración | `R/00_setup.R` | Carga paquetes y datos; convierte Región, Suelo y Manejo en factores |
| I – Tablas de la base | `R/I_1_tablas_base.R` | Tabla 1 (Suelo × Manejo), Tabla 2 (Región × Suelo / Manejo) y Tabla 3 (rendimiento por región; se usa también en I.3.b) |
| I.2.b | `R/I_2b_sorteo_manejo.R` | % de parcelas con manejo convencional por región |
| I.2.c | `R/I_2c_anova_tipos.R` | ANOVA tipo I en ambos órdenes, tipo II y tipo III (con contrastes de suma) |
| I.3.b y I.3.c | `R/I_3c_region_como_bloque.R` | Modelo 1 (DCA) vs. Modelo 2 (Región como bloque) y CME de cada uno |
| II.b | `R/II_b_razon_regresion.R` | Muestreo (n = 60, semilla 123), estimadores MAS, razón y regresión, IC y gráficos |
| III.a | `R/III_a_correlacion.R` | Matriz de correlación |
| III.b | `R/III_b_regresion.R` | Regresión múltiple, VIF, ANOVA tipo II y secuencial |
| III.c | `R/III_c_residuales.R` | Gráfico de residuales vs. valores ajustados |

Los gráficos se guardan en `figuras/`.

## Preguntas sin código

I.1 (identificación del diseño y ecuaciones), I.3.a (grados de libertad), I.4 (interacción), I.5 (clima y nuevo diseño) y II.a (estratificación) se responden de forma teórica en el informe.
