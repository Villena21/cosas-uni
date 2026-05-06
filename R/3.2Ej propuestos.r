library(tidyverse)
library(readxl)
library(knitr)

df_blancos <- read_excel("vinos-blancos.xlsx") |>
  mutate(tipo = "blanco") 

df_tintos <- read_csv("https://aprendeconalf.es/bioestadistica-practicas-r/datos/vinos-tintos.csv") |>
  mutate(tipo = "tinto")

df_vinos <- bind_rows(df_blancos, df_tintos)

df_vinos <- df_vinos |>
  mutate(tipo = as_factor(tipo))

# 5. Rellenar los agujeros de alcohol con la media de sus hermanos
df_vinos <- df_vinos |>
  group_by(tipo) |>
  mutate(alcohol = if_else(is.na(alcohol), mean(alcohol, na.rm = TRUE), alcohol)) |>
  ungroup()

# 6 y 7. Recodificar el envejecimiento y el dulzor como auténticos campeones
# Creamos el factor de envejecimiento por separado
df_vinos <- df_vinos |>
  mutate(
    envejecimiento = case_when(
      meses.barrica < 3 ~ "Joven",
      meses.barrica >= 3 & meses.barrica <= 12 ~ "Crianza",
      meses.barrica > 12 & meses.barrica <= 18 ~ "Reserva",
      meses.barrica > 18 ~ "Gran reserva",
      TRUE ~ NA_character_
    ),
    envejecimiento = fct_relevel(as_factor(envejecimiento), 
                                 "Joven", "Crianza", "Reserva", "Gran reserva")
  )

df_vinos <- df_vinos |>
  mutate(
    dulzor = case_when(
      azucar.residual < 4 ~ "Seco",
      azucar.residual >= 4 & azucar.residual < 12 ~ "Semiseco",
      azucar.residual >= 12 & azucar.residual < 45 ~ "Semidulce",
      azucar.residual >= 45 ~ "Dulce",
      TRUE ~ NA_character_
    ),
    dulzor = fct_relevel(as_factor(dulzor), 
                         "Seco", "Semiseco", "Semidulce", "Dulce")
  )
# ¡Sacamos los primeros 10 para ver la pedazo de obra de arte que hemos creado!
df_vinos |> 
  head(10) |> 
  kable()