library(tidyverse)
library(broom)
library(tidymodels)
library(samplingbook)
library(knitr)

df <- read.csv('https://aprendeconalf.es/estadistica-practicas-r/datos/neonatos.csv')
resumen <- head(df)
kable(resumen)

tidy(t.test(df$peso, conf.level = 0.99)) |>
select(estimate, conf.low, conf.high) |> 
    kable()

bind_rows(
    tidy(t.test(df$apgar1)) |> mutate(variable = "apgar1"),
    tidy(t.test(df$apgar5)) |> mutate(variable = "apgar5")
) |>
    select(variable, estimate, conf.low, conf.high) |>
    kable()

df2 <- df |>
    group_by(tabaco) |>
    summarise(
        menor_a_2.5 = sum(peso <= 2.5),
        n = n()
    )

tidy(prop.test(df2$menor_a_2.5, df2$n)) |>
    select(estimate1, estimate2, conf.low, conf.high) |>
    kable()