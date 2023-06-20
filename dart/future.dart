Future<int> divider() async {
  return Future.delayed(Duration(seconds: 5), () => 3);
}

Future<List<int>> getName(List<int> list) async {
  var number = await divider();
  var ans = List<int>.from(
      list.where((element) => element % number == 0 ? true : false));
  return ans;
}

Future<int> temp() {
  return Future.delayed(Duration(seconds: 10), () => 10);
}

void main() async {
  List<int> l = List.generate(100, (index) => index);
  // int number = await divider();
  // print(List<int>.from(
  //     l.where((element) => element % number == 0 ? true : false)));
  print(getName(l));
  temp().then((value) => print(value));
  print(temp());
}
