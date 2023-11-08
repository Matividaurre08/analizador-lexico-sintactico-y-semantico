@echo off
flex scanner.l
bison -d parser.y
gcc -o programa.exe main.c parser.c scanner.c -lm
.\programa.exe prueba.txt
del parser.h
del parser.c
del scanner.c
del programa.exe
pause
