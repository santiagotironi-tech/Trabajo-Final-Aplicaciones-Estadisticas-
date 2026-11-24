# ============================================
# run_all.R - Ejecuta todos los análisis en orden
# ============================================
# Desde la carpeta del proyecto: source("R/run_all.R")
for (script in c("R/I_1_tablas_base.R",
                 "R/I_2b_sorteo_manejo.R",
                 "R/I_2c_anova_tipos.R",
                 "R/I_3c_region_como_bloque.R",
                 "R/II_b_razon_regresion.R",
                 "R/III_a_correlacion.R",
                 "R/III_b_regresion.R",
                 "R/III_c_residuales.R")) {
  cat("\n========== ", script, " ==========\n")
  source(script, echo = FALSE, print.eval = TRUE)
}
