library(tidyverse)
library(broom)
library(tidymodels)
library(samplingbook)
library(knitr)

df <- tibble(
  maquina = c("Máquina 1", "Máquina 2"),
  defectuosas = c(12, 10),
  n = c(200, 300)
)

kable(df)

tidy(prop.test(df$defectuosas, df$n, conf.level = 0.90)) |>
  select(estimate1, estimate2, conf.low, conf.high) |>
  kable()