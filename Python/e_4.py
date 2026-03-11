euros=int(input('teclea la cantidad en euros: '))

billetes_500 = euros // 500
print('necesito {0} billetes de 500'.format(billetes_500))
resto = euros % 500
print('restan {0} euros'.format(resto))

if(resto !=0):
    billetes_200 = resto // 200
    print('necesito {0} billetes de 200'.format (billetes_200))
    resto = resto % 200
    print('restan {0} euros'.format(resto))
    if(resto !=0):
        billetes_100 = resto // 100
        print('necesito {0} billets de 100'.format (billetes_100))
        resto = resto % 100
        print('restan {0} euros'.format(resto))
        if(resto !=0):
            billetes_50 = resto // 50 
            print('necesito {0} billetes de 50'.format (billetes_50))
            resto = resto % 50
            print('restan {0} euros'.format(resto))