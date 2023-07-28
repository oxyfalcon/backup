import 'dart:async';

void main() {
  print(number.one.value);
  var subscription = NumberCreator().stream.asBroadcastStream();
  print(subscription);
}

enum number {
  one(1),
  two(2);

  const number(this.value);
  final int value;
}

class NumberCreator {
  NumberCreator() {
    Timer.periodic(const Duration(seconds: 1), (t) {
      count++;
      (count % 5 == 0)
          ? _controller.sink.addError("error")
          : _controller.sink.add(count);
    });
  }

  int count = 0;
  final _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;
}
