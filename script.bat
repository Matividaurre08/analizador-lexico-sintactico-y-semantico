@echo off
bison parser.y
flex scanner.l
gcc -Wall parser.c scanner.c -o programa.exe -lfl -lm
./programa.exe prueba.txt
del parser.h
del parser.c
del scanner.c
pause
