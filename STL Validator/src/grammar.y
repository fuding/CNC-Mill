/*	
	@File Name: mini_calc.y
	@Brief:
	@Author: Fadi Hanna Al-Kass, http://fadialkass.blogspot.com
*/

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include <stdbool.h>


	extern FILE * yyin;

	int yyline;

	char * name;

	void yyerror(const char * str)
	{
		printf("Error in line %d: %s\n", yyline, str);
	}

%}


%union
{
	char * str;
	int real;
	double fraction;
}

%token	SOLID	ENDSOLID
%token	OUTER
%token	LOOP
%token	ENDLOOP
%token	FACET	ENDFACET
%token	NORMAL
%token	VERTEX
%token	<real>		INTEGER
%token	<fraction>	DOUBLE
%token	<str>		STRING

%%


program:
	program	procedure
	| 
	;

procedure:
	SOLID	STRING
		{
			printf("Object name: %s\n", $2);
			int i;
			for (i = 0; $2[i] != '\000'; i++);
			name = (char *)malloc(sizeof(char) * i);
			strcpy(name, $2);
		}

	body
		{
			// Add C code here
		}

	ENDSOLID	STRING
		{
			printf("Verifying object name...\n");
			if (strcmp(name, $7) != 0)
				yyerror("name mismatch");
		}
	;


body:
	bodyDetails
	| body bodyDetails
	;


bodyDetails:
	FACET NORMAL number number number
	OUTER LOOP
	vertex
	vertex
	vertex
	ENDLOOP
	ENDFACET
	;

vertex:
	VERTEX number number number
	;

number:
	INTEGER
	| DOUBLE;

%%


void err(const char * errorMessage)
{
	printf("Error: %s\n", errorMessage);
	exit(EXIT_FAILURE);
}


int main(int argc, char * args[])
{

	if (argc == 2)
	{
		FILE * infile = fopen(args[1], "r");
		if (!infile)
			err("Invalid source file.");
		else
			yyin = infile;
	}

	if (argc > 2)
		err("Too many command line arguments.");

	yyparse();
	return 0;
}
