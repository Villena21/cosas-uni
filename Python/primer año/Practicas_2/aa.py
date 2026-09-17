
numero = int(input('Escriba un numero: '))
bool = True

for i in range(2, numero): # se especifica el rango hasta el numero ya que los, no se incluye el 1 ya que todos los numeros son divisibles entre 1
    if numero % i == 0:
        bool = False

if bool == True:
    print(True)
else:
    print(False)