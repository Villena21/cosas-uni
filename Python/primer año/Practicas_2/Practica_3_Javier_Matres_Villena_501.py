# Ejercicio 1. Validación básica de entrada

numero = float(input('Introduzca su numero: '))

while numero % 1 != 0:
    numero = int(input('Introduzca su numero: '))

# Ejercicio 2. División con control de errores

numerador = float(input('Introduzca su numerador: '))
denominador = float(input('Introduzca su denominador: '))

while denominador != 0 or numerador == [''] or denominador == ['']:
    numerador = numerador
    denominador = float(input('Introduzca su denominador: '))

# Ejercicio 3. Control de rango

numero = float(input('Introduzca su numero: '))

while numero < 0 or numero > 100:
    numero = float(input('Introduzca su numero: '))

if numero % 2 != 0 :
    print('El numero es impar')
else:
    print('El numero es par')

if numero < 50:
    print('Es menor que 50')
elif numero == 50:
    print('El numero es 50')
else:
    print('Es mayor que 50')

# Ejercicio 4. Procesamiento de secuencia de números

numero = int(input('Introduzca su numero: '))

cantidad_numeros = 0
suma = 0
mayor_que_cinco = 0
pares = 0

while numero != 0:
    numero = int(input('Introduzca su numero: '))
    cantidad_numeros += 1
    suma += numero
    if numero > 5:
        mayor_que_cinco += 1
    else:
        mayor_que_cinco += 0
    if numero %2 == 0:
        pares += 1
    else:
        pares += 0

print(cantidad_numeros)
print(suma)
print(mayor_que_cinco)
print(pares)

# Ejercicio 5. Acumulación con condición de parada

numero = int(input('Introduzca su numero: '))

suma = 0
validos = 0
mutiplos_dos = 0
mayor_diez = 0

while numero > 0:
    suma += numero
    validos += 1
    if numero %2 == 0:
        mutiplos_dos += 1
    else:
        mutiplos_dos += 0
    if numero > 10:
        mayor_diez += 1
    else:
        mayor_diez += 0

print(suma)
print(validos)
print(mutiplos_dos)
print(mayor_diez)

# Ejercicio 6. Recorrido con condiciones

numero = int(input("Ingresa un número: "))

suma = 0
contador = 0
ultimo = numero

for i in range(1, numero+1):
    if i % 3 == 0:
        suma = suma + numero
        contador = contador + 1
        ultimo = i

print("Suma:", suma)
print("Cantidad:", contador)
print("Último valor:", ultimo)

# Ejercicio 7. Búsqueda con condición y parada
numero = int(input("Ingresa un número: "))
iteraciones = 0

for i in range (1, numero+1):
    while i % 5 == 0 and i > 30:
        iteraciones += 1
        break

print(i)
print(iteraciones)


# Ejercicio 8. Análisis de divisores

numero = int(input("Ingresa un número: "))
divisores = 0
suma = 0
for i in range (1, numero+1):
    if numero % i == 0:
        print(i) # decir divisores
        # contar divisores
        divisores += 1
        # suma de divisores
        suma += i
#imprimir los divisores
print(divisores)
print(suma)

if divisores == 2:
    print("Es primo")
else:
    print("No es primo")

# Ejercicio 9. Validación con repetición controlada 

while True:
    try: 
        numero = int(input("Ingresa un número: "))
        if numero > 0:
            break
        else:
            print("Pon un numero positivo")
    except ValueError:
        print("ERROR: pon un numero")

for i in range(numero, -1, -1):
    print(i)

# Ejercicio 10. Control de intentos
numero = int(input("Ingresa un número: "))
intentos = 0 

while numero < 0 or numero % 2 != 0:
    if numero % 2 != 0:
        print("ERROR: Se ha introducido un numero impar")
    elif numero < 0:
        print("ERROR: Se ha introducido un numero menor que 0")
    elif intentos == 3:
        print("se ha alcanzado el numero de intentos maximo")
    numero = int(input("Ingresa un número: "))
    intentos += 1
    break

# Ejercicio 11. Recorrido básico de una cadena

cadena=input("Introduce una cadena de texto: ")
print("Longitud: {0}".format(len(cadena)))

print("Caracteres en posiciones pares: ")
for i in range(0,len(cadena),2):
    print(cadena[i])
for i in range(1,len(cadena),2):
    print(cadena[i])


# Ejercicio 12. Comparación de cadenas

cadena_1 = input("Introduce una cadena de texto: ")
cadena_2 = input("Introduce una cadena de texto: ")

if len(cadena_1) != len(cadena_2):
    print("las cadenas son de distintas longitudes")
else:
    coincidencias  = 0
    nueva_cadena = ""
    for i in range(len(cadena_1)):
        if cadena_1[i] == cadena_2[i]:
            coincidencias += 1
            nueva_cadena += cadena_1[i]
        else:
            nueva += ""
            
    print("Posiciones que coinciden:", coincidencias)
    print("Nueva cadena: ", nueva)