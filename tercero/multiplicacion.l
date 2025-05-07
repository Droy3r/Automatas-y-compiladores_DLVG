%option noyywrap
%{
	#include<stdio.h>
	#include "y.tab.h"
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUM; }
\*          { return MUL; }
[ \t\n]+    { /* ignorar espacios y tabulaciones */ }
.           { return yytext[0]; }
%%
int yywrap(void) {
    return 1;
}