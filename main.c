#include <stdio.h>
#include <stdlib.h> // atoi, itoa, exit
#include "parser.h"

extern FILE *yyin;
extern int yyparse();

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        printf("Uso: %s archivo_de_entrada\n", argv[0]);
        return 1;
    }

    FILE *archivo = fopen(argv[1], "r");
    if (archivo == NULL)
    {
        perror("Error al abrir el archivo");
        return 1;
    }

    yyin = archivo; // Asigna el archivo de entrada al analizador léxico

    return yyparse();
}