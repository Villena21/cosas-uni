lista <- c("Mujer", "Hombre", "Mujer", "Hombre", "Mujer", "Mujer", "Hombre", "Hombre")
lista

lista <- factor(lista)
lista

levels(lista)

lista <- factor(lista, levels = c("Mujer", "Hombre"))
lista