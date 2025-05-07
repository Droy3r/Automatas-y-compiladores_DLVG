%{
	#include<stdio.h>
	#include <stdlib.h>

	void yyerror(const char *s);
	int yylex(void);

}%
%%

%token NUM MUL

linea : multipl '\n' { printf("MULTIPLICAION AUTORIZADA B).\n"); }
      ;

multipl  : NUM MUL NUM
          ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Introduce una multiplicación:\n");
    return yyparse();
}
%]