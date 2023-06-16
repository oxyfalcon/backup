import 'test5.dart';

class BaseClass {}

class ExtendedBaseClass extends BaseClass {}

class Foo<T extends BaseClass> {}

class State {
  const State._();
  factory State.success(String foo) = SuccessState;
  factory State.error(String foo) = ErrorState;

  @override
  void noSuchMethod(Invocation innvocation) {
    print("You tried to invocate a non existing member: $innvocation");
  }
}

class ErrorState extends State {
  const ErrorState(this.msg) : super._();
  final String msg;
}

class SuccessState extends State {
  const SuccessState(this.value) : super._();
  final String value;
}

void main() {
  Foo<BaseClass> f = Foo<ExtendedBaseClass>();
  Foo f1 = Foo();
  /* Foo<Object> f2 = Foo<Object>(); 
    Error. Since 'Object' or any other primitive data type 
    are not a subtype of BaseClass, 
    therefore they are not included.
  */
}
