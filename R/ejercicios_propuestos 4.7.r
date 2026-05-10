library(tidyverse)
library(knitr)

# a

df <- read_csv("https://aprendeconalf.es/bioestadistica-practicas-r/datos/neonatos.csv")
df

df |> count(apgar1, name = "ni") |> 
    mutate(fi = ni / sum(ni), Ni = cumsum(ni), Fi = cumsum(ni) / sum(ni)) |>
    kable()

df %>%
  summarise(
    deprimidos = sum(apgar1 <= 3),
    porcentaje = round(mean(apgar1 <= 3) * 100, 2)
  )

#b
df |> 
  group_by(edad) |>                          # <- aquí separas los grupos!!
  count(apgar1, name = "ni") |> 
  mutate(
    fi = ni / sum(ni),
    Ni = cumsum(ni),
    Fi = cumsum(ni) / sum(ni)
  ) |>
  kable()

df |>
  group_by(edad) |>
  summarise(
    deprimidos = sum(apgar1 < 7),
    porcentaje = round(mean(apgar1 < 7) * 100, 2)
  )

# c
breaks <- seq(2, 4.5, by = 0.5)

df |>
  mutate(clase = cut(peso, breaks = breaks, right = FALSE)) |>
  count(clase, name = "ni") |>
  mutate(
    fi = ni / sum(ni),
    Ni = cumsum(ni),
    Fi = cumsum(ni) / sum(ni)
  ) |>
  kable()

# d

breaks <- seq(2, 4.5, by = 0.5)

df |>
  mutate(clase = cut(peso, breaks = breaks, right = FALSE)) |>
  group_by(tabaco, clase) |>
  summarise(ni = n(), .groups = "drop_last") |>   # cuenta por intervalo
  mutate(                                          # fi se calcula dentro de tabaco
    fi = round(ni / sum(ni), 4),
    Ni = cumsum(ni),
    Fi = round(cumsum(ni) / sum(ni), 4)
  ) |>
  kable()

# e
df |>
  ggplot(aes(x = apgar1)) +
  geom_bar(fill = "steelblue", color = "white") +
  labs(
    title = "Distribución de la puntuación Apgar al minuto",
    x = "Puntuación Apgar",
    y = "Frecuencia"
  )

#f

tabla <- df |>
  count(apgar1, name = "ni") |>
  mutate(
    fi = ni / sum(ni),
    Fi = cumsum(ni) / sum(ni)
  )

tabla |>
  ggplot(aes(x = apgar1, y = Fi)) +
  geom_step()

#g

df |>
  group_by(tabaco, apgar1) |>
  summarise(ni = n(), .groups = "drop_last") |>
  mutate(fi = ni / sum(ni)) |>
  ggplot(aes(x = apgar1, y = fi)) +
  geom_col(fill = "steelblue", color = "white") +
  facet_wrap(~ tabaco, labeller = labeller(tabaco = c("0" = "No fumadora", "1" = "Fumadora"))) +
  labs(
    title = "Distribución Apgar al minuto según tabaco",
    x = "Apgar",
    y = "Frecuencia relativa"
  )

#h

df |>
  ggplot(aes(x = peso)) +
  geom_histogram(
    breaks = seq(2, 4.5, by = 0.5),
    fill = "steelblue",
    color = "white"
  ) +
  labs(
    title = "Histograma de pesos de neonatos",
    x = "Peso (kg)",
    y = "Frecuencia"
  )

# i

df |>
  mutate(clase = cut(peso, breaks = seq(2, 4.5, by = 0.5), right = FALSE)) |>
  group_by(tabaco, clase) |>
  summarise(ni = n(), .groups = "drop_last") |>
  mutate(fi = ni / sum(ni)) |>
  ggplot(aes(x = clase, y = fi)) +
  geom_col(fill = "steelblue", color = "white") +
  facet_wrap(~ tabaco, labeller = labeller(tabaco = c("No" = "No fumadora", "Si" = "Fumadora"))) +
  labs(
    title = "Distribución de peso según tabaco",
    x = "Peso (kg)",
    y = "Frecuencia relativa"
  )

#j

df |>
  mutate(clase = cut(peso, breaks = seq(2, 4.5, by = 0.5), right = FALSE)) |>
  group_by(tabaco.antes, clase) |>
  summarise(ni = n(), .groups = "drop_last") |>
  mutate(fi = ni / sum(ni)) |>
  ggplot(aes(x = clase, y = fi)) +
  geom_col(fill = "steelblue", color = "white") +
  facet_wrap(~ tabaco.antes, labeller = labeller(tabaco.antes = c("No" = "No fumaba antes", "Si" = "Fumaba antes"))) +
  labs(
    title = "Distribución de peso según tabaco antes del embarazo",
    x = "Peso (kg)",
    y = "Frecuencia relativa"
  )

#k

df |>
  ggplot(aes(x = peso)) +
  geom_boxplot(fill = "steelblue", color = "white") +
  scale_y_continuous(breaks = NULL) +
  labs(
    title = "Diagrama de caja y bigotes del peso de los neonatos",
    x = "Peso (kg)"
  )

#l

df |>
  ggplot(aes(x = peso, fill = tabaco)) +
  geom_boxplot() +
  scale_y_continuous(breaks = NULL) +
  facet_wrap(~ edad) +
  labs(
    title = "Distribución del peso según tabaco y edad de la madre",
    x = "Peso (kg)",
    fill = "Tabaco"
  )

#m

df |>
  pivot_longer(cols = c(apgar1, apgar5), names_to = "momento", values_to = "apgar") |>
  ggplot(aes(x = apgar, fill = momento)) +
  geom_boxplot() +
  scale_y_continuous(breaks = NULL) +
  labs(
    title = "Comparación Apgar al minuto y a los 5 minutos",
    x = "Puntuación Apgar",
    fill = "Momento"
  )