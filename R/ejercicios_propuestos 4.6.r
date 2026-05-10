library(tidyverse)
library(knitr)

df <- data.frame(estatura = c(179, 173, 181, 170, 158, 174, 172, 166, 194, 185, 162, 187, 198, 177, 178, 165, 154, 188, 166, 171, 175, 182, 167, 169, 172, 186, 172, 176, 168, 187))


df |> ggplot(aes(x = estatura)) +
    geom_histogram(binwidth = 10, fill = "steelblue", color = "black") +
    labs(title = "Distribución de la estatura", x = "Estatura (cm)", y = "Frecuencia absoluta")

# Dibujar el diagrama de cajas. ¿Existe algún dato atípico?
df |> ggplot(aes(y = estatura)) +
    geom_boxplot(fill = "steelblue", color = "black") +
    labs(title = "Diagrama de cajas de la estatura", y = "Estatura (cm)")