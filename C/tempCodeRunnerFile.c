#include <stdio.h>

int main(){
    FILE* test;
    test=fopen("test.txt", "w+");

    fprintf(test, "%s,%s,%s", "Welcome", "to", "C");
    fclose(test);
}