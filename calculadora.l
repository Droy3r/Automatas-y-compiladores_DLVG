%{
    #include<stdio.h>
    extern int yylval;
%}

%%

[0-9]+        { yylval = atoi(yytext); return NUM; }
"+"           { return MAS; }
"-"           { return MENOS; }
"/"           { return DIV; }
"*"           { return MULT; }
\n            { return EOL; }
[ \t\n\r]      {}

%%

int yywrap(void) {
    return 1;
}