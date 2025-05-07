%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "struct.h"

extern int current_line;
extern int yylex();
void yyerror(const char *s);
symbtbl *register_entry(char *, char *, int);

%}

%union {
    char *str;
}

%token SELECT FROM WHERE AND OR DELETE UPDATE SET INSERT INTO VALUES
%token <str> IDENTIFIER NUMBER STRING
%token '*' ',' '=' '<' '>' ';' '(' ')'

%type <str> fields tables rule expr entries columns

%%

input: /* empty */
     | input line
     ;

line: stmt ';' { printf(" Consulta procesada %d\n", current_line); }
    | error { yyerror("Error de sintaxis"); }
    ;

stmt: find_stmt
    | add_stmt
    | modify_stmt
    | remove_stmt
    ;

find_stmt: FIND columns SOURCE tables opt_where {
               register_entry($2, $4, current_line);
            }
           ;

columns: '*' { $$ = strdup("*"); }
              | fields { $$ = $1; }
              ;

add_stmt: ADD TO IDENTIFIER '(' fields ')' DATA '(' entries ')' {
               char buffer[512];
               sprintf(buffer, "(%s) DATA(%s)", $5, $9);
               register_entry($3, buffer, current_line);
            }
           ;

remove_stmt: REMOVE SOURCE IDENTIFIER opt_where {
               register_entry("REMOVE", $3, current_line);
            }
           ;

modify_stmt: MODIFY IDENTIFIER ASSIGN IDENTIFIER '=' expr opt_where {
               char buffer[256];
               sprintf(buffer, "%s=%s", $4, $6);
               register_entry($2, buffer, current_line);
            }
           ;

opt_where: 
         | FILTER rule
         ;

fields: IDENTIFIER { $$ = $1; }
           | fields ',' IDENTIFIER {
                 char *tmp = malloc(strlen($1) + strlen($3) + 2);
                 sprintf(tmp, "%s,%s", $1, $3);
                 $$ = tmp;
             }
           ;

tables: IDENTIFIER { $$ = $1; }
          | tables ',' IDENTIFIER {
                char *tmp = malloc(strlen($1) + strlen($3) + 2);
                sprintf(tmp, "%s,%s", $1, $3);
                $$ = tmp;
            }
          ;

rule: expr '=' expr { $$ = strdup("rule"); }
         | expr '<' expr { $$ = strdup("less than"); }
         | expr '>' expr { $$ = strdup("greater than"); }
         | rule AND rule { $$ = strdup("AND rule"); }
         | rule OR rule { $$ = strdup("OR rule"); }
         ;

expr: IDENTIFIER { $$ = $1; }
     | NUMBER { $$ = $1; }
     | STRING { $$ = $1; }
     ;

entries: expr { $$ = $1; }
          | entries ',' expr {
                char *tmp = malloc(strlen($1) + strlen($3) + 2);
                sprintf(tmp, "%s,%s", $1, $3);
                $$ = tmp;
            }
          ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error en línea %d: %s\n", current_line, s);
}

int main() {
    printf("Analizador SQL listo:\n");
    yyparse();
    return 0;
}