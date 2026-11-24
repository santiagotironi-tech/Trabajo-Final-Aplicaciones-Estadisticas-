# ============================================
# III.c - Gráfico de residuales del modelo final
# ============================================
source("R/00_setup.R")

modelo_regresion_lineal <- lm(Rendimiento ~ Temp_prom + HR_prom + Pp_total, data = Base_Datos)

graficar_residuales <- function() {
  plot(fitted(modelo_regresion_lineal), resid(modelo_regresion_lineal),
       xlab = "Valores ajustados", ylab = "Residuales")
  abline(h = 0, col = "red")
}

graficar_residuales()   # en pantalla

png("figuras/III_c_residuales.png", width = 900, height = 650)   # para el informe
graficar_residuales()
dev.off()

# Opcional: normalidad de los residuales
# qqnorm(resid(modelo_regresion_lineal)); qqline(resid(modelo_regresion_lineal))
# shapiro.test(resid(modelo_regresion_lineal))
