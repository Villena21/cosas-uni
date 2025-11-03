#include <stdio.h>

int main() {
    int x, y;
    int suma, resta, multiplicacion;
    float division;

    printf("Introduce su primer número: ");
    scanf("%d", &x);

    printf("Introduce su segundo número: ");
    scanf("%d", &y);

    suma = x + y;
    resta = x - y;
    multiplicacion = x * y;
    division = x / y;

    printf("La suma es: %d\n", suma);
    printf("La resta es: %d\n", resta);
    printf("La multiplicación es: %d\n", multiplicacion);
    if (y == 0) {
        printf("no se puede dividir entre 0\n");
    } 
    else {
        division = (float)x / y; 
        printf("La división es: %.1f\n", division);
    }

    return 0;
}