import re

def classify_strings(input_string):
    words = input_string.split()
    count_integer = 0
    count_word = 0
    count_compound = 0
    
    for word in words:
        if word.isdigit():  # Verifica si es un número entero
            count_integer += 1
        elif word.isalpha():  # Verifica si es una palabra (solo letras)
            count_word += 1
        elif re.match(r'^[a-zA-Z]+\d+$', word):  # Verifica si es compuesta (letras + números)
            count_compound += 1
    
    total = count_integer + count_word + count_compound
    output = f"{total} - "
    
    categories = []
    if count_integer:
        categories.append(f"{count_integer} entero")
    if count_word:
        categories.append(f"{count_word} palabra")
    if count_compound:
        categories.append(f"{count_compound} compuesta")
    
    output += ", ".join(categories)
    return output

# Ejemplo de uso
inputs = [
    "5896475 agosto variable1",
    "Atotonilco Pachuca Actopan",
    "contador1 suma2 var123 pos567",
    "1 2 3 4 5 6 7 8 9 0"
]

for inp in inputs:
    print(classify_strings(inp))
