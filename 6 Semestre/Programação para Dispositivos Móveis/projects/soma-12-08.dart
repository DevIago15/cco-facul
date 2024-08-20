// exemplo de funções matematicas
void main() {
  void soma(int a, int b) {
    int resultado = a + b;
    print("Soma: $resultado");
  }

  int subtracao(int a, int b) {
    return a - b;
  }

  int multiplicacao(int a, int b) {
    return a * b;
  }

  int x = 2;
  int y = 6;

  soma(x, y);
  print("Subtração: ${subtracao(x, y)}");
  print("Multiplicação: ${multiplicacao(x, y)}");
}
