class b extends a {
  const b() : super._();
}

abstract class a {
  const a._();
  const factory a() = b;

  void method() {
    print("From class a");
  }
}

void main() {
  var x = a();
  x.method();
}
