print('')


aminoacido = input('Introduce un aminoácido en codificación de 3 letras: ')
aminoacido = aminoacido.title()


print('')

if aminoacido == 'Ala' or aminoacido == 'Cys' or aminoacido == 'Val' or aminoacido == 'Ile' or aminoacido == 'Leu' or aminoacido == 'Pro' or aminoacido =='Phe' or aminoacido == 'Tyr' or aminoacido == 'Met' or aminoacido == 'Trp':
    print('El aminoacido introducdio es: {0:+^5}'.format(aminoacido))
    tipo = 'Hidrofobifico'
    print('El aminoácido {0} es de tipo {1}'.format(aminoacido, tipo))
elif aminoacido == 'Asn' or aminoacido == 'Gln' or aminoacido == 'His' or aminoacido == 'Gly' or aminoacido == 'Ser' or aminoacido == 'Thr':
    print('El aminoacido introducdio es: {0:+^5}'.format(aminoacido))
    tipo = 'Polar'
    print('El aminoácido {0} es de tipo {1}'.format(aminoacido, tipo))
elif aminoacido == 'Asp' or aminoacido == 'Glu':
    print('El aminoacido introducdio es: {0:+^5}'.format(aminoacido))
    tipo = 'Acídico, con carga negativa'
    print('El aminoácido {0} es de tipo {1}'.format(aminoacido, tipo))
elif aminoacido == 'Lys' or aminoacido == 'Arg':
    print('El aminoacido introducdio es: {0:+^5}'.format(aminoacido))
    tipo = 'Básico, con carga positiva'
    print('El aminoácido {0} es de tipo {1}'.format(aminoacido, tipo))
else:
    tipo = 'Error'
    print('Aminoácido no válido')


print('')