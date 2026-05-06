library(tidyverse)
library(knitr)
df <- read.csv("https://aprendeconalf.es/estadistica-practicas-r/datos/colesterol.csv")
head(df)

df <- df |> mutate(imc = round(peso/altura^2))
head(df)


df <- df |>
    mutate(Obesidad = cut(imc, breaks = c(0, 18.5, 24.5, 30, Inf), labels = c("Bajo peso", "Saludable", "Sobrepeso", "Obeso")))
head(df)

df <- df |>
    mutate(Obesidad = cut(imc, breaks = c(0, 18.5, 24.5, 30, Inf), labels = c("Bajo peso", "Saludable", "Sobrepeso", "Obeso")))
head(df)

df <- df |> select(-nombre)
df

df |> select(nombre, sexo, edad, everything())


df |> filter(sexo == "M")


df |> filter(sexo == "H" & edad > 30)

drop_na(df)

df |> filter(!is.na(colesterol))

df <- df |>
    mutate(colesterol = if_else(is.na(colesterol), mean(colesterol, na.rm = TRUE), colesterol))
df

df |> arrange(nombre)

df |> arrange(sexo, desc(edad))