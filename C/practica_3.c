#include <stdio.h>

int main(){
    
    char nombre[51] = "Maria de las mercedes";
    char Apellidos[99] = "santo grial juncos pardos";
    char DNI[20] = "123456789Q";
    int numero;
    numero = 123456789;
    char mail[150] = "mariadelasmercedessantogrialjuncospardoss@gmail.com";
    char ciudad [9] = "Madrid";
    char provincia [9] = "Madrid";
    
    printf("El nombre es: %s\n", nombre);
    printf("Sus apellidos son: %s\n", Apellidos);
    printf("Su DNI es: %s\n", DNI);
    printf("Su numero de telefono es: %d\n", numero);
    printf("Su correo electronico es: %s\n", mail);
    printf("Su ciudad es: %s\n", ciudad);
    printf("Su provincia es: %s\n", provincia);

    FILE* DEMO;
    DEMO = fopen("Demo.txt", "w+");
    fprintf(DEMO, "Su nombre es: %s\n", nombre);
    fprintf(DEMO, "Sus apellidos son: %s\n", Apellidos);
    fprintf(DEMO, "Su DNI es: %s\n", DNI);
    fprintf(DEMO, "Su numero de telefono es: %d\n", numero);
    fprintf(DEMO, "Su correo electronico es: %s\n", mail);
    fprintf(DEMO, "Su ciudad es: %s\n", ciudad);
    fprintf(DEMO, "Su provincia es: %s\n", provincia);
    fclose(DEMO);

    return 0;
    
    
}