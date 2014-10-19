/*	
	@File:		grammar.y
	@Brief:		STL file syntax validation tool
	@Author: 	Fadi Hanna Al-Kass
	@Email:		eliya.3@wright.edu
*/

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include <stdbool.h>

	#ifndef	EXIT_SUCCESS
	#define	EXIT_SUCCESS	( 0 == 0 )
	#endif

	#ifndef	EXIT_FAILURE
	#define	EXIT_FAILUR	( 0 == 1 )
	#endif

	extern FILE * yyin;

	int yyline;

	char * name;

	void yyerror(const char * str)
	{
		printf("Error at line %d: %s\n", yyline, str);
	}

%}


%union
{
	char * str;
	int real;
	float scientific;
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
%token	<scientific>	FLOAT;
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
