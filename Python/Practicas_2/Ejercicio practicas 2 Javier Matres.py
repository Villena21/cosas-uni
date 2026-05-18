# Ejercicio 1

numero = float(input('Escriba un nuermo: '))

if numero >= 0 and numero <=10:
    print('Ese numero esta en el intervalo')
else:
    print('Ese numero no esta en el intervalo')


# Ejercicio 2

edad = float(input('Escriba su edad: '))
autorizacion_especial = input('Tiene autorizacion especial? 0 = no 1 = si')

if autorizacion_especial == 0:
    autorizacion_especial = False
else:
    autorizacion_especial = True

if edad >= 18 or edad == True:
    print('Acceso Permitido')
else:
    print('Acceso Invalido')


# Ejercicio 3

numero = float(input('Escriba un nuermo: '))

if not numero < 0:
    print('Numero positivo')
else:
    print('Numero negativo')

# Ejercicio 4

numero = float(input('Escriba su nota: '))

if numero >= 0:
    if numero < 5:
        print('Suspenso')
    elif numero >= 5 and numero < 7:
        print('aprobado')
    elif numero >= 7 and numero < 9 :
        print('Notable')
    elif numero >= 9 and numero <= 10 :
        print('Sobresaliente')
else:
    print('Nota no valida')

# otra forma de hacer el ejercicio 4 seria con un while

numero = float(input('Escriba su nota: '))

while numero < 0 or numero> 10:
    numero = float(input('Escriba su nota: '))

if numero < 5 and numero >= 0:
    print('Suspenso')
elif numero >= 5 and numero < 7:
    print('aprobado')
elif numero >= 7 and numero < 9 :
    print('Notable')
elif numero >= 9 and numero <= 10 :
    print('Sobresaliente')

# Ejercicio 5

numero = 1
while numero >= 1 and numero < 11:
    print(numero)
    numero += 1
    if numero == 11:
        numero = 1
    else:
        numero = numero

# Ejercicio 6

numero = float(input('Escriba un nuermo: '))

while numero < 0 or numero > 10:
    numero = float(input('Escriba un nuermo: '))

# Ejercicio 7

total = 0
numero = float(input('Escriba un numero: '))

while numero >=0:
    total += numero
    numero= float(input('Escriba un numero: '))

print(total)

# Ejercicio 8

numero = float(input('Escriba un numero: '))

for i in range(1,11):
    print(numero*i)

# Ejercicio 9

for i in range(0, 101): # El rango el 101 porque si no el 100 no se incluiria
    if i % 2 != 0: # Si el resto de la division no es 0 signifca que es impar ya que cuando un nuermo divido entre 2 da de resto 0 significa que ese numero es par si no es impar
        print(i, 'impar')
    else:
        print(i, 'numero par')

# Ejercicio 10

numero = int(input('Escriba un numero: ')) # si es float no va el programa
bool = True

for i in range(2,numero): # se especifica el rango hasta el numero ya que los, no se incluye el 1 ya que todos los numeros son divisibles entre 1
    if numero % i == 0:
        bool = False

if bool == True:
    print(True)
else:
    print(False)

# Ejercicio 11

numero= int(input('Escriba un numero: '))

while numero != 0:
    if numero == 0:
        break
else:
    numero= int(input('Escriba un numero: '))