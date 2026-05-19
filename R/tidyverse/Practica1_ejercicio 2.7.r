df <- data.frame(
Alumno = c("Juan", "Maria", "Pedro", "Ana", "Luis", "Sara"),
Grupo = c("A", "B", "B", "A", "A", "B"),
Fisica = c(7, 3.5, 6, 5.2, 4.5, 9),
Quimica = c(6.7, 5, 7.1, 4.5, 0, 9.2))

df
#crear un factor para el grupo
grupo <- factor(df$Grupo)
grupo

vector1 <- c(df$Fisica)
vector1

vector2 <- c(df$Quimica)
vector2

media_fisica <- mean(df$Fisica)
media_quimica <-mean(df$Quimica)

media_notas <- c(media_fisica, media_quimica)
media_notas

# Calcular la media de cada alumno en las dos asignaturas
media_por_alumno <- (df$Fisica + df$Quimica) / 2

# Crear vector booleano: TRUE si aprobó (media >= 5), FALSE si no
aprobados <- media_por_alumno >= 5

# Ver el resultado
aprobados

df |> filter(aprobados)

df_resultado <- data.frame(
  Alumno = df$Alumno,
  Fisica = df$Fisica,
  Quimica = df$Quimica,
  Media = media_por_alumno,
  Aprobado = aprobados
)

df_resultado

write.csv(df, "notas.csv", row.names = FALSE)