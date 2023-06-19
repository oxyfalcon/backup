Future<int> itr(int n) async {
  if (n <= 0) {
    return n;
  }
  print(n);
  return itr(n + 1);
}

void main() async {
  try {
    var result = await itr(10);
    print(result);
  } catch (e) {
    print("$e, error");
  }
  // result.then((value) => print(value)).catchError((error) {
  //   print('First catch block');
  //   print('$error ERROR 1');
  // });

  print("i m here");
}
