print('Programa para la resolucion de la ecuacion ax+b=0')

a = float(input('Insertar valor de a: '))
b = float(input('Insertar valor de b: '))

while a==0 and b==0:
    if a==0 and b==0:
        print('No tiene solucion')
        a = float(input('Insertar valor de a: '))
        b = float(input('Insertar valor de b: '))       
while a == 0:
    if a == 0:
        print('No tiene solucion')
        a = float(input('Inserte otro valor de a: '))
        b = b
while b == 0:
    if b == 0:
        print('Infinitas soluciones')
        b=float(input('Inserte otro valor de b: '))
        a=a

x = -b/a

print('La solucion es:', x)