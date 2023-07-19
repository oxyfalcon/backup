class Point {
  int? x;
  int? y;

  Point(this.x, this.y);
}

class Geek1 {
  static final String k = "";
  final String firstName;
  const Geek1(this.firstName);
  void test() {
    print("i am at ggk1");
  }
}

class MyClass {
  int value;
  int value2;
  int value3;
  MyClass(this.value, this.value2, this.value3);

  void printValue() {
    print("${this.value}, ${this.value2}, ${this.value3}");
  }
}

class Geek2 extends Geek1 {
  Geek2(String fn) : super(fn);
  @override
  void test() {
    print("i am at ggk2");
  }

  void test2() {
    print("i am at test2");
  }
}

void misbehave() {
  try {
    dynamic foo = true;
    print(foo++); // Runtime error
  } catch (e) {
    print('misbehave() error ${e}');
    rethrow; // Allow callers to see the exception.
  }
}

void divide(int a, int b) {
  try {
    if (b == 0) {
      throw Exception('Division by zero is not allowed');
    }
    if (b == 1) {
      throw RangeError('Invalid input');
    }
    print(a ~/ b);
  } on FormatException {
    print('Caught FormatException: Invalid input');
  } on Exception catch (e) {
    print('Caught Exception: $e');
  }
}

void main() {
  // dynamic custom = MyClass(10)

  Geek1 obj1 = Geek2("Akash");
  obj1.test();

  print('\u2665');

  (int, int) testfunc((int, int) recordVar) {
    return recordVar;
  }

  var record = (10, 15);
  var record3 = testfunc(record);

  ({String name, int number}) record2;
  record2 = (name: "AKash Singh \u2665", number: 10);

  print(record3.$2);
  print(record2.name);

  final m = <String, dynamic>{
    'StudenetID': "2019UCO1528",
    'gpa': 7.0,
  };

  (String, int) userInfo(Map<String, dynamic> m) {
    return (m['StudenetID'] as String, m['gpa'] as int);
  }

  print('\n\n\n\n');
  try {
    (String, int) userInfo(Map<String, dynamic> m) {
      return (m['StudenetID'] as String, m['gpa'] as int);
    }

    var (StudentID, gpa) = userInfo(m);
    print(gpa);
    print(gpa.runtimeType);
  } catch (e) {
    print(e.runtimeType);
    print(e);
  } finally {
    (String, dynamic) userInfo(Map<String, dynamic> m) {
      return (m['StudenetID'] as String, m['gpa'] as dynamic);
    }

    var (StudentID, gpa) = userInfo(m);
    print(gpa);
    print(gpa.runtimeType);
  }

  final fixedList = List<int>.filled(5, 0, growable: true);
  print(fixedList);
  fixedList.setAll(1, [1, 2, 3]);
  print(fixedList);

  final growableList = List.empty(growable: true); // []
  print(growableList);
  growableList.add(1);
  print(growableList); // [1]
  print('');

  final fixedLengthList = List.empty(growable: false);

  final numbers = <num>[1, 2, 3];
  final listFrom = List<int>.from(numbers, growable: true);
  print(listFrom); // [1, 2, 3]
  listFrom.addAll(fixedList);
  print(listFrom.reversed);

  try {
    fixedLengthList.addAll(growableList);
  } catch (e) {
    print(e);
  }

  int b = 789789;
  int? a = 10;
  a ??= b;
  print(a);
  print(a ?? b);

  int? a1;
  a1 ??= b;
  print(a1);
  print(a1 ?? b);

  print('\n\n\n\n');

  MyClass obj = MyClass(10, 12, 13);

  obj
    ..value = 11
    ..value2 = 12
    ..value3 = 13
    ..printValue();

  try {
    misbehave();
  } catch (e) {
    print('main() error $e');
  }

  divide(10, 1);
  divide(10, 0);

  throw FormatException("Throwing a random FormatException");
}
