#include <stdio.h>  // printf, scanf y FILE
#include <stdlib.h> // atoi, itoa, exit
#include "parser.h" // yyparse

extern FILE *yyin;    // Archivo de entrada para el analizador lexico
extern int yyparse(); // Funcion que llama al analizador sintactico

int main(int argc, char *argv[])
{
    return yyparse();
}