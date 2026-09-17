import os

fichero = 'nucleotidos.txt'
ruta = os.getcwd()

completo = os.path.join(ruta, fichero)

def leer(completo):

    try:
        nucleotidos = []

        archivo = open(completo, 'r')

        for i in archivo:
            nucleotidos.append(i.rstrip())

        archivo.close()

    except FileNotFoundError:
        print('67')

    return nucleotidos

def porcentajes(lista_nucleotidos):

    for i in lista_nucleotidos:

        n_a = i.count('A')
        n_t = i.count('T')
        n_g = i.count('G')
        n_c = i.count('C')

        total = len(i)

        p_a = (n_a / total) * 100
        p_t = (n_t / total) * 100
        p_g = (n_g / total) * 100
        p_c = (n_c / total) * 100

        print('La secuencia a es: {0}, cuyo porcentajes de nucleotidos son: A: {1:4.2f}%, T: {2:4.2f}%, G: {3:4.2f}%, C: {4:4.2f}%'.format(i, p_a, p_t, p_g, p_c))

def nucleotidos_con_snal(lista_nucleotidos):

    patron = []
    i = 0

    while i < len(lista_nucleotidos):
        if 'TTAGGG' in lista_nucleotidos[i]:
            patron.append(i)
        i += 1

    return patron

def almacenar(lista_nucleotidos, posiciones):

    fichero = 'funciona.txt'

    ruta = os.getcwd()

    completo = os.path.join(ruta, fichero)

    coso = open(completo, 'w')

    for i in posiciones:
        coso.write(lista_nucleotidos[i] + '\n')

    coso.close()



lista_nucleotidos = leer(completo)

porcentajes(lista_nucleotidos)

posiciones = nucleotidos_con_snal(lista_nucleotidos)
print(posiciones)

almacenar(lista_nucleotidos, posiciones)