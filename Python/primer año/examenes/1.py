import os

fichero = 'proteinas.txt'
ruta = os.getcwd()

completo = os.path.join(ruta, fichero)

def leer_proteinas(completo):

    lista_proteinas = []

    archivo = open(completo, 'r')

    for i in archivo:

        lista_proteinas.append(i.rstrip())

    archivo.close()

    return lista_proteinas

def porcentaje_aminoacidos_basicos(lista_proteinas):

    for i in lista_proteinas:
        
        n_k = i.count('K')
        n_r = i.count('R')

        total = len(i)

        p_k = (n_k /total) * 100
        p_r = (n_r / total) * 100

        p_t = p_k + p_r

        print('La secuencia es: {0}, cuyo porcentaje de aminoacidos basicos es: {1:4.2f}%'.format(i, p_t))


def tiene_senal_nuclear(lista_proteinas):

    N_proteina_con_senal = []

    i = 0
    while i < len(lista_proteinas):
        if 'KK' in lista_proteinas[i] or 'KR' in lista_proteinas[i] or 'RK' in lista_proteinas[i] or 'RR' in lista_proteinas[i]:
            N_proteina_con_senal.append(i)
        i+=1
    return N_proteina_con_senal


def almacenar_proteinas_con_senal_nuclear(lista_proteinas, posiciones):

    fichero = 'NIGGA.txt'
    ruta = os.getcwd()

    completo = os.path.join(ruta, fichero)

    archivo = open(completo, 'w')

    for i in posiciones:
        archivo.write(lista_proteinas[i] + '\n')

    archivo.close()

lista_proteinas = leer_proteinas(completo)
print(lista_proteinas)
porcentaje_aminoacidos_basicos(lista_proteinas)
print(tiene_senal_nuclear(lista_proteinas))
posiciones = tiene_senal_nuclear(lista_proteinas)
almacenar_proteinas_con_senal_nuclear(lista_proteinas, posiciones)