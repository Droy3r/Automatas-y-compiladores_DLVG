%{
    #include<stdio.h>
    int yylex();
    int yyerror(const char *s) {
        fprintf(stderr, "Error: %s\n", s);
        return 0;
    }
%}

%%

%token NUM MAS MENOS MULT DIV EOL
%start statements;

statements : expression EOL { printf("= %d\n", $1); }

expression : NUM { $$ = $1; printf("numero: %d\n", $$); }
           | NUM MAS NUM { $$ = $1 + $3; printf("SUMA+: %d\n", $$); }
           | NUM MULT NUM { $$ = $1 * $3; printf("MULT*: %d\n", $$); }
	   | NUM MENOS NUM { $$ = $1 - $3; printf("RESTA-: %d\n", $$); }
           | NUM DIV NUM { 
                if ($3 == 0) {
                    yyerror("Division by zero error");
                    $$ = 0;
                } else {
                    $$ = $1 / $3; 
                    printf("DIV/: %d\n", $$); 
                }
           }

%%

int main () {
    yyparse();
    return 1;
}