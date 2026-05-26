library(tidyverse)
library(broom)
library(tidymodels)
library(samplingbook)
library(knitr)

tidy(prop.test(c(55, 32), c(80, 90))) |> 
    select(estimate1, estimate2, conf.low, conf.high) |> 
    mutate(across(everything(), ~ .x * 100)) |>
    kable()