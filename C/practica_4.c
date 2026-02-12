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

    FILE* DEMO;
    DEMO = fopen("demo.txt", "w+");
    fprintf(DEMO, "Su nombre es: %s\n", nombre);
    fprintf(DEMO, "Sus apellidos son: %s\n", Apellidos);
    fprintf(DEMO, "Su DNI es: %s\n", DNI);
    fprintf(DEMO, "Su numero de telefono es: %d\n", numero);
    fprintf(DEMO, "Su correo electronico es: %s\n", mail);
    fprintf(DEMO, "Su ciudad es: %s\n", ciudad);
    fprintf(DEMO, "Su provincia es: %s\n", provincia);
    fclose(DEMO);

    rename("demo.txt", "demo_e.txt");
    remove("demo_e.txt");

    fscanf(DEMO, "%s", nombre);
    printf("Su nombre es: %s\n", nombre);
    fscanf(DEMO, "%s", Apellidos);
    printf("Sus apellidos son: %s\n", Apellidos);
    fscanf(DEMO, "%s", DNI);
    printf("Su DNI es: %s\n", DNI);
    fscanf(DEMO, "%d", numero);
    printf("Su numero de telefono es: %d\n", numero);
    fscanf(DEMO, "%s", mail);
    printf("Su correo electronico es: %s\n", mail);
    fscanf(DEMO, "%s", ciudad);
    printf("Su ciudad es: %s\n", ciudad);
    fscanf(DEMO, "%s", provincia);
    printf("Su provincia es: %s\n", provincia);
    
    return 0;
    
    

}