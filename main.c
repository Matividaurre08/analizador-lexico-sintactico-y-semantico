#include <stdio.h>  // printf, scanf y FILE
#include <stdlib.h> // atoi, itoa, exit

extern FILE *yyin;    // Archivo de entrada para el analizador lexico
extern int yyparse(); // Funcion que llama al analizador sintactico

int main(int argc, char *argv[])
{
    if (yyin = fopen(argv[1], "r"))
    {
        printf("Se ha abierto el archivo: %s\n", argv[1]);
        return yyparse();
    }
    else
        printf("El archivo no se ha podido abrir\n");
    fclose(yyin);
    return 0;
}