dynamic ans2;

Stream<int> itr2(int n) async* {
  if (n <= 0) {
    yield 1;
  }
  yield* itr2(n + 1);
}

dynamic ans;
Future<int> itr(int n) async {
  if (n <= 0) {
    return n;
  }
  // print(n);
  try {
    ans = await itr(n + 1);
    return ans;
  } on StackOverflowError catch (e) {
    print("$e, ERROR: 1");
    // print("$s, in Error 1");
    rethrow;
  }
  //
}

void main() async {
  // itr(10);
  try {
    var result = await itr(10);
    print(result);
    // await result.then((value) => print(value)).catchError((error) {
    //   print('First catch block');
    //   print('$error ERROR 2');
    // });

    //   // print(result);
  } catch (e) {
    print("$e, ERROR: 2");
  }
  // print("i m here");
}
