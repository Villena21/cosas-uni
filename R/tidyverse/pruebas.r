library(tidyverse)

# ── Datos ──────────────────────────────────────────────────────────────────
Tiempo    <- c("10 - 30", "30 - 45", "45 - 60", "60 - 90", "90 - 120", "120 - 180")
Pacientes <- c(2, 11, 18, 9, 8, 2)
df <- data.frame(Tiempo, Pacientes)

# ── Tabla de frecuencias ───────────────────────────────────────────────────
lim_inf <- c(10, 30, 45, 60, 90, 120)
lim_sup <- c(30, 45, 60, 90, 120, 180)
xi      <- (lim_inf + lim_sup) / 2     # Marca de clase
n       <- sum(Pacientes)

tabla_freq <- data.frame(
  Intervalo = Tiempo,
  xi        = xi,
  fi        = Pacientes,
  Fi        = cumsum(Pacientes),
  fri       = round(Pacientes / n, 4),
  Fri       = round(cumsum(Pacientes / n), 4)
)

print(tabla_freq)

# ── Diagrama de cajas ──────────────────────────────────────────────────────
# Reconstruimos datos aproximados repitiendo cada xi según su fi
datos_aprox <- tibble(tiempo = rep(tabla_freq$xi, tabla_freq$fi))

ggplot(datos_aprox, aes(x = "", y = tiempo)) +
  geom_boxplot(fill = "#90CAF9", color = "#1565C0", linewidth = 0.8, width = 0.4) +
  labs(
    title = "Diagrama de Cajas — Tiempo de espera",
    y = "Tiempo (minutos)",
    x = NULL
  ) +
  theme_minimal(base_size = 13)