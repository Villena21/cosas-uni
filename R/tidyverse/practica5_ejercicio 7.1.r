library(tidyverse)
library(broom)
library(tidymodels)
library(samplingbook)
library(knitr)

df <- data.frame(concentracion = c(17.6, 19.2, 21.3, 15.1, 17.6, 18.9, 16.2, 18.3, 19.0, 16.4 ))

media <- round(mean(df$concentracion))
paste('la media es:', media)

t1 <- t.test(df$concentracion, conf.level = 0.95)

t2 <- t.test(df$concentracion, conf.level = 0.99)

amp_95 <- t1$conf.int[2] - t1$conf.int[1]
amp_99 <- t2$conf.int[2] - t2$conf.int[1]

amp_95
amp_99

sample.size.mean(e = 0.5, S = sd(df$concentracion), level = 0.95)