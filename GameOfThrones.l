%option noyywrap

%{
#include <stdio.h>

extern FILE *yyin;

int totalCasas = 0, totalLugares = 0, totalPersonajes = 0;

// Pj
int pEddard = 0, pCatelyn = 0, pArya = 0, pSansa = 0;
int pRobert = 0, pJoffrey = 0, pStannis = 0, pAegon = 0, pDaenerys = 0;
int pAerys = 0, pTywin = 0, pJaime = 0, pTyrion = 0, pCersei = 0;

// Casas
int cStark = 0, cArryn = 0, cTully = 0, cGreyjoy = 0, cLannister = 0;
int cTyrell = 0, cMartell = 0, cBaratheon = 0, cTargaryen = 0;

// ubicaciones
int cWesteros = 0, cInvernalia = 0, cDesembarco = 0, cNido = 0, cAltojardin = 0;
int cAguasdulces = 0, cRocadragon = 0, cCasterly = 0, cBastion = 0, cDorne = 0;
%}


%%

Westeros                 { cWesteros++; totalLugares++; }
Invernalia               { cInvernalia++; totalLugares++; }
Nido[ ]de[ ][áAa]guilas { cNido++; totalLugares++; }
Altojard[íi]n            { cAltojardin++; totalLugares++; }
Rocadrag[óo]n            { cRocadragon++; totalLugares++; }
Dorne                    { cDorne++; totalLugares++; }
Roca[ ][Cc]asterly       { cCasterly++; totalLugares++; }
Aguasdulces              { cAguasdulces++; totalLugares++; }
Basti[óo]n[ ]de[ ][Tt]ormentas { cBastion++; totalLugares++; }
Desembarco[ ]del[ ]Rey   { cDesembarco++; totalLugares++; }

Arryn        { cArryn++; totalCasas++; }
Tully        { cTully++; totalCasas++; }
Greyjoy      { cGreyjoy++; totalCasas++; }
Targaryen    { cTargaryen++; totalCasas++; }
Lannister    { cLannister++; totalCasas++; }
Tyrell       { cTyrell++; totalCasas++; }
Martell      { cMartell++; totalCasas++; }
Baratheon    { cBaratheon++; totalCasas++; }
Stark        { cStark++; totalCasas++; }

Eddard     { pEddard++; totalPersonajes++; }
Catelyn    { pCatelyn++; totalPersonajes++; }
Arya       { pArya++; totalPersonajes++; }
Sansa      { pSansa++; totalPersonajes++; }
Robert     { pRobert++; totalPersonajes++; }
Joffrey    { pJoffrey++; totalPersonajes++; }
Stannis    { pStannis++; totalPersonajes++; }
Aegon      { pAegon++; totalPersonajes++; }
Daenerys   { pDaenerys++; totalPersonajes++; }
Aerys      { pAerys++; totalPersonajes++; }
Tywin      { pTywin++; totalPersonajes++; }
Jaime      { pJaime++; totalPersonajes++; }
Tyrion     { pTyrion++; totalPersonajes++; }
Cersei     { pCersei++; totalPersonajes++; }
.|\n    
%%


float calcularPorcentaje(int parte, int total) {
    return (total == 0) ? 0.0 : ((float) parte / total) * 100.0;
}

int main(int argc, char **argv) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            perror("No se pudo abrir el archivo proporcionado");
            return 1;
        }
    }

    yylex();

    printf("\n=== Total de ubicaciones por mencion ===\n");
    printf("Total de menciones a lugares: %d\n", totalLugares);
    printf("Westeros: %d (%.2f%%)\n", cWesteros, calcularPorcentaje(cWesteros, totalLugares));
    printf("Invernalia: %d (%.2f%%)\n", cInvernalia, calcularPorcentaje(cInvernalia, totalLugares));
    printf("Desembarco del Rey: %d (%.2f%%)\n", cDesembarco, calcularPorcentaje(cDesembarco, totalLugares));
    printf("Nido de Águilas: %d (%.2f%%)\n", cNido, calcularPorcentaje(cNido, totalLugares));
    printf("Altojardín: %d (%.2f%%)\n", cAltojardin, calcularPorcentaje(cAltojardin, totalLugares));
    printf("Aguasdulces: %d (%.2f%%)\n", cAguasdulces, calcularPorcentaje(cAguasdulces, totalLugares));
    printf("Rocadragón: %d (%.2f%%)\n", cRocadragon, calcularPorcentaje(cRocadragon, totalLugares));
    printf("Roca Casterly: %d (%.2f%%)\n", cCasterly, calcularPorcentaje(cCasterly, totalLugares));
    printf("Bastión de Tormentas: %d (%.2f%%)\n", cBastion, calcularPorcentaje(cBastion, totalLugares));
    printf("Dorne: %d (%.2f%%)\n", cDorne, calcularPorcentaje(cDorne, totalLugares));

    printf("\n=== Casas de GoT ===\n");
    printf("Total de menciones a casas: %d\n", totalCasas);
    printf("Casa Stark: %d (%.2f%%)\n", cStark, calcularPorcentaje(cStark, totalCasas));
    printf("Casa Arryn: %d (%.2f%%)\n", cArryn, calcularPorcentaje(cArryn, totalCasas));
    printf("Casa Tully: %d (%.2f%%)\n", cTully, calcularPorcentaje(cTully, totalCasas));
    printf("Casa Greyjoy: %d (%.2f%%)\n", cGreyjoy, calcularPorcentaje(cGreyjoy, totalCasas));
    printf("Casa Lannister: %d (%.2f%%)\n", cLannister, calcularPorcentaje(cLannister, totalCasas));
    printf("Casa Tyrell: %d (%.2f%%)\n", cTyrell, calcularPorcentaje(cTyrell, totalCasas));
    printf("Casa Martell: %d (%.2f%%)\n", cMartell, calcularPorcentaje(cMartell, totalCasas));
    printf("Casa Baratheon: %d (%.2f%%)\n", cBaratheon, calcularPorcentaje(cBaratheon, totalCasas));
    printf("Casa Targaryen: %d (%.2f%%)\n", cTargaryen, calcularPorcentaje(cTargaryen, totalCasas));

    printf("\n=== Héroes y Villanos ===\n");
    printf("Total de menciones a personajes: %d\n", totalPersonajes);
    printf("Eddard: %d (%.2f%%)\n", pEddard, calcularPorcentaje(pEddard, totalPersonajes));
    printf("Catelyn: %d (%.2f%%)\n", pCatelyn, calcularPorcentaje(pCatelyn, totalPersonajes));
    printf("Arya: %d (%.2f%%)\n", pArya, calcularPorcentaje(pArya, totalPersonajes));
    printf("Sansa: %d (%.2f%%)\n", pSansa, calcularPorcentaje(pSansa, totalPersonajes));
    printf("Robert: %d (%.2f%%)\n", pRobert, calcularPorcentaje(pRobert, totalPersonajes));
    printf("Joffrey: %d (%.2f%%)\n", pJoffrey, calcularPorcentaje(pJoffrey, totalPersonajes));
    printf("Stannis: %d (%.2f%%)\n", pStannis, calcularPorcentaje(pStannis, totalPersonajes));
    printf("Aegon: %d (%.2f%%)\n", pAegon, calcularPorcentaje(pAegon, totalPersonajes));
    printf("Daenerys: %d (%.2f%%)\n", pDaenerys, calcularPorcentaje(pDaenerys, totalPersonajes));
    printf("Aerys: %d (%.2f%%)\n", pAerys, calcularPorcentaje(pAerys, totalPersonajes));
    printf("Tywin: %d (%.2f%%)\n", pTywin, calcularPorcentaje(pTywin, totalPersonajes));
    printf("Jaime: %d (%.2f%%)\n", pJaime, calcularPorcentaje(pJaime, totalPersonajes));
    printf("Tyrion: %d (%.2f%%)\n", pTyrion, calcularPorcentaje(pTyrion, totalPersonajes));
    printf("Cersei: %d (%.2f%%)\n", pCersei, calcularPorcentaje(pCersei, totalPersonajes));

    if (argc > 1) fclose(yyin);

    return 0;
}
