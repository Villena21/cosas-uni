library(tidyverse)

df <- read.csv("https://aprendeconalf.es/estadistica-practicas-r/datos/colesterol.csv")
head(df)
#mostrar todas las variables
glimpse(df)
#numero de filas
nrow(df)
#tomar 5 muestras aleatorias
df |> sample_n(5)
#ver los datos de la columna coresterol --> sirve para cualquier otra columna
df |> select(colesterol)
#ver todos los datos de la 5ª fila
df |> slice(5)