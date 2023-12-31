import 'dart:math';
import 'dart:mirrors';

base class A {
  int y;
  int x;

  A(this.x, this.y) {
    print("contructor called from A");
  }
  void method1() {
    print("method1:");
  }

  void method2() {
    print("object");
  }

  void method3() {
    print("Object5");
  }
}

base class B extends A {
  int x;
  B(this.x) : super(x, x) {
    print("constructor called from B");
  }

  int call(int y) {
    print("${x + y}");
    return x + y;
  }

  @override
  void method2() {
    print("B: method2");
  }

  @override
  void method1() {
    print("B: method1");
  }
}

base class CC implements B {
  int x;
  int y;
  CC(this.x, this.y) : super();

  int call(int y) {
    return y;
  }

  @override
  void method2() {
    print("CC: method2");
  }

  @override
  void method1() {
    print("CC: method1");
  }

  @override
  void method3() {
    print("CC: mehtod3");
  }
}

class BB extends AA {
  BB() : super._();
}

abstract class AA {
  AA._() {
    print("._private constructor called from AA");
  }
  factory AA.hello() {
    print("Factory constructor called of AA");
    return BB();
  }

  void method1() {
    print("class AA: method1");
  }

  void method2(String input) {
    print("Class AA: method2");
  }
}

abstract mixin class M1 {
  int foo(int i) => i > 0 ? bar(i - 1) : 42;
  int bar(int i);
  void method1() {
    print("M1 mixin print");
  }
}

abstract mixin class M2 {
  int foo(int i);
  int bar(int i) => i > 0 ? foo(i ~/ 2) : 24;
  void method1() {
    print("M2 mixin print");
  }
}

class C = Object with M2, M1;

Function createClosure() {
  int count = 0;

  return () {
    count++;
    print('Count: $count');
  };
}

int Function(int x) wannabeFunction = B(10);

void main() {
  var reflected = reflect(AA);
  print("${reflected.getField(Symbol("Hello"))}");
  B obj = B(20);
  obj.method1();
  obj(10);

  AA objBB = AA.hello();
  C objc = C();
  objc.method1();
  // objc.method2();
  // objBB.method1();

  wannabeFunction(20);
  int funn = wannabeFunction(10);
  print(funn);

  String Function(int) test = (int x) => x.toString();
  // String? x = Random().nextBool() ? "not null" : null;
  // String Function(int)? fun = (int? n) => "$n";

  String Function(int)? callbacks = Random().nextBool() ? test : null;
  print("callback: ${callbacks?.call(10)}");
  // print("callbacks! : ${callbacks!(1)}");

  String Function(int) f = (int x) => "$x";
  print(f(1)); // Prints "1".

  var closure = createClosure();
  closure(); // Prints: Count: 1
  closure(); // Prints: Count: 2
}
