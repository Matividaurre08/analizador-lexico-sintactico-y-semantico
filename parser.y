%code top {
    #include <stdio.h>
    #include "parser.h"
    int yylex();
}

%output "parser.c"

%union {
    char *str;
    double real;
    int entero;
}

%start              inicio 

%token<str>         INICIO_PROGRAMA FIN_PROGRAMA ENTERO FLOTANTE MOSTRAR LEER MAYOR MENOR IGUAL DECLARACION

%token<real>        CONSTANTE_ENTERA CONSTANTE_FLOTANTE

%token<str>         IDENTIFICADOR

%token              OP_SUMA OP_RESTA OP_MULTIPLICACION OP_DIVISION OP_EXPONENTE OP_RAIZ OP_ASIGNACION

%token              LLAVE_IZQ LLAVE_DER PARENTESIS_IZQ PARENTESIS_DER COMA COMENTARIO
%%

inicio:                 /*produccionVacia*/
                        | inicioPrograma '{'  '\n' '}' '\n' finPrograma

inicioPrograma:         INICIO_PROGRAMA

finPrograma:            FIN_PROGRAMA

%%

int main(int argc, char *argv[])
{
    return yyparse();
}