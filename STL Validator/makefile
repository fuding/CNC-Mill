CC=gcc
LEXER=lex
PARSER=yacc -d
OPTIMIZATION_LEVEL=-O3
OUT=-o validator


all: build

install: build

build:	*.l *.y
	@echo "Compiling *.l *.y"
	$(LEXER) *.l
	$(PARSER) *.y
	$(CC) *.c *.h ${OUT} ${OPTIMIZATION_LEVEL}
	make clean

clean: y.tab.* lex*.c
	rm y.tab.* lex*.c

