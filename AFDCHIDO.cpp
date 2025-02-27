#include <iostream>
#include <unordered_map>
#include <vector>
#include <string>
#include <set>

using namespace std;

int main() {
    int numEstados, numSimbolos, numTransiciones, estadoInicial, numFinales, numCadenas;
    cin >> numEstados >> numSimbolos >> numTransiciones >> estadoInicial >> numFinales >> numCadenas;
    
    set<char> alfabeto;
    for (int i = 0; i < numSimbolos; i++) {
        char simbolo;
        cin >> simbolo;
        alfabeto.insert(simbolo);
    }
    
    vector<int> estadosFinales(numFinales);
    for (int &estado : estadosFinales) cin >> estado;
    
    unordered_map<int, unordered_map<char, int>> transiciones;
    for (int i = 0; i < numTransiciones; i++) {
        int origen, destino;
        char simbolo;
        cin >> origen >> simbolo >> destino;
        transiciones[origen][simbolo] = destino;
    }
    
    cin.ignore(); // Limpiar el buffer antes de leer cadenas
    
    while (numCadenas--) {
        string cadena;
        getline(cin, cadena);
        int estadoActual = estadoInicial;
        
        for (char c : cadena) {
            if (alfabeto.count(c) == 0 || transiciones[estadoActual].count(c) == 0) {
                estadoActual = -1;
                break;
            }
            estadoActual = transiciones[estadoActual][c];
        }
        
        cout << ((estadoActual != -1 && find(estadosFinales.begin(), estadosFinales.end(), estadoActual) != estadosFinales.end()) ? "ACEPTADA" : "RECHAZADA") << '\n';
    }
    
    return 0;
}
