import 'test5.dart' as test5;

class C extends test5.walking {
  C() : super();

  void method() {
    super.method();
  }
}

mixin class flutter {
  void fun() {
    print("Flutter mixin: fun");
  }
}

mixin dart {
  void method() {
    print("dart mixin: method");
  }

  void fun() {
    print("Dart mixin: method");
  }
}

abstract interface class abs {
  void fun();
}

class testClass extends abs with flutter, dart {
  void fun() {
    flutter().fun();
  }
}

abstract class x {
  
}

class z extends x {
  void method() {
    print("Z class: method");
  }
}

class y extends z with dart {
  y() : super();
  
  @override
  void method() {
    super.method();
  }
}

void main() {
  C c = C();
  c.method();
  z obj = y();
  obj.method();
  testClass test = testClass();
  test.fun();
}
