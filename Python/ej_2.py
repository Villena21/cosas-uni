print('Programa para la resolucion de la ecuacion ax+b=0')

a = float(input('Insertar valor de a: '))
b = float(input('Insertar valor de b: '))

while a == 0:
    if a == 0:
        print('0 no sirve como valor de a')
        a = float(input('Inserte valor de a: '))
        b = b
while b == 0:
    if b == 0:
        print('0 no sirve como valor de b')
        b=float(input('Inserte valor de b: '))
        a=a

print(a,'x +',b)

x = -b/a

print('La solucion es:', x)