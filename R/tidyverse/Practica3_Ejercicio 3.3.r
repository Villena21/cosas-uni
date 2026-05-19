library(tidyverse)

df <- read_csv("https://aprendeconalf.es/estadistica-practicas-r/datos/notas-curso2.csv")
df

df_largo <- df |> pivot_longer(notaA:notaE, names_to = "Asignatura", values_to = "Nota")
df_largo

df_largo <- df_largo |>
    mutate(Califiación = cut(Nota, breaks = c(0, 4.99, 6.99, 8.99, 10), labels = c("SS", "AP", "NT", "SB")))
head(df_largo)

df_largo |> filter(sexo == "Mujer", grupo == "A")|> 
    select(Asignatura, Nota) |>
    arrange(desc(Nota))