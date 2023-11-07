
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     INICIO_PROGRAMA = 258,
     FIN_PROGRAMA = 259,
     ENTERO = 260,
     FLOTANTE = 261,
     MOSTRAR = 262,
     LEER = 263,
     MAYOR = 264,
     MENOR = 265,
     IGUAL = 266,
     DECLARACION = 267,
     CONSTANTE_ENTERA = 268,
     CONSTANTE_FLOTANTE = 269,
     IDENTIFICADOR = 270,
     OP_SUMA = 271,
     OP_RESTA = 272,
     OP_MULTIPLICACION = 273,
     OP_DIVISION = 274,
     OP_EXPONENTE = 275,
     OP_RAIZ = 276,
     OP_ASIGNACION = 277,
     LLAVE_IZQ = 278,
     LLAVE_DER = 279,
     PARENTESIS_IZQ = 280,
     PARENTESIS_DER = 281,
     COMA = 282,
     COMENTARIO = 283
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 9 "parser.y"

    char *str;
    double real;
    int entero;



/* Line 1676 of yacc.c  */
#line 88 "parser.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


