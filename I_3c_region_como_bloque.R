# ============================================
# I.3.b y I.3.c - ¿Región es un buen bloque?
# ============================================
# I.3.b usa la Tabla 3 (ver I_1_tablas_base.R): medias entre regiones vs DE dentro.
# I.3.c compara el Modelo 1 (DCA) con el Modelo 2 (Región como bloque).
source("R/00_setup.R")

m1 <- lm(Rendimiento ~ Suelo * Manejo, data = Base_Datos)            # Modelo 1
m2 <- lm(Rendimiento ~ Region + Suelo * Manejo, data = Base_Datos)   # Modelo 2

anova(m1)
anova(m2)

# CME del error de cada modelo (SC error / GL error)
c(CME_M1 = deviance(m1) / df.residual(m1),
  CME_M2 = deviance(m2) / df.residual(m2))
