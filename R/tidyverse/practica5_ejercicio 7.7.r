library(tidyverse)
library(broom)
library(tidymodels)
library(samplingbook)
library(knitr)

df <- read.csv('https://aprendeconalf.es/estadistica-practicas-r/datos/biblioteca.csv')
kable(df)

df2 <- df |>
    group_by(sexo) |>
    count(respuesta, name = "frec") |>
    mutate(n = sum(frec)) |>
    filter(respuesta == "si")

tidy(prop.test(df2$frec, df2$n)) |>
    select(estimate1, estimate2, conf.low, conf.high) |>
    kable()