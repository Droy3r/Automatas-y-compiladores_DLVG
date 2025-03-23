%{
#include <stdio.h>
#include <ctype.h>
#include <string.h>

// Función para las minusculas(tolower)
void toLowerCase(char *str) {
    for (int i = 0; str[i]; i++) {
        str[i] = tolower(str[i]);
    }
}
%}

%%

/* Conversión de texto a minúsculas */
[a-zA-Z]+ {
    toLowerCase(yytext);
    printf("Texto en minúsculas: %s\n", yytext);
}

/* Taxonomía de Bloom (A) */
("aplicar"|"calcular"|"clasificar"|"demostrar"|"dramatizar"|"emplear"|"esbozar"|"experimentar"|"ilustrar"|"interpretar"|"manipular"|"operar"|"practicar"|"relacionar"|"reparar"|"traducir"|"usar"|"utilizar") { 
    printf("Verbo de aplicación encontrado: %s\n", yytext);
}

/* Taxonomía de Bloom (B) */
("analizar"|"comparar"|"contrastar"|"criticar"|"diferenciar"|"discriminar"|"distinguir"|"examinar"|"experimentar"|"formular"|"inferir"|"investigar"|"organizar"|"separar"|"verificar") { 
    printf("Verbo de análisis encontrado: %s\n", yytext);
}

/* Adjetivos calificativos */
("hermoso"|"inteligente"|"brillante"|"excelente"|"maravilloso"|"espléndido"|"sabio"|"talentoso") { 
    printf("Adjetivo positivo encontrado: %s\n", yytext);
}

/* Conjunciones */
("y"|"o"|"pero"|"aunque"|"sin embargo"|"porque"|"mientras") { 
    printf("Conjunción encontrada: %s\n", yytext);
}

/* Preposiciones */
("a"|"ante"|"bajo"|"cabe"|"con"|"contra"|"de"|"en"|"entre"|"hasta"|"para"|"por"|"según"|"sobre"|"tras") { 
    printf("Preposición encontrada: %s\n", yytext);
}

/* Pronombres */
("yo"|"tú"|"él"|"nosotros"|"vosotros"|"ellos"|"ella"|"usted"|"ustedes"|"mío"|"tuyo"|"suyo"|"nuestro"|"vuestro") { 
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

/* Comentarios de una línea en C */
"//".* { 
    printf("Comentario de una línea detectado: %s\n", yytext);
}

/* Texto mostrado en pantalla (C: printf, puts) */
\"[^\"]*\" { 
    printf("Texto mostrado en pantalla detectado: %s\n", yytext);
}

/* Ignorar espacios y saltos de línea */
[\n\t ]+ ;

%%

int main() {
    printf("Ingrese el texto a analizar:\n");
    yylex();
    return 0;
}

int yywrap() { return 1; }
