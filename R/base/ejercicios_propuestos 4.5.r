# --- Datos ---
df <- data.frame(lesiones = c(0, 1, 2, 1, 3, 0, 1, 0, 1, 2, 0, 1, 1, 1, 2, 0, 1, 3, 2, 1, 2, 1, 0, 1))
df

# --- Tabla de frecuencias ---
ni <- as.vector(table(df$lesiones))
lesiones_vals <- as.integer(names(table(df$lesiones)))
fi <- ni / sum(ni)
Ni <- cumsum(ni)
Fi <- cumsum(fi)

tabla_freq <- data.frame(lesiones = lesiones_vals, ni = ni, fi = fi, Ni = Ni, Fi = Fi)
print(tabla_freq)

# --- Gráfico de barras (frecuencias relativas) ---
freq_rel <- table(df$lesiones) / nrow(df)

barplot(freq_rel,
        col  = "steelblue",
        main = "Distribución del número de lesiones",
        xlab = "lesiones",
        ylab = "Frecuencia relativa")

# --- Gráfico de tarta ---
ni_vec <- table(df$lesiones)

pie(ni_vec,
    labels = paste("Lesiones:", names(ni_vec)),
    main   = "Distribución del número de lesiones")