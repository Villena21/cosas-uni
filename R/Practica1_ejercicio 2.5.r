library(tidyverse)

df <- data.frame(Mes = c("Enero", "Febrero", "Marzo"),
                  Ingresos = c(45000, 41500, 51200),
                  Gastos = c(33400, 35400, 35600)  
)
df

df$Impuestos <- c(6450, 6300, 7100)
df

df <- rbind(df, list(Mes = "Abril", Ingresos = 49700, Gastos = 36300, Impuestos = 6850))
df

df[3, "Ingresos"] <- 50400
df

write.csv(df, "ingresos_gastso.csv", row.names = FALSE)