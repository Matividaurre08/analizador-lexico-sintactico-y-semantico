%code top {
    #include <stdio.h>
    int yylex();
    #include "scanner.h"
}

%defines "parser.h"
%output "parser.c"

%union {
    char *str;
    double real;
    int entero;
}

%start              inicio 

%token<str>         INICIO_PROGRAMA FIN_PROGRAMA ENTERO FLOTANTE MOSTRAR LEER MAYOR MENOR IGUAL DECLARACION

%token<real>        CONSTANTE_FLOTANTE

%token<entero>      CONSTANTE_ENTERA 

%token<str>         IDENTIFICADOR

%token              OP_SUMA OP_RESTA OP_MULTIPLICACION OP_DIVISION OP_EXPONENTE OP_RAIZ OP_ASIGNACION

%token              LLAVE_IZQ LLAVE_DER PARENTESIS_IZQ PARENTESIS_DER COMA COMENTARIO

%type<real> expresion 
%%

inicio:                 /*produccionVacia*/
                        | inicioPrograma '{' '\n' sentencia '}' '\n' finPrograma

inicioPrograma:         INICIO_PROGRAMA

finPrograma:            FIN_PROGRAMA

sentencia:              /*produccionVacia*/
                        | sentencia '\n' sentenciaAsignacion         

sentenciaAsignacion:     DECLARACION ENTERO IDENTIFICADOR '=' expresion '\n'            {printf("\t Resultado: %.10g\n>",$1)}

expresion: CONSTANTE_ENTERA { $$ = $1; }

%%

int yyerror(char *mensajeError) {
    printf("Linea #%d_ %s\n",yylineno, mensajeError);
    exit(1);
}

int main(int argc, char *argv[])
{
    return yyparse();
}