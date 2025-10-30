#include <stdio.h>
#include <string.h>
int main()
{
printf("Please Input one color:");
char text[10];
scanf("%s", text);
char color1[]="red";
char color2[]="yellow";
char color3[]="green";
int x;
if(!strcmp(text, color1))
x=1;
else if(!strcmp(text, color2))
x=2;
else if(!strcmp(text, color3))
x=3;
else
x=4;
switch(x)
{
case 1:
printf("shosen color is red \n");
break;
case 2:
printf("shosen color is yelllow \n");
break;
case 3:
printf("shosen color is green\n");
break;
case 4:
printf("shosen color is unknown \n");
break;
}
return 0;
}