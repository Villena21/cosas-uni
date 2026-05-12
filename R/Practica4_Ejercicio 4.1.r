library(tidyverse) 
library(knitr)

df <- data.frame(urgencias = c(15, 23, 12, 10, 28, 50, 12, 17, 20, 21, 18, 13, 11, 12, 26, 30, 6, 16, 19, 22, 14, 17, 21, 28, 9, 16, 13, 11, 16, 20))

df |> ggplot(aes(x = urgencias)) +
    # Añadimos la geometría de cajas.
    geom_boxplot(fill = "steelblue") +
    # Eliminamos las marcas del eje y.
    scale_y_continuous(breaks = NULL) +
    # Añadimos el título y las etiquetas.
    labs(title = "Distribución del número de urgencias", x = "Número de urgencias")


# Eliminar el dato atípico
df_sin_atipicos <- df |> filter(urgencias != 50)

# Número de observaciones antes y después
n_antes <- nrow(df)
n_despues <- nrow(df_sin_atipicos)

# Diagrama de cajas sin atípicos
df_sin_atipicos |> ggplot(aes(x = urgencias)) +
    # Añadimos la geometría de cajas.
    geom_boxplot(fill = "steelblue") +
    # Eliminamos las marcas del eje y.
    scale_y_continuous(breaks = NULL) +
    # Añadimos el título y las etiquetas.
    labs(title = "Distribución del número de urgencias", x = "Número de urgencias")

# Estadísticas descriptivas
df_sin_atipicos |>
  summarise(
    n = n(),
    media = mean(urgencias),
    mediana = median(urgencias),
    desv_est = sd(urgencias),
    min = min(urgencias),
    max = max(urgencias),
    Q1 = quantile(urgencias, 0.25),
    Q3 = quantile(urgencias, 0.75)
  ) |>
kable(
    digits = 2,
    caption = "Estadísticas descriptivas de urgencias (sin atípicos)",
    col.names = c("n", "Media", "Mediana", "Desv. Est.", "Mínimo", "Máximo", "Q1", "Q3")
  )

