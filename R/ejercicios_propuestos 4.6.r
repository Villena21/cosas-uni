library(tidyverse)
library(knitr)

df <- data.frame(estatura = c(179, 173, 181, 170, 158, 174, 172, 166, 194, 185, 162, 187, 198, 177, 178, 165, 154, 188, 166, 171, 175, 182, 167, 169, 172, 186, 172, 176, 168, 187))


ggplot(df, aes(x = estatura)) +
  geom_histogram(breaks = seq(150, 200, by = 10),
                 closed = "left",
                 fill = "steelblue",
                 color = "black") +
  scale_x_continuous(breaks = seq(150, 200, by = 10)) +
  labs(title = "Histograma de Estaturas",
       x = "Estatura (cm)",
       y = "Frecuencia absoluta") +
  theme_minimal()


ggplot(df, aes(y = estatura)) +
  geom_boxplot(fill = "steelblue", color = "black") +  # ← aquí!!
  labs(title = "Diagrama de Cajas - Estaturas",
       y = "Estatura (cm)") +
    theme_minimal()