library(tidyverse)
library(knitr)
library(moments)
library(DescTools)

df <- read.csv('https://aprendeconalf.es/bioestadistica-practicas-r/datos/neonatos.csv')
resumen <- head(df)
kable(resumen)

# a

media <- mean(df$peso)
round(media, digits = 4)

mediana <- median(df$peso)
round(mediana, digits = 4)

#b

df |>
  group_by(tabaco) |>
  summarise(peso_medio = mean(peso, na.rm = TRUE)) |>
  kable()
df |>
  filter(tabaco == "No") |>
  group_by(tabaco.antes) |>
  summarise(peso_medio = mean(peso, na.rm = TRUE)) |>
  kable()

#c

moda <- Mode(df$apgar1)
moda

#d

df |>
  summarise(media_diff_apgar = round(mean(apgar5 - apgar1, na.rm = TRUE), 3)) |>
  kable()

# e
cuartil <- quantile(df$peso, prob = c(0.25, 0.5, 0.75))
cuartil <- round(cuartil, digits = 3)
kable(cuartil)

# f
cuartilsexo <- df |>
  group_by(sexo) |>
  summarise(
    Q1 = round(quantile(peso, 0.25), 3),
    Q2 = round(quantile(peso, 0.50), 3),
    Q3 = round(quantile(peso, 0.75), 3)
  )
kable(cuartilsexo)

#g

percentil90 <- quantile(df$peso, prob = 0.90)
percentil90 <- round(percentil90, digits = 3)
kable(percentil90)

#h

percentil5 <- quantile(df$peso, prob = 0.05)
percentil5 <- round(percentil5, digits = 3)
kable(percentil5)

#i

Q1 <- round(quantile(df$peso, 0.25), 3)
Q3 <- round(quantile(df$peso, 0.75), 3)

IQR <- Q3 - Q1

recorrido <- round(max(df$peso) - min(df$peso), 3)

tabla_dispersion <- data.frame(
  recorrido = recorrido,
  IQR = IQR
)
kable(tabla_dispersion)

#j

desviacion <- sd(df$peso, na.rm = TRUE)
varianza <- desviacion ^ 2

dfj <- data.frame(
    desviacion = desviacion,
    varianza = varianza
)

print(dfj)


#k

df |>
  group_by(tabaco) |>
  summarise(
    media = round(mean(peso, na.rm = TRUE), 3),
    desv_tipica = round(sd(peso, na.rm = TRUE), 3),
    coef_variacion = round(sd(peso, na.rm = TRUE) / mean(peso, na.rm = TRUE) * 100, 3)
  ) |>
  kable()

#l

df |>
  summarise(
    CV_peso = round(sd(peso, na.rm = TRUE) / mean(peso, na.rm = TRUE) * 100, 3),
    CV_apgar1 = round(sd(apgar1, na.rm = TRUE) / mean(apgar1, na.rm = TRUE) * 100, 3)
  ) |>
  kable()

#m
df |>
  summarise(
    CV_peso = round(sd(peso, na.rm = TRUE) / mean(peso, na.rm = TRUE) * 100, 3),
    CV_apgar1 = round(sd(apgar1, na.rm = TRUE) / mean(apgar1, na.rm = TRUE) * 100, 3)
  ) |>
  kable()

#n 
df |>
  group_by(edad) |>
  summarise(
    asimetria = round(skewness(peso, na.rm = TRUE), 3)
  ) |>
  kable()

#o

df |>
  group_by(sexo) |>
  summarise(
    apuntamiento = round(kurtosis(peso, na.rm = TRUE), 3)
  ) |>
  kable()

#p

df |>
  summarise(
    asimetria_apgar1 = round(skewness(apgar1, na.rm = TRUE), 3),
    apuntamiento_apgar1 = round(kurtosis(apgar1, na.rm = TRUE), 3),
    asimetria_cigarros = round(skewness(cigarros, na.rm = TRUE), 3),
    apuntamiento_cigarros = round(kurtosis(cigarros, na.rm = TRUE), 3)
  ) |>
  kable()