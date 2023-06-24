abstract class LocalKey extends Key {
  const LocalKey() : super.empty();
}

class helper<T> extends LocalKey {
  const helper(this.value);
  final T? value;
}

class C {
  final int i;
  const C(this.i);
}

abstract class Key {
  const factory Key(String str) = helper<String>;
  const Key.empty();
}

abstract class a {
  const a({this.key});

  final Key? key;
}

abstract class b extends a {
  const b({this.key});

  final Key? key;
}

class test2 extends b {
  const test2({this.key});
  final Key? key;
}

class test extends b {
  const test({super.key});

  a build() {
    return test2();
  }
}

// void main() {
//   C f(int i) {
//     return const C(i);
//   }
// }
// abstract class b extends a {
//   b() : super();
//   a build() {
//     return a();
//   }
// }
