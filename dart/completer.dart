import 'dart:async';

Future<int> fetchNumber() {
  var completer = Completer<int>();

  // Simulating an asynchronous operation
  Timer(Duration(seconds: 2), () {
    completer.complete(42);
  });

  return completer.future;
}

void main() {
  fetchNumber().then((result) {
    print('Result: $result');
  });
  print('Fetching number...');
}
