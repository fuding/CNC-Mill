/*      @File Name:	tokenizer.y
	@Brief:		STL file syntax tokenizer
	@Author: 	Fadi Hanna Al-Kass
	@Email:		eliya.3@wirght.edu
*/

%{
	#include "y.tab.h"
%}


%%

[ \t\n]+		;//return *yytext;

solid			return SOLID;

endsolid		return ENDSOLID;


[-+]?[0-9]*[.][0-9]+(e\+[0-9]+)?	{
						// convert here
						return FLOAT;
					}

[-+]?[0-9]*[.][0-9]+	{
				yylval.fraction = atof(yytext);
				return DOUBLE;
			}

[-+]?[0-9]+		{
				yylval.real = atoi(yytext);
				return INTEGER;
			}

outer			return OUTER;

loop			return LOOP;

endloop			return ENDLOOP;

vertex			return VERTEX;

facet			return FACET;

normal			return NORMAL;

endfacet		return ENDFACET;

[A-Za-z_]+		{
				int i;
				for (i = 0; yytext[i] != '\000'; i++);
				yylval.str = (char *)malloc(sizeof(char) * i);
				strcpy(yylval.str, yytext);
				return STRING;
			}

%%

int yywrap()
{
	return 1;
}
