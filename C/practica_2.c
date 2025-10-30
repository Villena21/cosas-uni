#include <stdio.h>
#include <math.h>

int main(){
    int x;
    int y;
    int suma;
    int resta;
    int multiplicacion;
    int division;
    char op;

    printf("Por favor, introduzca el primer numero: ");
    scanf("%d", &x);
    printf("Por favor, introduzca su segundo numero: ");
    scanf("%d", &y);
    printf("Por favor, decida la operacion a realizar: ");
    scanf("%s", &op);
    if (op == "suma"){
        suma = x + y;
        printf(suma);
    }
    
    
    return 0;
}