# 
# 00_setup.R - Paquetes y datos (lo usan todos los scripts)
# Ejecutar siempre desde la carpeta del proyecto (taller-4-raps/).
# Si faltan paquetes, instalarlos UNA vez desde la consola (no desde el script):
# install.packages(c("dplyr", "tidyr", "ggplot2", "car"))

library(dplyr)    # resumir datos por grupos
library(tidyr)    # pivot_wider()
library(ggplot2)  # gráficos
library(car)      # Anova() (tipos II y III) y vif()

# Datos (ruta relativa: el CSV debe estar en datos/)
Base_Datos <- read.csv("datos/Rendimiento_Raps.csv", header = TRUE)

# Region, Suelo y Manejo como factores
Base_Datos <- Base_Datos %>%
  mutate(across(c(Region, Suelo, Manejo), factor))

# Carpeta para guardar los gráficos del informe
dir.create("figuras", showWarnings = FALSE)
