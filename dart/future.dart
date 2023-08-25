Future<int> divider() {
  return Future.delayed(Duration(seconds: 5), () => 3);
}

Future<List<int>> getList(List<int> list) async {
  int number = await divider();
  // divider()
  //     .then((number) => List<int>.from(
  //         list.where((element) => element % number == 0 ? true : false)))
  //     .then((value) {
  //   print("object");
  //   return value;
  // });
  // print("From Future Class: $n");

  var ans = List<int>.from(
      list.where((element) => element % number == 0 ? true : false));
  return ans;
}

Future<int> temp() async {
  return await Future.delayed(Duration(seconds: 10), () => 10);
}

Stream<int> stream() async* {
  int counter = 1;
  for (int i = 0; i < 15; i++) {
    yield await Future.delayed(Duration(seconds: 1), () => counter++);
  }
}

void main() async {
  List<int> l = List.generate(100, (index) => index);
  print("Before");
  var x = getList(l).then((value) => print("list: $value"));
  print(x);
  print("hello");
  // temp().then((value) => print("temp val returned: $value"));
  // print("temp val instance: ${temp()}");

  // var x = getList(l);
  // x.then(
  //   (value) async {
  //     var s = stream();
  //     await for (int val in s) {
  //       print("x: $val");
  //     }
  //   },
  // );

  // print(x);

  // var s = stream();
  // await for (int val in s) {
  //   print("stream: $val");
  // }
  // int number = await divider();
  // print(List<int>.from(
  //     l.where((element) => element % number == 0 ? true : false)));
}
