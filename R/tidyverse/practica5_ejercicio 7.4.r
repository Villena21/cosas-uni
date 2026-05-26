library(tidyverse)
library(broom) 
library(tidymodels)
library(samplingbook)
library(knitr)

tidy(prop.test(88, 200)) |> 
select(estimate, conf.low, conf.high) |> 
mutate(across(everything(), ~ .x * 100)) |> 
kable()

sample.size.prop(e = 0.01, P = 88/200, level = 0.95)