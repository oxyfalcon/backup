Future<int> divider() {
  return Future.delayed(Duration(seconds: 5), () => 3);
}

Future<List<int>> getList(List<int> list) async {
  var number = divider().then((number) => List<int>.from(
      list.where((element) => element % number == 0 ? true : false)));
  print("From Future Class: $number");
  // var ans = List<int>.from(
  //     list.where((element) => element % number == 0 ? true : false));
  return number;
}

int global = 10;
Future<int> temp() {
  return Future.delayed(Duration(seconds: 10), () => global);
}

Stream<int> stream() async* {
  int counter = 1;
  for (int i = 0; i < 15; i++) {
    yield await Future.delayed(Duration(seconds: 1), () => counter++);
  }
}

void main() async {
  List<int> l = List.generate(100, (index) => index);
  temp().then((value) => print("temp val returned: $value"));
  print("temp val instance: ${temp()}");

  getList(l).then(
    (value) async {
      var s = stream();
      await for (int val in s) {
        print(val);
      }
    },
  );

  // var s = stream();
  // await for (int val in s) {
  //   print(val);
  // }
  // int number = await divider();
  // print(List<int>.from(
  //     l.where((element) => element % number == 0 ? true : false)));
}
