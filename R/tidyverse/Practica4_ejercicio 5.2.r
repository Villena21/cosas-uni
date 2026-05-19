library(tidyverse)
library(knitr)
library(DescTools)
library(moments)
library(skimr)
library(vtable)

df <- read.csv("https://aprendeconalf.es/estadistica-practicas-r/datos/colesterol.csv")

glimpse(df)

skim(df)

count(df, sexo) |> kable()

media <- mean(df$colesterol, na.rm = TRUE)
desviacion <- sd(df$colesterol, na.rm = TRUE)

round(media, digits = 4)
round(desviacion, digits = 4)

summary(df)

df |> select(where(is.numeric)) |>
    # Pivotamos el data frame a formato largo.
    pivot_longer(everything(), names_to = "Variable", values_to = "Valor") |>
    # Agrupamos por variable.
    group_by(Variable) |>
    # Calculamos la media, desviación típica y coeficiente de variación.
    summarise("Media" = mean(Valor, na.rm = TRUE), 
    "Desviación Típica" = sd(Valor, na.rm = TRUE),
    "Coef. Variación" = sd(Valor, na.rm = T) / mean(Valor, na.rm = T) * 100) |>
    # Mostramos el resultado en una tabla.
    kable()

# Seleccionamos las variables peso y altura.
df |> select(sexo, peso, altura) |>
# Agrupamos por sexo.
group_by(sexo) |>
# Calculamos los coeficientes de asimetria y apuntamiento para cada grupo.
summarise(across(.cols = everything(), .fns = list("Coef. Asimetría" = ~ skewness(.x, na.rm = TRUE), "Coef. Apuntamiento" = ~ kurtosis(.x, na.rm = TRUE)))) |>
kable()