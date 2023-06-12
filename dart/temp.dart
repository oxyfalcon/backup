class Geek1 {
  final String firstName;

  const Geek1(this.firstName);
  void test() {
    print("i am at ggk1");
  }
}

class Geek2 extends Geek1 {
  Geek2(String fn) : super(fn);
  void test() {
    print("i am at ggk2");
  }

  void test2() {
    print("i am at test2");
  }
}

void testfunc(String str, {required String name, required String notName}) {}

const list = ["Akash", "Singh", "NSUT"];

// list.map((item) {
//   return item.toUpperCase();
// }).forEach((item) {
//   print('$item: ${item.length}');
// });

var func = (item) {
  return item.toUpperCase();
};
// list.map(func).forEach((item){print("$item, ${item.length}")});

void main(List<String> arguments) {
  Geek1 obj1 = Geek2("Akash");
  obj1.test();

  Todo t;
  int doSomething() => 2;
  int y = 2;
  int x = y;
  int Function() fun = doSomething;

  print(arguments);

  assert(arguments.length == 2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');

  const list = ["Akash", "Singh", "NSUT"];
  Function func = (item) {
    return item.toUpperCase();
  };
  list.map((item) {
    return item.toUpperCase();
  }).forEach((item) {
    print("$item, ${item.length}");
  });

  Geek1 obj2 = Geek2("Akash");
  obj2.test();
  geekFunc();
  Todo t1;
  dynamic a = new Employee();
  Object b = new Employee();
//print(a.str11);
  a.printEmp(); // No error
//b.printEmp(); // Compile error

  Object a1 = "Document";
  dynamic b1 = "b1b1";

  final Circle circle = Circle(5.0);
  print(Circle.pi);
  print('Area: ${circle.calculateArea()}');
  final Circle circles = Circle(5.0);
  print(Circle.pi);
  print('Area: ${circles.calculateArea()}');

  description = "Hello";
  print(description);
  description = 10;
  print(description);

  dynamic a2 = new Employee();
  Object b2 = new Employee();
  //print(a.str11);
  a2.printEmp(); // No error
  //b.printEmp(); // Compile error

  Object a3 = "Document";
  dynamic b4 = "b1b1";
}

class Implement {
  final String what;
  final String by;

  const Implement(this.what, this.by);
}

@Implement('the following function', 'Geek1')
void geekFunc() {
  print('Implement me');
}

class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}

@Todo('Dash', 'Implement this function')
void doSomething() {
  print('Do something');
}

class Employee {
  printEmp() => print("Employee Object");
  // String get str11 = "hello";
}

class Circle {
  final double radius;
  static const double pi = 3.14159;

  Circle(this.radius);

  double calculateArea() {
    return pi * radius * radius;
  }
}

int x() {
  var ss = 10;
  var aa = 12;
  void y() {}
  return ss;
}

late Object description;

const double xOrigin = 0;
const double yOrigin = 0;

class Point {
  final double? x;
  double? y = 0;

  Point(this.x, this.y);

  Point.fromJson(this.x);
}
