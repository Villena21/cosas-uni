library(tidyverse)
library(knitr)
library(DescTools)
library(moments)

df <- data.frame(medicamentos = c(3, 1, 2, 2, 0, 1, 4, 2, 3, 5, 1, 3, 2, 3, 1, 4, 2, 4, 3, 2, 3, 5, 0, 1, 2, 0, 2, 3, 0, 1, 1, 5, 3, 4, 2, 3, 0, 1, 2, 3))

count(df)

mean(df$medicamentos)

median(df$medicamentos)

Mode(df$medicamentos, na.rm = TRUE)

minimo <- min(df$medicamentos)

maximo <- max(df$medicamentos)

cuartil <- quantile(df$medicamentos, prob = c(0.25, 0.5, 0.75))
kable(cuartil)

cuartil2 <- quantile(df$medicamentos, prob = c(0.05, 0.95))
kable(cuartil2)

rango <- maximo - minimo
rango

intercuqrtilico <- IQR(df$medicamentos)
intercuqrtilico


n <- nrow(df)
# Cuasivarianza
print(paste("Cuasivarianza:", round(var(df$medicamentos), digits = 3)))

# varianza
print(paste("Varianza: ", round(var(df$medicamentos)*(n-1)/n), digits = 3))

# Cuasidesviación típica
print(paste("Cuasidesviación típica:", round(sd(df$medicamentos), digits = 3)))

# Desviación típica
n <- nrow(df)
print(paste('desviacion tipica', round(sd(df$medicamentos) * sqrt((n-1)/n), digits = 3)))

#coeficiente de variacion
coeficiente_de_variacion <- sd(df$medicamentos, na.rm = TRUE) / abs(mean(df$medicamentos, na.rm = TRUE)) * 100
print(paste("coeficiente de variacion: ", round(coeficiente_de_variacion, digits = 3)))

# asimentria
asimentria <- skewness(df$medicamentos, na.rm = TRUE)
round(asimentria, digits = 4)

#apuntamiento
apuntamiento <- kurtosis(df$medicamentos, na.rm = TRUE)
round(apuntamiento, digits = 4)