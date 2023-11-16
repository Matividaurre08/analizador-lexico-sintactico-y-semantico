/*SECCION DE DEFICINIONES -> DECLARACIONES DE VARIABLES Y LIBRERIAS A USAR*/
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "parser.h"
    char mensajeError[120];
%}

/*SECCION DE OPCIONES*/ 
%option outfile="scanner.c"
%option header-file="scanner.h"
%option yylineno 
%option noyywrap

/*SECCION TOKENS*/
LETRA               [A-Z]
DIGITO              [0-9]
CHAR_NUMERAL        "#"
CHAR_PUNTO          "."

IDENTIFICADOR       {CHAR_NUMERAL}{LETRA}{1,15}
CONSTANTE_ENTERA    -?{DIGITO}+
CONSTANTE_REAL      -?{DIGITO}+{CHAR_PUNTO}{DIGITO}+
LITERALCADENA       "--"([A-Z]|[a-z]|" "|[0-9])+"--"
OTROS               [[:punct:]]{-}[()+\-*/,=]

OP_SUMA             "+"
OP_RESTA            "-"
OP_DIVISION         "/"
OP_MULTIPLICACION   "*"
OP_EXPONENTE        "**"
OP_RAIZ             "sqrt"
OP_ASIGNACION       "="

INICIO_PROGRAMA     "inicioPrograma"
FIN_PROGRAMA        "finPrograma"
ENTERO              "entero"
REAL                "real"
MOSTRAR             "mostrar"
MAYOR               "mayor"
MENOR               "menor"
IGUAL               "igual"
DECLARACION         "decvar"

PARENTESIS_IZQ      "("
PARENTESIS_DER      ")"
COMA                ","

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
{REAL}               {return REAL;}
{MOSTRAR}            {return MOSTRAR;}
{MAYOR}              {return MAYOR;}
{MENOR}              {return MENOR;}
{IGUAL}              {return IGUAL;}
{DECLARACION}        {return DECLARACION;}

{PARENTESIS_IZQ}     {return PARENTESIS_IZQ;}
{PARENTESIS_DER}     {return PARENTESIS_DER;}
{COMA}               {return COMA;}

{LITERALCADENA}                                     {yylval.str = strdup(yytext); return LITERALCADENA;}
{CHAR_NUMERAL}{LETRA}{15}{LETRA}+                   {sprintf(mensajeError,"Error Lexico -> identificador supera cantidad de caracteres: %s",yytext);yyerror(mensajeError);}
{IDENTIFICADOR}                                     {yylval.str = strdup(yytext); return IDENTIFICADOR;}
{CHAR_NUMERAL}{LETRA}({LETRA}|{DIGITO}|{OTROS})*    {sprintf(mensajeError,"Error Lexico -> identificador invalido: %s",yytext);yyerror(mensajeError);}

{CONSTANTE_ENTERA}                                                  {yylval.entero = atoi(yytext); return CONSTANTE_ENTERA;}
{CONSTANTE_REAL}                                                    {yylval.real = atof(yytext); return CONSTANTE_REAL;}
{CONSTANTE_ENTERA}({CONSTANTE_ENTERA}|{LETRA}|{DIGITO}|{OTROS})+    {sprintf(mensajeError,"Error Lexico -> constante numerica invalida: %s",yytext);yyerror(mensajeError);}

"\n"                                                                return SALTOLINEA;
" "
.                                                                   {sprintf(mensajeError,"Error Lexico, token invalido: %s",yytext);yyerror(mensajeError);}
%%

