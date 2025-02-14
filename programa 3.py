def clasificar_lexemas(texto):
    lexemas = texto.split()
    total_caracteres_con_espacios = len(texto)
    total_caracteres_sin_espacios = len(texto.replace(" ", ""))
    total_lexemas = len(lexemas)
    
    palabras = [l for l in lexemas if l.isalpha()]
    numeros = [l for l in lexemas if l.isdigit()]
    combinadas = [l for l in lexemas if not l.isalpha() and not l.isdigit()]
    
    print(f"Total de caracteres (con espacios): {total_caracteres_con_espacios}")
    print(f"Total de caracteres (sin espacios): {total_caracteres_sin_espacios}")
    print(f"Total de lexemas: {total_lexemas}")
    print(f"Total de palabras: {len(palabras)}")
    print(f"Total de números: {len(numeros)}")
    print(f"Total de combinadas: {len(combinadas)}")

def main():
    try:
        with open(input("Ingrese el archivo: "), "r", encoding="utf-8") as archivo:
            clasificar_lexemas(archivo.read())
    except FileNotFoundError:
        print("Error: Archivo no encontrado.")

if __name__ == "__main__":
    main()
