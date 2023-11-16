%locations 
%code top {
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>
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

%token<str>         IDENTIFICADOR LITERALCADENA

%token              OP_SUMA OP_RESTA OP_MULTIPLICACION OP_DIVISION OP_EXPONENTE OP_RAIZ OP_ASIGNACION

%token              LLAVE_IZQ LLAVE_DER PARENTESIS_IZQ PARENTESIS_DER COMA SALTOLINEA 

%left               OP_SUMA OP_RESTA

%%

inicio:                 INICIO_PROGRAMA SALTOLINEA programa

programa:               linea | programa linea 

linea:                  SALTOLINEA
                        | sentencia SALTOLINEA                                      
                        | FIN_PROGRAMA                                              {exit(0);}
                        | error                                                 

sentencia:              sentenciaAsignacion 
                        | sentenciaSalida 

sentenciaAsignacion:    IDENTIFICADOR OP_ASIGNACION expresion                       {aux = obtenerIdentificador($<str>1); if(aux){aux -> valor += $<real>3;} else { sprintf(mensajeError,"Error Semantico -> ID %s no declarado",$1);yyerror(mensajeError);}}
                        | DECLARACION tipo IDENTIFICADOR                            {aux = obtenerIdentificador($<str>3); if(aux != NULL){sprintf(mensajeError,"Error Semantico -> identificador %s ya declarado",$<str>3);yyerror(mensajeError);} else {aux = ingresarIdentificador($<str>3,$<entero>2);aux->valor = (double)0;}}
                        | DECLARACION tipo IDENTIFICADOR OP_ASIGNACION expresion    {aux = obtenerIdentificador($<str>3); if(aux != NULL){sprintf(mensajeError,"Error Semantico -> identificador %s ya declarado",$<str>3);yyerror(mensajeError);} else {aux = ingresarIdentificador($<str>3,$<entero>2);aux->valor = (double)$<real>5;}}                                                    

sentenciaSalida:        MOSTRAR PARENTESIS_IZQ listaExpresiones PARENTESIS_DER
                        | MOSTRAR PARENTESIS_IZQ LITERALCADENA PARENTESIS_DER       {printf("%s\n",$<str>4);} 

listaExpresiones:       listaExpresiones COMA expresion                             {if($<real>3-(int)$<real>3 == 0) {printf("%d\n", (int)$<real>3);} else {printf("%f\n",$<real>3);}}
                        | expresion                                                 {if($<real>1-(int)$<real>1 == 0) {printf("%d\n", (int)$<real>1);} else {printf("%f\n",$<real>1);}}

tipo:                   ENTERO                                                      {$<entero>$=TIPO_ENTERO;}
                        | REAL                                                      {$<entero>$=TIPO_REAL;}

expresion:              CONSTANTE_ENTERA                                            {$<real>$ = (double)$<entero>1;}
                        | CONSTANTE_REAL                                            {$<real>$ = (double)$<real>1;}
                        | IDENTIFICADOR                                             {aux = obtenerIdentificador($<str>1); if(aux){$<real>$ = aux->valor;} else {sprintf(mensajeError,"Error semantico -> ID %s no declarado",$<str>1);yyerror(mensajeError);}}                            
                        | expresion OP_SUMA expresion                               {$<real>$ = $<real>1 + $<real>3;}
                        | OP_RESTA expresion                                        {$<real>$ = - $<real>2;}
                        | expresion OP_RESTA expresion                              {$<real>$ = $<real>1 - $<real>3;}
                        | expresion OP_MULTIPLICACION expresion                     {$<real>$ = $<real>1 * $<real>3;}
                        | expresion OP_DIVISION expresion                           {$<real>$ = $<real>1 / $<real>3;}
                        | expresion OP_EXPONENTE expresion                          {$<real>$ = pow($<real>1,$<real>3);}
                        | OP_RAIZ PARENTESIS_IZQ expresion PARENTESIS_DER           {$<real>$ = sqrt((double)$<real>3);}
                        | PARENTESIS_IZQ expresion PARENTESIS_DER                   {$<real>$ = $<real>2;}
%%

void yyerror(const char *s){
    printf("Línea #%d: %s\n", yylineno, s);
    return;
}
