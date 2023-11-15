#include "tablaSimbolos.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

tabla *ingresarIdentificador(char *nombre, char *tipo)
{
    tabla *entrada = (tabla *)malloc(sizeof(tabla));
    entrada->nombre = (char *)malloc(strlen(nombre) + 1);
    strcpy(entrada->nombre, nombre);
    if(strcmp(tipo,"entero")==0)
        entrada->tipo = TIPO_ENTERO;
    else
        entrada->tipo = TIPO_REAL;
    entrada->siguiente = (struct tabla *)tablaSimbolos;
    tablaSimbolos = entrada;
    return entrada;
}

tabla *obtenerIdentificador(char *nombre)
{
    tabla *entrada;
    for (entrada = tablaSimbolos; entrada != NULL; entrada = (tabla *)entrada->siguiente)
        if (strcmp(entrada->nombre, nombre) == 0)
            return entrada;
    return 0;
}