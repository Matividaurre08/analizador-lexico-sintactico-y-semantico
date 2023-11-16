#include "tablaSimbolos.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern tabla *tablaSimbolos;

tabla *ingresarIdentificador(char *nombre, int tipo)
{
    tabla *entrada = (tabla *)malloc(sizeof(tabla));
    entrada->nombre = strdup(nombre);
    entrada->tipo = tipo;
    entrada->siguiente = (struct tabla *)tablaSimbolos;
    tablaSimbolos = entrada;
    return entrada;
}

tabla *obtenerIdentificador(char *nombre)
{
    tabla *entrada;

    for (entrada = tablaSimbolos; entrada != (tabla *) 0; entrada = (tabla *)entrada->siguiente){
        if (strcmp(entrada->nombre, nombre) == 0){
            return entrada;
        }
    }
    return 0;
}