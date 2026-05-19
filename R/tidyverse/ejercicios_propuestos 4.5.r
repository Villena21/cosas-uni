library(tidyverse)
library(knitr)

df <- data.frame(lesiones = c(0, 1, 2, 1, 3, 0, 1, 0, 1, 2, 0, 1, 1, 1, 2, 0, 1, 3, 2, 1, 2, 1, 0, 1))
df

df |> count(lesiones, name = "ni") |> 
    mutate(fi = ni / sum(ni), Ni = cumsum(ni), Fi = cumsum(ni) / sum(ni)) |>
    kable()

df |> ggplot(aes(x = lesiones)) +
    geom_bar(aes(y = after_stat(count/sum(count))), fill = "steelblue") +
    labs(title = "Distribución del número de lesiones", y = "Frecuencia absoluta")

df |> count(lesiones, name = "ni") |> 
    ggplot(aes(x = "", y = ni, fill = factor(lesiones))) +
    geom_bar(stat = "identity", width = 1) +
    coord_polar(theta = "y") +
    labs(title = "Distribución del número de lesiones", fill = "Número de lesiones") +
    theme_void()

