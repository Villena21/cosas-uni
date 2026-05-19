# --- Carga de datos ---
df <- read.csv("https://aprendeconalf.es/bioestadistica-practicas-r/datos/neonatos.csv")
df

# ---- a) Tabla de frecuencias de apgar1 ----
ni   <- as.vector(table(df$apgar1))
vals <- as.integer(names(table(df$apgar1)))
fi   <- ni / sum(ni)
Ni   <- cumsum(ni)
Fi   <- cumsum(fi)
print(data.frame(apgar1 = vals, ni = ni, fi = fi, Ni = Ni, Fi = Fi))

# Neonatos deprimidos (apgar1 <= 3)
deprimidos <- sum(df$apgar1 <= 3, na.rm = TRUE)
porcentaje <- round(mean(df$apgar1 <= 3, na.rm = TRUE) * 100, 2)
cat("Deprimidos:", deprimidos, "| Porcentaje:", porcentaje, "%\n")

# ---- b) Tabla por grupo de edad ----
for (g in unique(df$edad)) {
  sub    <- df[df$edad == g, ]
  ni_g   <- as.vector(table(sub$apgar1))
  vals_g <- as.integer(names(table(sub$apgar1)))
  fi_g   <- ni_g / sum(ni_g)
  cat("\n--- Edad:", g, "---\n")
  print(data.frame(apgar1 = vals_g, ni = ni_g, fi = fi_g,
                   Ni = cumsum(ni_g), Fi = cumsum(fi_g)))
}

# Deprimidos (apgar1 < 7) por edad
for (g in unique(df$edad)) {
  sub <- df[df$edad == g, ]
  cat("Edad:", g,
      "| Deprimidos:", sum(sub$apgar1 < 7, na.rm = TRUE),
      "| Porcentaje:", round(mean(sub$apgar1 < 7, na.rm = TRUE) * 100, 2), "%\n")
}

# ---- c) Tabla de frecuencias de peso por intervalos ----
breaks_peso <- seq(2, 4.5, by = 0.5)
clases <- cut(df$peso, breaks = breaks_peso, right = FALSE)
ni_c   <- as.vector(table(clases))
fi_c   <- ni_c / sum(ni_c)
print(data.frame(clase = levels(clases), ni = ni_c, fi = fi_c,
                 Ni = cumsum(ni_c), Fi = cumsum(fi_c)))

# ---- d) Tabla peso por intervalos, agrupada por tabaco ----
for (t in unique(df$tabaco)) {
  sub      <- df[df$tabaco == t, ]
  clases_t <- cut(sub$peso, breaks = breaks_peso, right = FALSE)
  ni_t     <- as.vector(table(clases_t))
  fi_t     <- round(ni_t / sum(ni_t), 4)
  cat("\n--- Tabaco:", t, "---\n")
  print(data.frame(clase = levels(clases_t), ni = ni_t, fi = fi_t,
                   Ni = cumsum(ni_t), Fi = round(cumsum(fi_t), 4)))
}

# ---- e) Barplot de apgar1 ----
barplot(table(df$apgar1),
        col    = "steelblue",
        border = "white",
        main   = "Distribución de la puntuación Apgar al minuto",
        xlab   = "Puntuación Apgar",
        ylab   = "Frecuencia")

# ---- f) Función de distribución acumulada (escalera) ----
tab_acum <- table(df$apgar1)
vals_f   <- as.integer(names(tab_acum))
Fi_f     <- cumsum(as.vector(tab_acum)) / sum(tab_acum)

plot(stepfun(vals_f, c(0, Fi_f)),
     main      = "Distribución acumulada de Apgar al minuto",
     xlab      = "Apgar1",
     ylab      = "Fi",
     verticals = FALSE,
     pch       = 16)

# ---- g) Barplot frecuencias relativas de apgar1 por tabaco ----
# tabaco tiene valores "No" y "Si"
grupos_tab <- c("No", "Si")
op <- par(mfrow = c(1, 2))

for (t in grupos_tab) {
  sub  <- df[df$tabaco == t, ]
  fi_g <- prop.table(table(sub$apgar1))
  etiq <- ifelse(t == "No", "No fumadora", "Fumadora")
  barplot(fi_g,
          col    = "steelblue",
          border = "white",
          main   = etiq,
          xlab   = "Apgar",
          ylab   = "Frecuencia relativa")
}
par(op)

# ---- h) Histograma de peso ----
hist(df$peso,
     breaks = seq(2, 4.5, by = 0.5),
     right  = FALSE,
     col    = "steelblue",
     border = "white",
     main   = "Histograma de pesos de neonatos",
     xlab   = "Peso (kg)",
     ylab   = "Frecuencia")

# ---- i) Histogramas de peso por tabaco ----
op <- par(mfrow = c(1, 2))

for (t in grupos_tab) {
  sub      <- df[df$tabaco == t, ]
  etiq     <- ifelse(t == "No", "No fumadora", "Fumadora")
  clases_i <- cut(sub$peso, breaks = seq(2, 4.5, by = 0.5), right = FALSE)
  fi_i     <- prop.table(table(clases_i))
  barplot(fi_i,
          col    = "steelblue",
          border = "white",
          main   = etiq,
          xlab   = "Peso (kg)",
          ylab   = "Frecuencia relativa",
          las    = 2)
}
par(op)

# ---- j) Histogramas de peso por tabaco.antes ----
# tabaco.antes tiene valores "No" y "Si"
grupos_ta <- c("No", "Si")
op <- par(mfrow = c(1, 2))

for (ta in grupos_ta) {
  sub      <- df[df$tabaco.antes == ta, ]
  etiq     <- ifelse(ta == "No", "No fumaba antes", "Fumaba antes")
  clases_j <- cut(sub$peso, breaks = seq(2, 4.5, by = 0.5), right = FALSE)
  fi_j     <- prop.table(table(clases_j))
  barplot(fi_j,
          col    = "steelblue",
          border = "white",
          main   = etiq,
          xlab   = "Peso (kg)",
          ylab   = "Frecuencia relativa",
          las    = 2)
}
par(op)

# ---- k) Boxplot de peso ----
boxplot(df$peso,
        col        = "steelblue",
        border     = "white",
        horizontal = TRUE,
        main       = "Diagrama de caja y bigotes del peso de los neonatos",
        xlab       = "Peso (kg)",
        yaxt       = "n")

# ---- l) Boxplot de peso por tabaco y edad ----
# edad tiene valores "mayor de 20" y "menor de 20"
edades <- c("mayor de 20", "menor de 20")
op <- par(mfrow = c(1, 2))

for (e in edades) {
  sub <- df[df$edad == e, ]
  boxplot(peso ~ tabaco,
          data       = sub,
          col        = c("steelblue", "tomato"),
          border     = "grey30",
          horizontal = TRUE,
          main       = paste("Edad:", e),
          xlab       = "Peso (kg)",
          yaxt       = "n")
  axis(2, at = 1:2, labels = c("No", "Si"), las = 1)
}
par(op)

# ---- m) Boxplot comparando apgar1 vs apgar5 ----
boxplot(list(apgar1 = df$apgar1, apgar5 = df$apgar5),
        col        = c("steelblue", "tomato"),
        horizontal = TRUE,
        main       = "Comparación Apgar al minuto y a los 5 minutos",
        xlab       = "Puntuación Apgar",
        yaxt       = "n")
axis(2, at = 1:2, labels = c("apgar1", "apgar5"), las = 1)