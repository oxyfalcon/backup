void performOperation(int a, int b, Function callback) {
  print('Performing operation...');
  int result = callback(a, b);
  print('Result: $result');
}

int add(int a, int b) {
  return a + b;
}

int multiply(int a, int b) {
  return a * b;
}

void main() {
  performOperation(2, 3, add);
  performOperation(4, 5, multiply);
}
