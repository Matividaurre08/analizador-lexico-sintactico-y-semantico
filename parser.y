%locations 
%code top {
    #include <stdio.h>
    #include <stdlib.h>
    #include "scanner.h"
    #include "parser.h"
    #include "tablaSimbolos.h"
    tabla *aux;
    extern char mensajeError[120];
}

%code provides {
void yyerror(const char *);
}

%defines "parser.h"
%output "parser.c"
%define parse.error verbose

%union {
    char *str;
    double real;
    int entero;
}

%start              inicio

%token              INICIO_PROGRAMA FIN_PROGRAMA ENTERO REAL MOSTRAR LEER MAYOR MENOR IGUAL DECLARACION

%token<real>        CONSTANTE_REAL

%token<entero>      CONSTANTE_ENTERA 

%token<str>         IDENTIFICADOR

%token              OP_SUMA OP_RESTA OP_MULTIPLICACION OP_DIVISION OP_EXPONENTE OP_RAIZ OP_ASIGNACION

%token              LLAVE_IZQ LLAVE_DER PARENTESIS_IZQ PARENTESIS_DER PUNTOYCOMA SALTOLINEA

%%

inicio:                 INICIO_PROGRAMA SALTOLINEA programa

programa:               linea | programa linea 

linea:                  SALTOLINEA
                        | sentencia SALTOLINEA
                        | FIN_PROGRAMA                                              {exit(0);}
                        | error                                                 

sentencia:              sentenciaExpresion | sentenciaSalida

sentenciaExpresion:       expresion                                                 {printf("HOLI\n");}   
                        | IDENTIFICADOR                                             {aux = obtenerIdentificador($<str>1); if(aux){$<entero>$ = aux->valor;} else {sprintf(mensajeError,"Error semantico -> ID %s no declarado",$<str>1);yyerror(mensajeError);}}                            
                        | IDENTIFICADOR OP_ASIGNACION expresion                     {aux = obtenerIdentificador($<str>1); if(aux){$<entero>$ = aux -> valor += $<entero>3;} else { sprintf(mensajeError,"Error semantico -> ID %s no declarado",$1);yyerror(mensajeError);}}
                        | DECLARACION tipo IDENTIFICADOR                            {aux = obtenerIdentificador($<str>3); if(aux){printf("Error, identficador %s ya declarado",$<str>3);} else {aux = ingresarIdentificador($<str>3,$<str>2);$<entero>$ = aux->valor = 0;}}
                        | DECLARACION tipo IDENTIFICADOR OP_ASIGNACION expresion    {aux = obtenerIdentificador($<str>3); if(aux){printf("Error, identficador %s ya declarado",$<str>3);} else {aux = ingresarIdentificador($<str>3,$<str>2);$<entero>$ = aux->valor = $<entero>5;}}

sentenciaSalida:        MOSTRAR PARENTESIS_IZQ expresion PARENTESIS_DER             {printf("%d\n",$<entero>3);}

tipo:                   ENTERO | REAL

expresion:              CONSTANTE_ENTERA                                            {$<entero>$ = $<entero>1;}

%%

void yyerror(const char *s){
    printf("Línea #%d: %s\n", yylineno, s);
    return;
}
