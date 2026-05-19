library(tidyverse)
library(tidymodels)
library(broom)
library(knitr)

df <- data.frame(
    Tiempo = c(30, 60, 90, 120, 150, 180, 210),
    Alcohol = c(1.6, 1.7, 1.5, 1.1, 0.7, 0.2, 2.1)
)

cor(df$Tiempo, df$Alcohol)

ggplot(df, aes(x = Tiempo, y = Alcohol)) +
    geom_point(col = "red") +
    geom_smooth(method = "lm") +
    labs(title = "Diagrama de dispersión", x = "Tiempo en minutos", y = "Concentración de alcohol en sangre (g/l)")

df <- df |> slice(-7)

modelo_lineal_alcohol_tiempo <- linear_reg() |>
  set_engine("lm") |> 
  fit(Alcohol ~ Tiempo, df)
tidy(modelo_lineal_alcohol_tiempo) |> kable()

df <- data.frame(
    Horas = c(1, 2, 3, 4, 5, 6, 7, 8, 9),
    Bacterias = c(25, 28, 47, 65, 86, 121, 190, 290, 362)
)

ggplot(df, aes(x = Horas, y = Bacterias)) +
    geom_point(col = "red") +
    labs(title = "Diagrama de dispersión", x = "Horas", y = "Número de bacterias")

df <- df |> mutate(logBacterias = log(Bacterias))

ggplot(df, aes(x = Horas, y = logBacterias)) +
    geom_point(col = "red") +
    labs(title = "Diagrama de dispersión",
         x = "Horas",
         y = "Logaritmo del número de bacterias")

modelo_lineal_logBacterias_horas <- linear_reg() |>
  set_engine("lm") |> 
  fit(logBacterias ~ Horas, df)
tidy(modelo_lineal_logBacterias_horas) |> kable()

modelo_lineal_logBacterias_horas$fit$coefficients[2]

ggplot(df, aes(x = Horas, y = Bacterias)) +
        geom_point(col = "red") +
        geom_smooth(method = "glm", method.args = list(family = gaussian(link = "log"))) +
        labs(title = "Evolución del número de bacterias", x = "Horas", y = "Número de bacterias")

glance(modelo_lineal_logBacterias_horas) |> kable()