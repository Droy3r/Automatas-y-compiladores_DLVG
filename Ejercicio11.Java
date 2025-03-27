class Parser {
    private String input;
    private int index = 0;

    public Parser(String input) { this.input = input; }

    private char peek() { return index < input.length() ? input.charAt(index) : '\0'; }

    private void match(char expected) {
        if (peek() == expected) index++;
        else throw new RuntimeException("Error en: " + expected);
    }

    private void S() {
        if (peek() == '(') { match('('); S(); match(')'); }
        else if (peek() == 'x') { match('x'); }
        else throw new RuntimeException("Error de sintaxis.");
    }

    public void parse() {
        S();
        if (index < input.length()) throw new RuntimeException("Entrada no consumida.");
        System.out.println("Cadena válida.");
    }

    public static void main(String[] args) {
        new Parser("(x)").parse();
    }
}
