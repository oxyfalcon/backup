class A {
  double test(double a) => a * 0.5;
}

class B extends A {
  @override
  double test(double a) => a * 1.5;
}

void main() {
  A obj1 = A();
  A obj2 = B();
  B obj4 = B();
  A obj3 = obj4;
  // B obj3 = obj2; Error is produced.
  // B obj5 = A() error is produced.

  /*
    obj3 belongs to B, which is subclass of A. So you cant go upstream. 
    Same with the obj assiging to a class as well. 
  */
}
