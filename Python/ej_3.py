numero_1 = input('Escriba su primer numero: ')
numero_2 = input('Escriba su segundo numero: ')

if numero_1 < numero_2:
    print('{0} es menor que {1}'.format(numero_1,numero_2))
elif numero_1 == numero_2:
    print('{0} es igual a {1}'.format(numero_1,numero_2))
else:
    print('{1} es menor que {0}'.format(numero_1,numero_2))