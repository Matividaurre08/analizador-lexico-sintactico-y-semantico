all: 
	flex scanner.l
	bison -d parser.y
	gcc -o programa.exe *.c -lm
	./programa.exe prueba5.txt

clean:
	rm scanner.c
	rm scanner.h
	rm parser.c
	rm parser.h
	rm programa.exe