nombre = input("")
try:
    fichero = open(nombre, 'r')

    linea = fichero.readline()

    while linea != '':
        print(linea.rstrip())
        linea = fichero.readline()

    fichero.close
w
except IOError:
    print('kk')