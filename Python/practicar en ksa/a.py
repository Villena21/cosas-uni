edad = int(input("Introduce tu edad: "))
altura = int(input("Introduce tu altura en cm: "))
dia = input("Introduce el día de la semana (ej. lunes, martes...): ")


if altura < 120 or edad < 8:
    print('error')
else:
    precio = 30

if edad >= 8 and edad <= 12:
    precio = 20
elif edad >= 65:
    precio = 15
else:
    precio = 30

if dia == 'martes' or dia == 'miercoles':
    descuento = 5
    total = precio - descuento
    print(total)
else:
    descuento = 0
    total = precio - descuento
    print(total)