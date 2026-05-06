library(tidyverse) 
library(knitr)

df <- data.frame(
    Mes = c("Enero", "Febrero", "Marzo", "Abril"),
    Ingresos = c(45000, 41500, 51200, 49700),
    Gastos = c(33400, 35400, 35600, 36300),
    Impuestos = c(6450, 6300, 7100, 6850)
    )
df 

df <- df |>
    mutate(Beneficios = Ingresos - Gastos - Impuestos)
df

Balance <- df$Beneficios >= 0

Balance <- ifelse(Balance, "Positivo", "Negativo")

df <- df |> mutate(Balance)
df

df |> filter(Balance == "Positivo") |> select(Mes, Balance)