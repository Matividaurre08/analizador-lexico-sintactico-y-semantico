#ifndef TABLASIMBOLOS_H
#define TABLASIMBOLOS_H

#include <stdlib.h>
#include <float.h>

#define TIPO_ENTERO 0
#define TIPO_REAL 1

typedef struct tabla
{
    char *nombre;
    int tipo;     // tipo entero (TIPO_ENTERO) o tipo real (TIPO_REAL)
    double valor; // valor numérico, puede ser entero o real

    struct tabla *siguiente; // para enlazar con otra entrada
} tabla;

extern tabla *tablaSimbolos;

tabla *ingresarIdentificador(char *, char *);
tabla *obtenerIdentificador(char *);

#endif