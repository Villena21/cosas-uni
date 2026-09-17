import os

nombre = "67.txt"

os.chdir('C:/Users/Villena/Desktop/cosas-uni/Python')
ruta = os.getcwd()

fichero_completo = os.path.join(ruta, nombre)
contnido = open(fichero_completo, 'w')

while True:
    frase = input()

    if frase.upper() == 'FIN':
        break
    contnido.write(frase + '\n')

contnido.close()