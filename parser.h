/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_H_INCLUDED
# define YY_YY_PARSER_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    INICIO_PROGRAMA = 258,         /* INICIO_PROGRAMA  */
    FIN_PROGRAMA = 259,            /* FIN_PROGRAMA  */
    ENTERO = 260,                  /* ENTERO  */
    REAL = 261,                    /* REAL  */
    MOSTRAR = 262,                 /* MOSTRAR  */
    LEER = 263,                    /* LEER  */
    MAYOR = 264,                   /* MAYOR  */
    MENOR = 265,                   /* MENOR  */
    IGUAL = 266,                   /* IGUAL  */
    DECLARACION = 267,             /* DECLARACION  */
    CONSTANTE_REAL = 268,          /* CONSTANTE_REAL  */
    CONSTANTE_ENTERA = 269,        /* CONSTANTE_ENTERA  */
    IDENTIFICADOR = 270,           /* IDENTIFICADOR  */
    OP_SUMA = 271,                 /* OP_SUMA  */
    OP_RESTA = 272,                /* OP_RESTA  */
    OP_MULTIPLICACION = 273,       /* OP_MULTIPLICACION  */
    OP_DIVISION = 274,             /* OP_DIVISION  */
    OP_EXPONENTE = 275,            /* OP_EXPONENTE  */
    OP_RAIZ = 276,                 /* OP_RAIZ  */
    OP_ASIGNACION = 277,           /* OP_ASIGNACION  */
    LLAVE_IZQ = 278,               /* LLAVE_IZQ  */
    LLAVE_DER = 279,               /* LLAVE_DER  */
    PARENTESIS_IZQ = 280,          /* PARENTESIS_IZQ  */
    PARENTESIS_DER = 281,          /* PARENTESIS_DER  */
    PUNTOYCOMA = 282,              /* PUNTOYCOMA  */
    SALTOLINEA = 283               /* SALTOLINEA  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 20 "parser.y"

    char *str;
    double real;
    int entero;

#line 98 "parser.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif


extern YYSTYPE yylval;
extern YYLTYPE yylloc;

int yyparse (void);

/* "%code provides" blocks.  */
#line 12 "parser.y"

void yyerror(const char *);

#line 131 "parser.h"

#endif /* !YY_YY_PARSER_H_INCLUDED  */
