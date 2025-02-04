import re

def clasificar_cadena(cadena):
    if cadena.isdigit():
        return "Número entero"
    elif cadena.isalpha():
        return "Palabra"
    elif re.match(r'^[a-zA-Z0-9]+$', cadena):
        return "Compuesta"
    else:
        return "No clasificada"

# Ejemplos de uso
ejemplos = ["45453484934", "Pachuca", "calle13"]
for ejemplo in ejemplos:
    print(f"{ejemplo} -> {clasificar_cadena(ejemplo)}")
