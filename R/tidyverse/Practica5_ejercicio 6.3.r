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

df <- df[-7, ]
modelo_lineal_alcohol_tiempo <- lm(Alcohol ~ Tiempo, df)
tidy(modelo_lineal_alcohol_tiempo) |> kable()

recta_alcohol_tiempo$coefficients[["Tiempo"]]

recta_tiempo_alcohol <- lm(Tiempo ~ Alcohol, df) 
predict.lm(recta_tiempo_alcohol, newdata = list(Alcohol = 0.3)) |> kable()