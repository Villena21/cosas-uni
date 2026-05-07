# Ejercicio 1

secuencia = str(input('Escriba su secuencia de ADN: '))

secuencia2 = secuencia.upper()
secuenciaf = secuencia2.replace(' ', '')

print(secuenciaf)
print('la longitud de la secuencia es:', len(secuenciaf))

# Ejercicio 2 

secuencia=input("Introduzca una secuencia de ADN: \n").upper()
secuenciaf=""
for i in secuencia:
    if i=="A":
        secuenciaf+="X"
    else:
        secuenciaf+=i
print("La secuencia ha mutado a:",secuenciaf)

# Ejercicio 3

secuencia = str(input('Escriba su secuencia de ADN: '))
patron = str(input('Escriba el patron que quiera buscar en su de ADN: '))

for i in secuencia:

    numero_patron = secuencia.count(patron)

print('El numero de veces que se repite el patron es:', numero_patron)

#EJ 4

secuencia = str(input('Escriba su secuencia de ADN: '))
secuencia2 = str(input('Escriba su segunda secuencia de ADN: '))

if secuencia == secuencia2:
    print(secuencia2,'esta dentro de',secuencia)
else:
    print(secuencia2,'no esta dentro de',secuencia)

# EJ 5

secuencia = str(input('Escriba su secuencia de ADN: '))

secuencia2 = secuencia.replace('', '-')
secuencia3 = secuencia2[:-1]

print(secuencia3)

# Ej 6

lista = input("escriba su secuencia de numeros: ")

lista2 = lista.replace(",", "")
lista3 = lista2.replace(" ", "")

listaf = []

for numero in lista3:
    if numero not in listaf:
        listaf.append(numero)
        

print(listaf)

#Ej 7

lista = list(input("Introduce una lista:"))
invertida7=[]
for i in range(len(lista)-1,-1,-1):
    invertida7.append(lista[i])
print(invertida7)

#Ej 8

# arriba son listas son distintas por lo que da como resultaddo el else

lista1 = ['Juan', 'Antonia', 'Luis', 'María']
lista2 = ['Pepe', 'Antonio', 'Segismundo', 'Carlos']

if lista1 == lista2:
    print('las listas son iguales')
else:
    print('las listas son distintas')

# ---------------------------------------------------------

# aqui son iguales por lo tanto da true

lista1 = ['Juan', 'Antonia', 'Luis', 'María']
lista2 = ['Juan', 'Antonia', 'Luis', 'María']

if lista1 == lista2:
    print('las listas son iguales')
else:
    print('las listas son distintas')

#Ej 9

lista = [7, 2, 7, 4, 7]
valor_buscado = int(input("Escribe el valor: "))

posiciones = []

for i in range(0, len(lista)):
    if lista[i] == valor_buscado:
        posiciones.append(i)

print(posiciones)

#Ej 10

lista1 = [1, 2, 3, 2, 4, 5, 1]
lista2 = [5, 1, 8, 1, 9, 2]

lista1_limpia = []
lista2_limpia = []

for i in lista1:
    if i not in lista1_limpia:
        lista1_limpia.append(i)

for i in lista2:
    if i not in lista2_limpia:
        lista2_limpia.append(i)

listaf = []

for i in lista1_limpia:
    if i in lista2_limpia:
        listaf.append(i)

print(listaf)

# EJ 11

secuencia = str(input('Escriba su secuencia de ADN: '))
n = int(input("escriba las veces que quieres que se repita la secuencia: "))

secuencia2 = secuencia.replace(" ", "")

secuenciaf = secuencia2.upper()

for i in secuencia:
    secuencia_limpia = secuenciaf.replace("a", "A")
    secuencia_limpia = secuenciaf.replace("c", "C")
    secuencia_limpia = secuenciaf.replace("g", "G")
    secuencia_limpia = secuenciaf.replace("t", "T")

def repetir_secuencia(secuencia, n):
    return secuencia_limpia*n

resultado = repetir_secuencia(secuencia_limpia,n)

print(resultado)

#EJ 12

lista = [6, 7, 9, 8, 3, 5, 1, 9]

def mayor_que_cinco(lista):
    listaf = []
    for i in lista:
        if i >= 5:
             listaf.append(i)
    
    return listaf

output = mayor_que_cinco(lista)

print(output)

#Ej 13

lista = [6, 7, 9, 8, 3, 5, 1, 9]
numero = int(input('que numero desea buscar: '))


def localizador(lista, numero):
    for i in range(len(lista)):
        if lista [i] == numero:
            return i + 1

    else:
        print(-1)

print(localizador(lista, numero))

#Ej 14

secuencia = str(input('introduzca una frase o palabra: '))
caracter = input('que caracter desea buscar: ')

def conteo_de_caracter(secuencia, caracter):
    contador = 0
    for i in secuencia:
        if i == caracter:
            contador += 1
    return contador

print(conteo_de_caracter(secuencia, caracter))

#Ej 15

def comprobar_secuencia_ADN():
    while True:
        try:
            secuencia=input("Introduce una secuencia de ADN: ").upper()
            for base in secuencia:
                if base not in ["A","C","G","T"]:
                    print("Secuencia inválida, vuelve a intentarlo")
                else:
                    return secuencia
        except ValueError:
            print("Ha ocurrido un error")
adn=comprobar_secuencia_ADN()
print(adn)