library(moments)  # única librería necesaria, para skewness() y kurtosis()

#nota: cat() es para poner texto sin formato

# --- Datos ---
fumador <- c("sí", "no", "sí", "sí", "sí", "no", "no", "sí", "no", "sí",
             "no", "sí", "no", "sí", "no", "no", "sí", "no", "no", "no",
             "sí", "no", "sí", "no", "sí")

bebedor <- c("no", "no", "sí", "sí", "no", "no", "sí", "sí", "no", "sí",
             "no", "sí", "sí", "sí", "no", "sí", "sí", "no", "no", "sí",
             "sí", "sí", "no", "sí", "no")

tension_arterial <- c(80, 92, 75, 56, 89, 93, 101, 67, 89, 63,
                      98, 58, 91, 71, 52, 98, 104, 57, 89, 70,
                      93, 69, 82, 70, 49)

df <- data.frame(Fumador = fumador, Bebedor = bebedor,
                 Tension_arterial = tension_arterial)
print(df)

# --- Función auxiliar para calcular las estadísticas de un subgrupo ---
stats_grupo <- function(x) {
  data.frame(
    media       = round(mean(x), 3),
    desv_tipica = round(sd(x), 3),
    asimetria   = round(skewness(x), 3),
    curtosis    = round(kurtosis(x), 3)
  )
}

# --- Estadísticas por Fumador ---
cat("\n=== Por Fumador ===\n")
resultado_fum <- do.call(rbind, lapply(unique(df$Fumador), function(g) {
  sub   <- df$Tension_arterial[df$Fumador == g]
  cbind(Fumador = g, stats_grupo(sub))
}))
print(resultado_fum)

# --- Estadísticas por Bebedor ---
cat("\n=== Por Bebedor ===\n")
resultado_beb <- do.call(rbind, lapply(unique(df$Bebedor), function(g) {
  sub <- df$Tension_arterial[df$Bebedor == g]
  cbind(Bebedor = g, stats_grupo(sub))
}))
print(resultado_beb)

# --- Estadísticas por Fumador x Bebedor ---
cat("\n=== Por Fumador x Bebedor ===\n")
combis <- unique(df[, c("Fumador", "Bebedor")])
resultado_combo <- do.call(rbind, lapply(seq_len(nrow(combis)), function(i) {
  f   <- combis$Fumador[i]
  b   <- combis$Bebedor[i]
  sub <- df$Tension_arterial[df$Fumador == f & df$Bebedor == b]
  cbind(Fumador = f, Bebedor = b, stats_grupo(sub))
}))
print(resultado_combo)