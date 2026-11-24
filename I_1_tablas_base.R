# ============================================
# I - Tablas de la base (Tablas 1, 2 y 3)
# ============================================
# Solo conteos, medias y desviaciones estándar. Se usan en I.2 y I.3.
source("R/00_setup.R")

# Tabla 1. Número de parcelas por combinación Suelo x Manejo
tabla_1 <- Base_Datos %>%
  count(Suelo, Manejo) %>%
  pivot_wider(names_from = Manejo, values_from = n, values_fill = 0) %>%
  mutate(Total = Convencional + Organico)
print(tabla_1)

# Tabla 2. Número de parcelas por combinación Region x Suelo / Manejo
tabla_2 <- Base_Datos %>%
  count(Region, Suelo, Manejo) %>%
  pivot_wider(
    names_from = c(Suelo, Manejo),
    names_sep = " / ",
    values_from = n,
    values_fill = 0
  ) %>%
  mutate(Total = rowSums(across(where(is.numeric))))
print(tabla_2)

# Tabla 3. Rendimiento por región (media, DE, mínimo y máximo)
tabla_3 <- Base_Datos %>%
  group_by(Region) %>%
  summarise(n = n(),
            Media = mean(Rendimiento),
            DE = sd(Rendimiento),
            Minimo = min(Rendimiento),
            Maximo = max(Rendimiento))
print(tabla_3)
