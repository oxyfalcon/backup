Future<bool> value() async {
  return Future.delayed(Duration(seconds: 2), () => false);
}

void main() async {
  var t = true;
  // var x = await value();
  // value2().then((value) async {
  //   do {
  //     print("hello");
  //   } while (value);
  // });
  var x = value3().asBroadcastStream(
    onListen: (subscription) => subscription.onData((data) {
      t = data;
    }),
    onCancel: (subscription) {
      t = false;
    },
  );

  var tt = x.listen(
    (event) => t = true,
    onDone: () => t = false,
  );
  await Future.delayed(Duration(seconds: 2), () => tt.cancel());
  print(x.isBroadcast);
}

Future<bool> value2() async {
  return await value();
}

// Future<void> value2(bool t) async {
//   t = value().then((value) => null)
//   do {
//     print("hello");
//   } while (t);
// }
Stream<bool> value3() async* {
  yield await Future.delayed(Duration(seconds: 2), () => false);
}
