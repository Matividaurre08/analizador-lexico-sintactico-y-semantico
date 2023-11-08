%locations 
%code top {
    #include <stdio.h>
    #include <stdlib.h>
    #include "parser.h"
    int yylex();
    int yyerror();
}

%defines "parser.h"
%output "parser.c"

%union {
    char *str;
    double real;
    int entero;
}

%start              inicio

%token              INICIO_PROGRAMA FIN_PROGRAMA ENTERO FLOTANTE MOSTRAR LEER MAYOR MENOR IGUAL DECLARACION

%token<real>        CONSTANTE_FLOTANTE

%token<entero>      CONSTANTE_ENTERA 

%token<str>         IDENTIFICADOR

%token              OP_SUMA OP_RESTA OP_MULTIPLICACION OP_DIVISION OP_EXPONENTE OP_RAIZ OP_ASIGNACION

%token              LLAVE_IZQ LLAVE_DER PARENTESIS_IZQ PARENTESIS_DER COMA COMENTARIO

%%

inicio:             inicioPrograma            

inicioPrograma:     INICIO_PROGRAMA                                             {exit(0);}
                    | INICIO_PROGRAMA LLAVE_IZQ linea LLAVE_DER FIN_PROGRAMA          {exit(0);}

linea:              linea sentencia
                    | sentencia

sentencia:          DECLARACION ENTERO {exit(0);}
%%

int yyerror(char *mensajeError) {
    printf("Error sintactico: %s\n", mensajeError);
    exit(1);
}
