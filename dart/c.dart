import 'dart:convert';
import 'dart:math';

class tempClass {
  static const List<int> list = <int>[1, 2, 3, 4, 5, 6, 6, 11];
}

bool testEven(int x) {
  if (x % 2 == 0) {
    return true;
  }
  return false;
}

bool testOdd(int x) {
  if (x % 2 != 0) {
    return false;
  }
  return true;
}

Future<int> itr(int n) async {
  if (n <= 0) {
    return 1;
  }
  return itr(n + 1);
}

// Iterable<int> auto(int n) sync* {
//   if (n >= 0) {
//     yield n;
//     yield* auto(n - 1);
//   }
// }

// Future<int> f() async {
//   return await Future(() => itr(10));
// }

Future<List<int>> generateCode() {
  return Future.delayed(const Duration(seconds: 3), () {
    List<int> ans = List<int>.from(tempClass.list.where(testEven));
    return ans;
  });
}

// Future<String> fetchcode() {
//   Future<String> x = generateCode();
// }

void main() async {
  var result = itr(10);
  result
      .then((value) => print("done, $value"))
      .catchError((err) => print("ERROR, $err"));
  print("");

  print("Even's existance: ${tempClass.list.any(testEven)}");
  print("All Even values: ${tempClass.list.where(testEven)}");

  const jsonArray = '''
  [{"text": "foo", "value": 1, "status": true},
   {"text": "bar", "value": 2, "status": false},
   [1,2, 3,4,5]]
''';

  final List<dynamic> l = jsonDecode(jsonArray);
  final List<Map<String, dynamic>> l2 =
      List.from(l.where((x) => x is Map && x["value"] == 2));
  print(l);
  print(l2);

  print('');
  print(itr(10));
  print('');

  // for (int xa in auto(10)) {
  //   print(xa);
  // }

  Stopwatch watch = Stopwatch();
  watch.start();
  var instant = Future.delayed(Duration(seconds: 0)).then((_) {
    print("2: ${watch.elapsedMilliseconds}");
  });
  print(instant);
  print("1: ${watch.elapsedMilliseconds}");
}
