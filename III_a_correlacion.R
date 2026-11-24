
# III.a - Matriz de correlación

source("R/00_setup.R")

vars <- Base_Datos %>%
  dplyr::select(Temp_prom, HR_prom, Pp_total, Rendimiento)

matriz_corr <- round(cor(vars), 3)
print(matriz_corr)

# Opcional: diagramas de dispersión de todos los pares
# pairs(vars)
