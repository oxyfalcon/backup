class A with walking {
  double test(double a) => a * 0.5;
  void method() {
    print("from Class A");
  }
}

class B extends A with walking, talking {
  @override
  double test(double a) => a * 1.5;
  B() : super();
  @override
  void method() {
    print("from Class B");
    super.method();
  }
}

mixin class walking {
  const walking();
  const factory walking.construct() = walking;
  void method() => print("from mixing walking");
}

mixin talking {
  void method() => print("from mixin talking");
}

abstract class AbstractMixin {
  void method();
}

mixin class MixinA {
  void method() {
    print('MixinA method');
  }

  void methodb() {
    print("MixinA methodb");
  }

  void method1() {
    print("MixinA method1");
  }
}

mixin class MixinB {
  static MixinB objj = MixinB();

  void method() {
    print('MixinB method');
  }

  void methodb() {
    print("MixinB methodb");
  }
}

mixin MixinC {
  //extends Object {
  // MixinC();
  // MixinC.constr();
  void method() {
    print('MixinC method');
  }

  void method1() {
    print("MixinC method1");
  }
}

class MyClass extends AbstractMixin with MixinA, MixinB, MixinC {
  void methodA() {
    MixinA().method(); // Accessing method from MixinA
  }

  void methodB() {
    MixinB().method(); // Accessing method from MixinB
  }

  void methodC() {
    super.methodb();
  }

  void method() {
    super.method();
  }

  void testMethod() {
    super.method1();
  }
}

mixin coding {
  void canCode() {
    print("mixin: coding, canCode");
  }
}

// mixin hello {
//   void method();
// }
// mixin world {
//   void method();
// }
mixin dart on x {
  void method() {
    print("dart mixin: method");
  }
}

class x {}

class z extends x {
  void method() {
    print("Z class: method");
  }
}

class y extends z with dart {
  void method() {
    super.method();
  }
}

void main() {
  A obj2 = B();
  // B obj4 = A(); error.
  // B obj3 = obj2; error
  // B obj5 = A() error is produced.

  /*
    obj3 belongs to B, which is subclass of A. So you cant go upstream. 
    Same with the obj assiging to a class as well. 
  */
  obj2.method();
  MyClass myObj = MyClass();
  myObj.testMethod();
  myObj.methodA();
  myObj.methodB(); // Output: MixinA method
  myObj.methodC();
  myObj.method();
}
