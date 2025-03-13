%option noyywrap
%{
	#include<stdio.h>
%}

%%
[0-9]+				     { printf("test1: Número entero -> %s\n", yytext); }
[0-9]+\.[0-9]+			     { printf("test2: Número decimal-> %s\n", yytext); }
[a-zA-Z][a-zA-Z0-9_]*		     { printf("test3: Variable      -> %s\n", yytext); }
[A-ZÑ]{4}[0-9]{6}[A-Z0-9]{3}	     { printf("test4: RFC           -> %s\n", yytext); }
[A-ZÑ]{4}[0-9]{6}[A-Z]{6}[0-9]{2}    { printf("test4: CURP          -> %s\n", yytext); }
[a-z]{2}[0-9]{4}\@[[a-z]+\.edu\.mx   { printf("test4: Correo inst.  -> %s\n", yytext); }
%%
int main()
{

	return yylex();
}
