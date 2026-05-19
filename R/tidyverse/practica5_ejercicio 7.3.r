library(tidyverse)
library(broom) 
library(tidymodels)
library(samplingbook)
library(knitr)

df <- read.csv('https://aprendeconalf.es/estadistica-practicas-r/datos/biblioteca.csv')
kable(df)

frec <- table(df$respuesta)
tidy(prop.test(frec["si"], nrow(df), conf.level = 0.99)) |> 
select(estimate, conf.low, conf.high) |> 
kable()

df |> 
    group_by(sexo) |> 
    count(respuesta) |> 
    mutate(test = map(n, \(x) tidy(prop.test(x, sum(n))))) |>     
    unnest(test) |>
    filter(respuesta == "si") |> 
    select(sexo, respuesta, n, estimate, conf.low, conf.high) |>  
    kable() 