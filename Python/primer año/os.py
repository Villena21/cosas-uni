import os
ruta = os.getcwd()

nombre_fichero = "67.txt"

nombre_completo = ruta + "\\" + nombre_fichero

print(ruta)

if os.path.exists(nombre_completo):
    fichero = open(nombre_completo, "r")
    for linea in fichero:
        print(linea)
        fichero.close
else:
    print("no existe", nombre_fichero)