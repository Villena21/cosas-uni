
  count(apgar1) |>
  mutate(porcentaje = n / sum(n) * 100)