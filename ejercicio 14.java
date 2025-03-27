class ArithmeticParser {
    private String input;
    private int index = 0;

    public ArithmeticParser(String input) { this.input = input.replaceAll("\\s", ""); }

    private char peek() { return index < input.length() ? input.charAt(index) : '\0'; }

    private void match(char expected) {
        if (peek() == expected) index++;
        else throw new RuntimeException("Error en: " + expected);
    }

    private void E() { T(); while (peek() == '+' || peek() == '-') { match(peek()); T(); } }
    private void T() { F(); while (peek() == '*' || peek() == '/') { match(peek()); F(); } }
    private void F() {
        if (Character.isDigit(peek())) match(peek());
        else if (peek() == '(') { match('('); E(); match(')'); }
        else throw new RuntimeException("Error en F.");
    }

    public void parse() {
        E();
        if (index < input.length()) throw new RuntimeException("Entrada no consumida.");
        System.out.println("Expresión válida.");
    }

    public static void main(String[] args) {
        new ArithmeticParser("(3+5)*2").parse();
    }
}
