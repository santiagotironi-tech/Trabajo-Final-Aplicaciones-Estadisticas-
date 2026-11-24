# ============================================
# II.b - Muestreo de razón y regresión (Temperatura vs. Rendimiento)
# ============================================
# Las 450 parcelas se tratan como la población. Se extrae una muestra aleatoria
# simple y se estima la media de Rendimiento (y) usando la temperatura (x),
# cuya media poblacional se considera conocida.
source("R/00_setup.R")

N <- nrow(Base_Datos)
X_media <- mean(Base_Datos$Temp_prom)    # media poblacional de x (conocida)
Y_media <- mean(Base_Datos$Rendimiento)  # "verdad", solo para comparar

set.seed(123)
n <- 60
muestra <- Base_Datos[sample(N, n), ]
f <- n / N

# y = variable de interés (Rendimiento); x = variable auxiliar (Temp_prom)
y <- muestra$Rendimiento
x <- muestra$Temp_prom

# --- 1. ¿Conviene razón o regresión? (correlación, intersección y gráfico) ---
cor(Base_Datos$Temp_prom, Base_Datos$Rendimiento)
summary(lm(Rendimiento ~ Temp_prom, data = Base_Datos))  # mirar la intersección

g_ajuste <- ggplot(Base_Datos, aes(Temp_prom, Rendimiento)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "lm", formula = y ~ x) +                          # regresión
  geom_smooth(method = "lm", formula = y ~ x - 1, color = "red") +       # razón (por el origen)
  labs(title = "Regresión (azul) vs. razón (rojo, recta por el origen)") +
  theme_minimal()
print(g_ajuste)
ggsave("figuras/II_b_razon_vs_regresion.png", g_ajuste, width = 7, height = 5)

# --- 2. Estimador de MAS (referencia) ---
y_mas  <- mean(y)
EE_mas <- sqrt((1 - f) / n * var(y))

# --- 3. Estimador de razón ---
R        <- mean(y) / mean(x)
y_razon  <- R * X_media
EE_razon <- sqrt((1 - f) / n * sum((y - R * x)^2) / (n - 1))

# --- 4. Estimador de regresión ---
b      <- cov(x, y) / var(x)
y_reg  <- mean(y) + b * (X_media - mean(x))
EE_reg <- sqrt((1 - f) / n * sum((y - mean(y) - b * (x - mean(x)))^2) / (n - 2))

# --- 5. Tabla comparativa ---
resultados <- data.frame(
  Metodo     = c("MAS", "Razón", "Regresión"),
  Estimacion = c(y_mas, y_razon, y_reg),
  EE         = c(EE_mas, EE_razon, EE_reg)
) %>%
  mutate(IC_inf = Estimacion - 1.96 * EE,
         IC_sup = Estimacion + 1.96 * EE,
         Error_vs_real = Estimacion - Y_media,
         Eficiencia_vs_MAS = EE_mas^2 / EE^2)
print(resultados)
Y_media  # media real de las 450 parcelas

# --- 6. Gráfico: muestra sobre la población ---
Base_Datos$Seleccionada <- ifelse(rownames(Base_Datos) %in% rownames(muestra),
                                  "Muestra", "Población")

g_muestra <- ggplot(Base_Datos, aes(Temp_prom, Rendimiento,
                                    color = Seleccionada, alpha = Seleccionada, size = Seleccionada)) +
  geom_point() +
  scale_color_manual(values = c("Población" = "grey60", "Muestra" = "red")) +
  scale_alpha_manual(values = c("Población" = 0.4, "Muestra" = 1)) +
  scale_size_manual(values = c("Población" = 1.5, "Muestra" = 2.5)) +
  labs(title = "Muestra (n = 60) sobre la población (N = 450)") +
  theme_minimal()
print(g_muestra)
ggsave("figuras/II_b_muestra_sobre_poblacion.png", g_muestra, width = 7, height = 5)

# --- 7. Gráfico: estimaciones con IC 95 % frente a la media real ---
g_ic <- ggplot(resultados, aes(Metodo, Estimacion)) +
  geom_point(size = 3) +
  geom_errorbar(aes(ymin = IC_inf, ymax = IC_sup), width = 0.15) +
  geom_hline(yintercept = Y_media, linetype = "dashed", color = "red") +
  labs(title = "Estimación de la media de rendimiento (IC 95 %)",
       subtitle = "Línea roja: media real de las 450 parcelas",
       y = "Rendimiento (kg/ha)") +
  theme_minimal()
print(g_ic)
ggsave("figuras/II_b_estimaciones_IC.png", g_ic, width = 7, height = 5)
