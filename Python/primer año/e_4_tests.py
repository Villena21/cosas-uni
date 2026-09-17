euros=int(input('teclea la cantidad en euros: '))

billetes_500 = euros // 500
print('necesito {0} billetes de 500'.format(billetes_500))
resto = euros % 500
if billetes_500 = 0:
    if(resto !=0):
        billetes_200 = resto // 200
        print('necesito {0} billetes de 200'.format (billetes_200))
        resto = resto % 200
        if(resto !=0):
            billetes_100 = resto // 100
            print('necesito {0} billets de 100'.format (billetes_100))
            resto = resto % 100
            if(resto !=0):
                billetes_50 = resto // 50 
                print('necesito {0} billetes de 50'.format (billetes_50))
                resto = resto % 50
                if(resto !=0):
                    billetes_20 = resto // 20 
                    print('necesito {0} billetes de 20'.format (billetes_20))
                    resto = resto % 20
                    if(resto !=0):
                        billetes_10 = resto // 10 
                        print('necesito {0} billetes de 10'.format (billetes_10))
                        resto = resto % 10
                        if(resto !=0):
                            billetes_5 = resto // 5 
                            print('necesito {0} billetes de 5'.format (billetes_5))
                            resto = resto % 5
                            if(resto !=0):
                                monedas_2 = resto // 2 
                                print('necesito {0} monedas de 2'.format (monedas_2))
                                resto = resto % 2
                                if(resto !=0):
                                    monedas_1 = resto // 1 
                                print('necesito {0} monedas de 1'.format (monedas_1))
                                resto = resto % 1
                