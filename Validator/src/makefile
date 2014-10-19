CC=gcc -O3
LEXER=lex
PARSER=yacc -d
OUT=-o validate

all:		build

install:	build

build:	*.l *.y
	@echo "Compiling *.l *.y"
	$(LEXER) *.l
	$(PARSER) *.y
	$(CC) ${OUT} *.c *.h
	make clean

clean: y.tab.* lex*.c
	rm y.tab.* lex*.c

