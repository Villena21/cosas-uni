library(tidyverse)
library(broom) 
library(tidymodels)
library(samplingbook)
library(knitr)

df <- data.frame(
    antes = c(147, 163, 121, 205, 132, 190, 176, 147),
    después = c(150, 171, 132, 208, 141, 184, 182, 145))

df |> 
    summarize(across(antes:después, ~ mean(.x, na.rm = TRUE))) |> 
    rename(`Ventas medias antes` = antes, `Ventas medias después` = después) |> 
    kable()

df$incremento <- df$después - df$antes
tidy(t.test(df$incremento)) |> 
    select(estimate, conf.low, conf.high) |> 
    kable()

df <- rbind(df, c(155, 170, 170-155), c(160, 180, 180 - 160))
tidy(t.test(df$incremento)) |>
    select(estimate, conf.low, conf.high) |>
    kable()