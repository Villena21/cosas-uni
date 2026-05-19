library(tidyverse)
library(broom) 
library(tidymodels)
library(samplingbook)
library(knitr)

df <- tibble(
    grasa = c(3.4, 3.2, 3.3, 3.2, 3.3, 3.1, 3.4, 3.5, 3.3, 3.2, 3.0, 3.2, 2.8, 3.0, 3.2, 2.9, 3.1, 2.9, 3.3, 3.2, 2.9, 3.2, 3.1, 2.9, 3.2, 3.1, 3.2, 3.3),
    granja = factor(c(rep("X", 12), rep("Y", 16)))
)
kable(df)

tabla_ic <- df |> 
    group_by(granja) |>
    summarise(
        estimate   = mean(grasa, na.rm = TRUE), 
        conf.low   = t.test(grasa)$conf.int[1], 
        conf.high  = t.test(grasa)$conf.int[2]
    )

tabla_ic |> kable()

tabla_ic |>
    ggplot(aes(x = granja, y = estimate, color = granja)) +
    geom_point(size = 3) +
    geom_errorbar(aes(ymin = conf.low, ymax = conf.high), width = 0.2) +
    labs(title = "Intervalos de confianza del 95% para la media",
         x = "Granja", y = "Porcentaje de grasa")


tabla_ic_99 <- df |> 
    group_by(granja) |>
    summarise(
        estimate   = mean(grasa, conf.level = 0.99, na.rm = TRUE), 
        conf.low   = t.test(grasa)$conf.int[1], 
        conf.high  = t.test(grasa)$conf.int[2]
    )

tabla_ic_99 |>
    ggplot(aes(x = granja, y = estimate, color = granja)) +
    geom_point(size = 3) +
    geom_errorbar(aes(ymin = conf.low, ymax = conf.high), width = 0.2) +
    labs(title = "Intervalos de confianza del 95% para la media",
         x = "Granja", y = "Porcentaje de grasa")