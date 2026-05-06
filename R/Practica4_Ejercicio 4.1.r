library(tidyverse) 
library(knitr)

df <- data.frame(hijos = c(1, 2, 4, 2, 2, 2, 3, 2, 1, 1, 0, 2, 2, 0, 2, 2, 1, 2, 2, 3, 1, 2, 2, 1, 2))

df |> count(hijos, name = "ni") |>
    mutate(fi = ni/sum(ni), Ni = cumsum(ni), Fi = cumsum(ni)/sum(ni)) |>
    kable()