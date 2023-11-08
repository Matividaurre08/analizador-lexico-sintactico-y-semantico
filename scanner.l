/*SECCION DE DEFICINIONES -> DECLARACIONES DE VARIABLES Y LIBRERIAS A USAR*/
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "parser.h"
    int yyerror();
    char mensajeError[120];
%}

/*SECCION DE OPCIONES*/ 
%option outfile="scanner.c"
%option yylineno 
%option noyywrap

/*SECCION TOKENS*/
LETRA               [A-Z]
DIGITO              [0-9]
CHAR_NUMERAL        ["#"]
CHAR_PUNTO          ["."]

IDENTIFICADOR       {CHAR_NUMERAL}{LETRA}{1,15}
CONSTANTE_ENTERA    -?{DIGITO}+
CONSTANTE_FLOTANTE  -?{DIGITO}+{CHAR_PUNTO}{DIGITO}+

OP_SUMA             ["+"]
OP_RESTA            ["-"]
OP_DIVISION         ["/"]
OP_MULTIPLICACION   ["*"]
OP_EXPONENTE        ["**"]
OP_RAIZ             ["sqrt"]
OP_ASIGNACION       ["="]

INICIO_PROGRAMA     ["inicioPrograma"]
FIN_PROGRAMA        ["finPrograma"]
ENTERO              ["entero"]
FLOTANTE            ["flotante"]
MOSTRAR             ["mostrar"]
LEER                ["leer"]
MAYOR               ["mayor"]
MENOR               ["menor"]
IGUAL               ["igual"]
DECLARACION         ["decvar"]

LLAVE_IZQ           ["{"]
LLAVE_DER           ["}"]
PARENTESIS_IZQ      ["("]
PARENTESIS_DER      [")"]
COMA                [","]
COMENTARIO          ["$$"]

/*SECCION DE REGLAS*/
/*Primero muestro las palabras reservadas porque sino las identifica como identificadores*/
%%
{OP_SUMA}            return OP_SUMA;
{OP_RESTA}           return OP_RESTA;
{OP_DIVISION}        return OP_DIVISION;
{OP_MULTIPLICACION}  return OP_MULTIPLICACION;
{OP_EXPONENTE}       return OP_EXPONENTE;
{OP_RAIZ}            return OP_RAIZ;
{OP_ASIGNACION}      return OP_ASIGNACION;

{INICIO_PROGRAMA}    {return INICIO_PROGRAMA;}
{FIN_PROGRAMA}       {return FIN_PROGRAMA;}
{ENTERO}             {return ENTERO;}
{FLOTANTE}           {return FLOTANTE;}
{MOSTRAR}            {return MOSTRAR;}
{LEER}               {return LEER;}
{MAYOR}              {return MAYOR;}
{MENOR}              {return MENOR;}
{IGUAL}              {return IGUAL;}
{DECLARACION}        {return DECLARACION;}

{LLAVE_IZQ}          {return LLAVE_IZQ;}
{LLAVE_DER}          {return LLAVE_DER;}
{PARENTESIS_IZQ}     {return PARENTESIS_IZQ;}
{PARENTESIS_DER}     {return PARENTESIS_DER;}
{COMA}               {return COMA;}
{COMENTARIO}         {return COMENTARIO;}

{IDENTIFICADOR}      {yylval.str = strdup(yytext); return IDENTIFICADOR;}
{CONSTANTE_ENTERA}   {yylval.entero = atoi(yytext); return CONSTANTE_ENTERA;}
{CONSTANTE_FLOTANTE} {yylval.real = atof(yytext); return CONSTANTE_FLOTANTE;}

" "
"\n"                    
.                    {printf("Error Lexico, token invalido: %s\n",yytext);}
%%

