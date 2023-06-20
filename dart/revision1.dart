class MyClass {
  int? value;

  void printValue() {
    print(value?.toString());
  }
}

void main() {
  MyClass myObject = MyClass();
  // myObject?.value = 42;
  myObject.printValue();
}
