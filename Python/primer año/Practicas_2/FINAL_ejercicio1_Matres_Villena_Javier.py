import os

print('')
print('CALCULADORA BÁSICA DE ADN')
print('18/05/2026')
print('Javier Matres Villena')
print('Sala de ordenadores del ceu')
print('')

print('Que desea hacer: \n' 
'1. Analizar secuencia\n'
'2. Guardar analisis\n'
'3. Leer analisis\n'
'Q. Salir')

menu = input('Introduce lo que desea hacer: ')

while menu != 'q' and menu != 'Q' and menu != '1' and menu != '2' and menu != '3':
    menu = input('ERROR: Introduce lo que desea hacer: ')

if menu == '1':
    menu = 1
elif menu == '2':
    menu = 2
else:
    menu = 3

bases_validas =  ["A", "C", "T", "G"]
secuencias = []

def validar_secuencias(secuencia):
    for i in bases_validas:
        if secuencia != bases_validas:
            return False
        else:
            return True
        
print('')

if menu == 1:
    codigo_genetico = str(input('Introduce una secuencia de ADN: '))
    codigo_genetico = codigo_genetico.strip()
    codigo_genetico = codigo_genetico.replace(" ", "")
    codigo_genetico = codigo_genetico.upper()

    for i in codigo_genetico:
        if i not in bases_validas:
            print('ERROR: has puesto bases nitrogenadas no validas')
    else:
        for i in codigo_genetico:
            if i not in codigo_genetico:
                secuencias.append(i)

        n_adeninas = codigo_genetico.count('A')
        n_guaninas = codigo_genetico.count('G')
        n_timinas = codigo_genetico.count('T')
        n_citosinas = codigo_genetico.count('C')

        porcentaje_total = len(codigo_genetico)
        porcentaje_a = (n_adeninas / porcentaje_total) * 100 
        porcentaje_g = (n_guaninas / porcentaje_total) * 100
        porcentaje_c = (n_citosinas / porcentaje_total) * 100
        porcentaje_t = (n_timinas / porcentaje_total) * 100

        print('La secuencia introducida consta de:', codigo_genetico)
        print('Adeninas:', n_adeninas)
        print('Citosinas:', n_citosinas)
        print('Guaninas:', n_guaninas)
        print('Timinas:', n_timinas)

        print('Porcentaje A:', porcentaje_a,'%')
        print('Porcentaje G:', porcentaje_g,'%')
        print('Porcentaje T:', porcentaje_t,'%')
        print('Porcentaje C:', porcentaje_c,'%')

        print('')

elif menu == 2:
    try:
        ruta = os.path.join(os.getcwd(), "analisis_genetico.txt")
        fichero = open(ruta, "a")
        while True:
            frase = input()

            if frase.upper() == 'FIN':
                break
            fichero.write(frase + '\n')

        fichero.close()

    except FileNotFoundError:
        print('El archivo no se ha encontrado')
elif menu == 3:
    ruta = os.path.join(os.getcwd(),"analisis_genetico.txt")
    fichero = open(ruta, 'r')

print('')