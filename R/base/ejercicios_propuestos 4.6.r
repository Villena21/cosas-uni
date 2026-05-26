# --- Datos ---
df <- data.frame(estatura = c(179, 173, 181, 170, 158, 174, 172, 166, 194, 185,
                               162, 187, 198, 177, 178, 165, 154, 188, 166, 171,
                               175, 182, 167, 169, 172, 186, 172, 176, 168, 187))

# --- Histograma ---
breaks_vec <- seq(150, 200, by = 10)

hist(df$estatura,
     breaks = breaks_vec,
     right  = FALSE,          # "right = FALSE" equivale a "closed = left" en ggplot
     col    = "steelblue",
     border = "black",
     main   = "Histograma de Estaturas",
     xlab   = "Estatura (cm)",
     ylab   = "Frecuencia absoluta",
     xaxt   = "n")            # desactivamos el eje X para dibujarlo manual

axis(1, at = breaks_vec)      # eje X con los mismos breaks

# --- Boxplot ---
boxplot(df$estatura,
        col      = "steelblue",
        border   = "black",
        main     = "Diagrama de Cajas - Estaturas",
        ylab     = "Estatura (cm)",
        horizontal = FALSE)