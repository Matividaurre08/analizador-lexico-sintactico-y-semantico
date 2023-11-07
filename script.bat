@echo off
bison -d -o parser.c parser.y
flex -l scanner.l	
gcc -o main parser.c scanner.c -lfl
./main < prueba.txt
del scanner.c
pause
