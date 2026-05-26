library(tidyverse)
library(tidymodels)
library(broom)
library(knitr)

df <- read.csv("https://aprendeconalf.es/estadistica-practicas-r/datos/horas-estudio.csv")
kable(df)

ggplot(df, aes(x = Horas, y = Suspensos)) +
    geom_point(col = "red") +
    labs(title = "Diagrama de dispersión", x = "Horas de estudio", y = "Asignaturas suspensas")

recta_suspensos_horas <- lm(Suspensos ~ Horas, df)
tidy(recta_suspensos_horas) |> kable()

recta_suspensos_horas$coefficients[["Horas"]]

ggplot(df, aes(x = Horas, y = Suspensos)) +
    geom_point(col = "red") +
    geom_smooth(method = "lm") +
    labs(title = "Diagrama de dispersión", x = "Horas de estudio", y = "Asignaturas suspensas")

glance(modelo_lineal_suspensos_horas) |> kable()

predict.lm(recta_suspensos_horas, newdata = list(Horas = 3)) |> kable()

recta_horas_suspensos <- lm(Horas ~ Suspensos, df) 
predict.lm(recta_horas_suspensos, newdata = list(Suspensos = 0)) |> kable()