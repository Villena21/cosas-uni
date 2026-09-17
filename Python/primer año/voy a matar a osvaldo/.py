import os

print('')
print('ANALIZADOR DE ESTADOS DE SERVIDORES')
print('18/05/2026')
print('Javier Matres Villena')
print('Sala de ordenadores del ceu')
print('')

print('Que desea hacer: \n' 
'1. Analizar reporte\n'
'2. Guardar registro\n'
'3. Leer registro\n'
'Q. Salir')

menu = input('Ingrese una opción: ')

while menu != '1' and menu != '2' and menu != '3' and menu != 'Q':
    print('Opción no válida')
    menu = input('Ingrese una opción: ')

estados_validos = ["O", "F", "M", "S"]
reportes = []

def validar_reporte(reporte):
    for i in reporte:
        if i not in estados_validos:
            return False
    return True
        
if menu == '1':
    try:
        codigo_estado = input('Escriba su informe: ')

        codigo_estado = codigo_estado.upper()
        codigo_estado = codigo_estado.strip()

        valido = validar_reporte(codigo_estado)
        if valido == True:
            reportes.append(codigo_estado)

            n_online = codigo_estado.count('O')
            n_fallos = codigo_estado.count('F')
            n_mantenimiento = codigo_estado.count('M')
            n_suspendidos = codigo_estado.count('S')

            total = len(codigo_estado)
        
            porcentaje_online = (n_online / total) * 100
            porcentaje_fallos = (n_fallos / total) * 100
            porcentaje_mantenimiento = (n_mantenimiento / total) * 100
            porcentaje_suspendidos = (n_suspendidos / total) * 100

            print(n_online)
            print(n_fallos)
            print(n_mantenimiento)
            print(n_suspendidos)
            print(porcentaje_online)
            print(porcentaje_fallos)
            print(porcentaje_mantenimiento)
            print(porcentaje_suspendidos)
        else:
            print('reporte no valido')
    except ZeroDivisionError:
        print('error,  la division da zero')

elif menu == '2':
    try:
        fichero = 'registro_servidores.txt'

        ruta = os.getcwd()

        ruta_completa = os.path.join(ruta, fichero)

        coso = open(ruta_completa, 'a')

        for i in reportes:
            longitud = len(i)
            o_count = i.count('O')
            f_count = i.count('F')
            m_count = i.count('M')
            s_count = i.count('S')
            
            coso.write("Reporte\n" + i + "\n")
            coso.write("Longitud\n" + str(longitud) + "\n")
            coso.write("Online\n" + str(o_count) + "\n")
            coso.write("Fallos\n" + str(f_count) + "\n")
            coso.write("Mantenimiento\n" + str(m_count) + "\n")
            coso.write("Suspendidos\n" + str(s_count) + "\n\n")

        coso.close()
    except IOError:
        print('nigga')

elif menu == '3':

    try:

        fichero = 'registro_servidores.txt'

        ruta = os.getcwd()

        ruta_completa = os.path.join(ruta, fichero)

        coso = open(ruta_completa, 'r') 

        linea = coso.readline()

        while linea !='':
            print(linea.rstrip())
            linea = coso.readline()

        coso.close()
    except IOError:
        print('el fichero no existe')