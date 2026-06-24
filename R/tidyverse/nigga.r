library(tidyverse)
# Incluye los siguientes paquetes:
# - readr: para la lectura de datos.
# - dplyr: para el preprocesamiento y manipulación de datos.
# - ggplot2: para la representación gráfica.
library(broom) # para convertir las listas con los resúmenes de los modelos de regresión a formato organizado.
library(tidymodels) # para realizar contrastes de hipótesis en formato tidy.
library(samplingbook) # para el cálculo de tamaños muestrales.
library(knitr) # para el formateo de tablas.

df <- read.csv('https://aprendeconalf.es/estadistica-practicas-r/datos/neonatos.csv')
df

intervalo99 <- t.test(df$peso, conf.level = 0.99)
intervalo99

print('Intervalo del 95% para el apgar1:')
intervalo95_1 <- t.test(df$apgar1, conf.level = 0.95)
intervalo95_1

print('Intervalo del 95% para el apgar5:')
intervalo95_2 <- t.test(df$apgar5, conf.level = 0.95)
intervalo95_2

peso_95 <- df |>
  filter(df$peso <= 2.5)

intervalo95_3 <- t.test(peso_95$peso, conf.level = 0.95)
intervalo95_3

bajo_peso <- df$peso <= 2.5



prop.test(c(12, 10), c(200, 300), conf.level = 0.90)