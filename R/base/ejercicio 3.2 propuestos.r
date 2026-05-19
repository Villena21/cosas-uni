library(readxl)

# --- Carga de datos ---
df_blancos <- read_excel("vinos-blancos.xlsx")
df_blancos$tipo <- "blanco"

df_tintos <- read.csv("https://aprendeconalf.es/bioestadistica-practicas-r/datos/vinos-tintos.csv")
df_tintos$tipo <- "tinto"

# --- Unir los dos data frames ---
df_vinos <- rbind(df_blancos, df_tintos)

# --- Convertir tipo a factor ---
df_vinos$tipo <- as.factor(df_vinos$tipo)

# --- 5. Rellenar NAs de alcohol con la media por tipo ---
for (t in levels(df_vinos$tipo)) {
  idx <- df_vinos$tipo == t & is.na(df_vinos$alcohol)
  media <- mean(df_vinos$alcohol[df_vinos$tipo == t], na.rm = TRUE)
  df_vinos$alcohol[idx] <- media
}

# --- 6. Crear columna envejecimiento ---
df_vinos$envejecimiento <- NA_character_
df_vinos$envejecimiento[df_vinos$meses.barrica < 3]                                          <- "Joven"
df_vinos$envejecimiento[df_vinos$meses.barrica >= 3  & df_vinos$meses.barrica <= 12]         <- "Crianza"
df_vinos$envejecimiento[df_vinos$meses.barrica > 12  & df_vinos$meses.barrica <= 18]         <- "Reserva"
df_vinos$envejecimiento[df_vinos$meses.barrica > 18]                                         <- "Gran reserva"

df_vinos$envejecimiento <- factor(df_vinos$envejecimiento,
                                  levels = c("Joven", "Crianza", "Reserva", "Gran reserva"))

# --- 7. Crear columna dulzor ---
df_vinos$dulzor <- NA_character_
df_vinos$dulzor[df_vinos$azucar.residual < 4]                                                <- "Seco"
df_vinos$dulzor[df_vinos$azucar.residual >= 4  & df_vinos$azucar.residual < 12]             <- "Semiseco"
df_vinos$dulzor[df_vinos$azucar.residual >= 12 & df_vinos$azucar.residual < 45]             <- "Semidulce"
df_vinos$dulzor[df_vinos$azucar.residual >= 45]                                              <- "Dulce"

df_vinos$dulzor <- factor(df_vinos$dulzor,
                           levels = c("Seco", "Semiseco", "Semidulce", "Dulce"))

# --- Ver los primeros 10 ---
head(df_vinos, 10)