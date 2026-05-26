library(tidyverse)
library(tidymodels)
library(broom)
library(knitr)

df <- data.frame(
    x = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9),
    y = c(2, 5, 8, 11, 14, 17, 20, 23, 26, 29)
)

ggplot(df, aes(x = x, y = y)) +
    geom_point(col = "red") +
    labs(title = "Diagrama de dispersión", x = "X", y = "Y")

recta_y_x <- lm(y ~ x, df) 
tidy(recta_y_x) |> kable()

recta_y_x$coefficients[["x"]]

ggplot(df, aes(x = x, y = y)) +
    geom_point(col = "red") +
    geom_smooth(method = lm) +
    labs(title = "Diagrama de dispersión", x = "X", y = "Y")

glance(recta_y_x) |> kable()


recta_x_y <- lm(x ~ y, df) 
resumen <- summary(recta_x_y)
kable(resumen)