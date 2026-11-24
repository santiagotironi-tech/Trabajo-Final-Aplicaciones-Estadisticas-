
# III.b - Regresión lineal múltiple y ANOVA

# Rendimiento (respuesta) ~ Temp_prom + HR_prom + Pp_total
source("R/00_setup.R")

modelo_regresion_lineal <- lm(Rendimiento ~ Temp_prom + HR_prom + Pp_total, data = Base_Datos)
summary(modelo_regresion_lineal)   # coeficientes, R2, error estándar residual

car::vif(modelo_regresion_lineal)                    # multicolinealidad
car::Anova(modelo_regresion_lineal, type = "II")     # no depende del orden: usar para decidir
anova(modelo_regresion_lineal)                       # secuencial: depende del orden

