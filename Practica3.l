%{
#include <stdio.h>
#include <ctype.h>
#include <string.h>

// Funci�n para las minusculas(tolower)
void toLowerCase(char *str) {
    for (int i = 0; str[i]; i++) {
        str[i] = tolower(str[i]);
    }
}
%}

%%

/* Conversi�n de texto a min�sculas */
[a-zA-Z]+ {
    toLowerCase(yytext);
    printf("Texto en min�sculas: %s\n", yytext);
}

/* Taxonom�a de Bloom (A) */
("aplicar"|"calcular"|"clasificar"|"demostrar"|"dramatizar"|"emplear"|"esbozar"|"experimentar"|"ilustrar"|"interpretar"|"manipular"|"operar"|"practicar"|"relacionar"|"reparar"|"traducir"|"usar"|"utilizar") { 
    printf("Verbo de aplicaci�n encontrado: %s\n", yytext);
}

/* Taxonom�a de Bloom (B) */
("analizar"|"comparar"|"contrastar"|"criticar"|"diferenciar"|"discriminar"|"distinguir"|"examinar"|"experimentar"|"formular"|"inferir"|"investigar"|"organizar"|"separar"|"verificar") { 
    printf("Verbo de an�lisis encontrado: %s\n", yytext);
}

/* Adjetivos calificativos */
("hermoso"|"inteligente"|"brillante"|"excelente"|"maravilloso"|"espl�ndido"|"sabio"|"talentoso") { 
    printf("Adjetivo positivo encontrado: %s\n", yytext);
}

/* Conjunciones */
("y"|"o"|"pero"|"aunque"|"sin embargo"|"porque"|"mientras") { 
    printf("Conjunci�n encontrada: %s\n", yytext);
}

/* Preposiciones */
("a"|"ante"|"bajo"|"cabe"|"con"|"contra"|"de"|"en"|"entre"|"hasta"|"para"|"por"|"seg�n"|"sobre"|"tras") { 
    printf("Preposici�n encontrada: %s\n", yytext);
}

/* Pronombres */
("yo"|"t�"|"�l"|"nosotros"|"vosotros"|"ellos"|"ella"|"usted"|"ustedes"|"m�o"|"tuyo"|"suyo"|"nuestro"|"vuestro") { 
    printf("Pronombre encontrado: %s\n", yytext);
}

/* Palabras reservadas en C */
("auto"|"break"|"case"|"char"|"const"|"default"|"do"|"double"|"else"|"float"|"for"|"goto"|"if"|"int"|"register"|"return"|"signed"|"static"|"struct"|"switch"|"union"|"void"|"while") { 
    printf("Palabra reservada de C encontrada: %s\n", yytext);
}

/* Variables en C (identificadores) */
[a-zA-Z_][a-zA-Z0-9_]* { 
    printf("Posible variable encontrada: %s\n", yytext);
}

/* Comentarios de una l�nea en C */
"//".* { 
    printf("Comentario de una l�nea detectado: %s\n", yytext);
}

/* Texto mostrado en pantalla (C: printf, puts) */
\"[^\"]*\" { 
    printf("Texto mostrado en pantalla detectado: %s\n", yytext);
}

/* Ignorar espacios y saltos de l�nea */
[\n\t ]+ ;

%%

int main() {
    printf("Ingrese el texto a analizar:\n");
    yylex();
    return 0;
}

int yywrap() { return 1; }
