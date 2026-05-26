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

tidy(var.test(grasa ~ granja, data = df)) |>
    select(estimate, conf.low, conf.high) |> 
    kable()

tidy(t.test(grasa ~ granja, equal.var = TRUE, data = df)) |> 
    select(estimate, conf.low, conf.high) |> 
    kable()