library(moments)    # skewness, kurtosis
library(DescTools)  # Mode

df <- read.csv("https://aprendeconalf.es/bioestadistica-practicas-r/datos/neonatos.csv")
print(head(df))

# ---- a) Media y mediana del peso ----
cat("Media:  ", round(mean(df$peso), 4), "\n")
cat("Mediana:", round(median(df$peso), 4), "\n")

# ---- b) Peso medio por tabaco y (no fumadoras) por tabaco.antes ----
cat("\n=== Peso medio por tabaco ===\n")
for (t in c("No", "Si")) {
  sub <- df$peso[df$tabaco == t]
  cat("Tabaco:", t, "| Media:", round(mean(sub, na.rm = TRUE), 3), "\n")
}

cat("\n=== Peso medio por tabaco.antes (solo No fumadoras) ===\n")
df_no <- df[df$tabaco == "No", ]
for (ta in c("No", "Si")) {
  sub <- df_no$peso[df_no$tabaco.antes == ta]
  cat("Tabaco.antes:", ta, "| Media:", round(mean(sub, na.rm = TRUE), 3), "\n")
}

# ---- c) Moda de apgar1 ----
moda <- Mode(df$apgar1)
cat("\nModa apgar1:", moda, "\n")

# ---- d) Media de la diferencia apgar5 - apgar1 ----
cat("\nMedia diferencia apgar5 - apgar1:",
    round(mean(df$apgar5 - df$apgar1, na.rm = TRUE), 3), "\n")

# ---- e) Cuartiles del peso ----
cat("\n=== Cuartiles del peso ===\n")
print(round(quantile(df$peso, probs = c(0.25, 0.50, 0.75)), 3))

# ---- f) Cuartiles del peso por sexo ----
cat("\n=== Cuartiles del peso por sexo ===\n")
for (s in unique(df$sexo)) {
  sub <- df$peso[df$sexo == s]
  cat("Sexo:", s, "\n")
  print(round(quantile(sub, probs = c(0.25, 0.50, 0.75)), 3))
}

# ---- g) Percentil 90 del peso ----
cat("\nPercentil 90:", round(quantile(df$peso, probs = 0.90), 3), "\n")

# ---- h) Percentil 5 del peso ----
cat("Percentil 5: ", round(quantile(df$peso, probs = 0.05), 3), "\n")

# ---- i) Recorrido e IQR del peso ----
Q1        <- round(quantile(df$peso, 0.25), 3)
Q3        <- round(quantile(df$peso, 0.75), 3)
IQR_peso  <- Q3 - Q1
recorrido <- round(max(df$peso) - min(df$peso), 3)

print(data.frame(recorrido = recorrido, IQR = IQR_peso))

# ---- j) Desviación típica y varianza del peso (bug corregido) ----
desviacion <- round(sd(df$peso, na.rm = TRUE), 3)
varianza   <- round(desviacion^2, 3)          # corregido: era desviacion**desviacion

print(data.frame(desviacion = desviacion, varianza = varianza))

# ---- k) Media, desv. típica y CV del peso por tabaco ----
cat("\n=== Estadísticas de peso por tabaco ===\n")
for (t in c("No", "Si")) {
  sub <- df$peso[df$tabaco == t]
  m   <- mean(sub, na.rm = TRUE)
  s   <- sd(sub, na.rm = TRUE)
  cat("Tabaco:", t,
      "| Media:", round(m, 3),
      "| SD:", round(s, 3),
      "| CV:", round(s / m * 100, 3), "%\n")
}

# ---- l) y m) CV de peso y apgar1 (idénticos en el original) ----
cat("\n=== Coeficientes de variación ===\n")
cv <- function(x) round(sd(x, na.rm = TRUE) / mean(x, na.rm = TRUE) * 100, 3)
print(data.frame(CV_peso = cv(df$peso), CV_apgar1 = cv(df$apgar1)))

# ---- n) Asimetría del peso por edad ----
cat("\n=== Asimetría del peso por edad ===\n")
for (e in c("mayor de 20", "menor de 20")) {
  sub <- df$peso[df$edad == e]
  cat("Edad:", e, "| Asimetría:", round(skewness(sub, na.rm = TRUE), 3), "\n")
}

# ---- o) Apuntamiento del peso por sexo ----
cat("\n=== Apuntamiento del peso por sexo ===\n")
for (s in unique(df$sexo)) {
  sub <- df$peso[df$sexo == s]
  cat("Sexo:", s, "| Curtosis:", round(kurtosis(sub, na.rm = TRUE), 3), "\n")
}

# ---- p) Asimetría y apuntamiento de apgar1 y cigarros ----
cat("\n=== Forma de la distribución: apgar1 y cigarros ===\n")
print(data.frame(
  asimetria_apgar1      = round(skewness(df$apgar1,   na.rm = TRUE), 3),
  apuntamiento_apgar1   = round(kurtosis(df$apgar1,   na.rm = TRUE), 3),
  asimetria_cigarros    = round(skewness(df$cigarros, na.rm = TRUE), 3),
  apuntamiento_cigarros = round(kurtosis(df$cigarros, na.rm = TRUE), 3)
))