library(tidyverse)
library(knitr)
library(moments)
# Aquí tienes los vectores con todos los datos
fumador <- c("sí", "no", "sí", "sí", "sí", "no", "no", "sí", "no", "sí", 
             "no", "sí", "no", "sí", "no", "no", "sí", "no", "no", "no", 
             "sí", "no", "sí", "no", "sí")

bebedor <- c("no", "no", "sí", "sí", "no", "no", "sí", "sí", "no", "sí", 
             "no", "sí", "sí", "sí", "no", "sí", "sí", "no", "no", "sí", 
             "sí", "sí", "no", "sí", "no")

tension_arterial <- c(80, 92, 75, 56, 89, 93, 101, 67, 89, 63, 
                      98, 58, 91, 71, 52, 98, 104, 57, 89, 70, 
                      93, 69, 82, 70, 49)


df <- data.frame(
  Fumador = fumador,
  Bebedor = bebedor,
  Tension_arterial = tension_arterial
)
df |> kable()

df |> 
  group_by(Fumador) |> 
  summarise(
    media            = round(mean(Tension_arterial), 3),
    desv_tipica      = round(sd(Tension_arterial), 3),
    asimetria        = round(skewness(Tension_arterial), 3),
    curtosis         = round(kurtosis(Tension_arterial), 3)
  ) |> 
  kable()

df |> 
  group_by(Bebedor) |> 
  summarise(
    media            = round(mean(Tension_arterial), 3),
    desv_tipica      = round(sd(Tension_arterial), 3),
    asimetria        = round(skewness(Tension_arterial), 3),
    curtosis         = round(kurtosis(Tension_arterial), 3)
  ) |> 
  kable()

df |> 
  group_by(Fumador, Bebedor) |> 
  summarise(
    media       = round(mean(Tension_arterial), 3),
    desv_tipica = round(sd(Tension_arterial), 3),
    asimetria   = round(skewness(Tension_arterial), 3),
    curtosis    = round(kurtosis(Tension_arterial), 3),
    .groups = "drop"
  ) |> 
  kable()