numero_1 = input('Escriba su primer numero: ')
numero_2 = input('Escriba su segundo numero: ')

if numero_1 < numero_2:
    print(numero_1,'es menor que',numero_2)
elif numero_1 == numero_2:
    print(numero_1,'y',numero_2,'son iguales')
else:
    print(numero_2,'es menor que', numero_1)