
# I.2.c - Balance y ANOVA tipo I, II y III

# Con desbalance, el tipo I (secuencial) depende del orden de los factores.
source("R/00_setup.R")

# Contrastes de suma: necesarios para que el tipo III sea interpretable
options(contrasts = c("contr.sum", "contr.poly"))

# Tipo I (secuencial): comparar los dos órdenes
m_SM <- lm(Rendimiento ~ Suelo * Manejo, data = Base_Datos)
m_MS <- lm(Rendimiento ~ Manejo * Suelo, data = Base_Datos)
anova(m_SM)
anova(m_MS)   # cambian las SC de Suelo y Manejo; la de la interacción no

# Tipo II y III (no dependen del orden)
car::Anova(m_SM, type = "II")
car::Anova(m_SM, type = "III")   # ignorar la fila (Intercept)
