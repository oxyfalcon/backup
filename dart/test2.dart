import 'test3.dart';

class Point {
  int? x;
  int? y;

  Point(this.x, this.y);
}

class ImmutablePoint extends Object {
  const ImmutablePoint(this.x, this.y) : super();
  final int x;
  final int y;

  const ImmutablePoint.construct2(int x, int y)
      : this.x = x,
        this.y = y;
}

class TestClass {
  String name;
  bool? x;

  TestClass(name) : name = name {
    x = fun(this.name);
  }

  bool fun(String input) {
    var m = <String, bool>{
      '/pdf': false,
      '/png': false,
      '/jpeg': false,
      '/mp4': false
    };
    for (int i = 0; i < input.length; i++) {
      String buffer = "";
      if (input[i] == '/') {
        while (i < input.length && input[i] != ',') {
          buffer = buffer + input[i];
          i++;
        }
        if (!m.containsKey(buffer)) {
          return false;
        }
      }
    }
    return true;
  }
}

void main() {
  String name = "image/png, video/mp4, image/jpeg, application/avi";
//   print(fun(name));
  Example exp = Example(10);
  exp.runtimeType;
  TestClass test = TestClass(name);
  print(test.x);

  const l = {
    "point": [ImmutablePoint(10, 12)],
    "line": [ImmutablePoint(100, 150), ImmutablePoint(200, 500)]
  };

  const Map<String, Object> l1 = {
    "point": ImmutablePoint(10, 12),
    "line": [ImmutablePoint(100, 150), ImmutablePoint(200, 500)]
  };

  print("l1 type: ${l1.runtimeType}");

  print(l["point"].runtimeType);
  print(l["line"].runtimeType);
  print(l.runtimeType);
  Map<String, List<ImmutablePoint>> l2 = <String, List<ImmutablePoint>>{
    "point": [ImmutablePoint(10, 12)],
    "line": [ImmutablePoint(100, 150), ImmutablePoint(200, 500)]
  };

  print(l["point"]![0].x);
  print(l2["line"]![0].x);
}
