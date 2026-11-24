# ============================================
# I.2.b - % de parcelas con manejo convencional por región
# ============================================
# Si el manejo se hubiera sorteado dentro de cada región, cada una tendría
# exactamente 50 % (75 de 150). Que no sea así indica un sorteo sobre las 450
# parcelas en conjunto (DCA).
source("R/00_setup.R")

tabla_4 <- Base_Datos %>%
  group_by(Region) %>%
  summarise(
    `Parcelas con manejo convencional` = sum(Manejo == "Convencional"),
    `Total de parcelas` = n(),
    `% convencional` = round(`Parcelas con manejo convencional` / `Total de parcelas` * 100, 1)
  )
print(tabla_4)
