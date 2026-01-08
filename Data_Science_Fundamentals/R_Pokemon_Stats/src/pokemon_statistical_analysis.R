# ==============================================================================
# Título: Análisis Estadístico Inferencial de Pokémon (Gen 1-4 vs Gen 5-8)
# Autor: Francisco Solís Pedraza
# Descripción: Comparación de medias, análisis de distribuciones y 
#              regresión lineal para detectar "Power Creep".
# ==============================================================================

# 1. Carga de Librerías y Datos ------------------------------------------------
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse, nortest, lmtest, car, e1071)

# Cargar datos asegurando tipos correctos
data <- read_csv("../data/pokemon_final.csv", show_col_types = FALSE) %>%
  mutate(generation = as.character(generation))

# 2. Funciones Personalizadas --------------------------------------------------

# Función para obtener un resumen estadístico completo
get_descriptive_stats <- function(x) {
  c(
    Media = mean(x, na.rm = TRUE),
    Mediana = median(x, na.rm = TRUE),
    SD = sd(x, na.rm = TRUE),
    Varianza = var(x, na.rm = TRUE),
    Min = min(x, na.rm = TRUE),
    Max = max(x, na.rm = TRUE),
    Rango = max(x, na.rm = TRUE) - min(x, na.rm = TRUE),
    Asimetria = e1071::skewness(x, na.rm = TRUE) # Usamos librería para robustez
  )
}

# 3. Segmentación de Muestras --------------------------------------------------

# Definimos las columnas de interés numérico
stat_cols <- c("hp", "attack", "defense", "sp_attack", "sp_defense", "speed")

# Muestra 1: Generaciones Clásicas (1-4)
M1 <- data %>% 
  filter(generation %in% c("1", "2", "3", "4"))

# Muestra 2: Generaciones Modernas (5-8)
M2 <- data %>% 
  filter(generation %in% c("5", "6", "7", "8"))

# 4. Estadística Descriptiva ---------------------------------------------------

print("--- Estadísticas Descriptivas: Gen 1-4 ---")
stats_m1 <- apply(M1[stat_cols], 2, get_descriptive_stats)
print(t(stats_m1)) # Transponemos para facilitar lectura

print("--- Estadísticas Descriptivas: Gen 5-8 ---")
stats_m2 <- apply(M2[stat_cols], 2, get_descriptive_stats)
print(t(stats_m2))

# Visualización comparativa de Ataque
data %>%
  mutate(Era = ifelse(generation %in% 1:4, "Clásica (1-4)", "Moderna (5-8)")) %>%
  ggplot(aes(x = attack, fill = Era)) +
  geom_density(alpha = 0.5) +
  theme_minimal() +
  labs(title = "Distribución de Ataque por Era", x = "Ataque", y = "Densidad")

# 5. Inferencia: Modelo de Regresión Lineal ------------------------------------
# Hipótesis: ¿El HP predice el Ataque en la era Clásica?
# Modelo: Attack = B0 + B1*HP + e

model <- lm(attack ~ hp, data = M1)

print("--- Resumen del Modelo de Regresión (M1) ---")
summary(model)

# 6. Diagnóstico de Residuos ---------------------------------------------------

residuals <- model$residuals

# A) Normalidad (Lilliefors / Kolmogorov-Smirnov)
# H0: Los residuos son normales.
norm_test <- lillie.test(residuals)
print(norm_test)

# B) Homocedasticidad (Breusch-Pagan)
# H0: Varianza constante.
het_test <- bptest(model)
print(het_test)

# C) Independencia (Durbin-Watson)
# H0: No hay autocorrelación.
dw_test <- durbinWatsonTest(model)
print(dw_test)

# Gráficos de diagnóstico
par(mfrow = c(2, 2))
plot(model)
par(mfrow = c(1, 1))

# 7. Correlación No Paramétrica (Spearman) -------------------------------------
# Usamos Spearman dado que los datos biológicos/juegos raramente son normales
cor_spearman <- cor.test(M1$attack, M1$hp, method = "spearman")
print(cor_spearman)

cat("Análisis finalizado.")
