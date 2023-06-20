import 'dart:async';
import 'dart:math';

// class MessageCreation {
//   final _completer = Completer<String>();

//   Future<String> createOrderMessage() async {
//     var order = await fetchUserOrder();
//     return _completer.complete(order);
//     // return 'Your order is: $order';
//   }

//   void _finishOperation(String result) {
//     _completer.complete(result);
//   }
// }

Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return "$order";
  // return 'Your order is: $order';
}

Future<String> fetchUserOrder() => Future.delayed(
      const Duration(seconds: 2),
      () => 'order ID ${Random().nextInt(10)}',
    );

void main() {
  var x = createOrderMessage();

  x.then((value) {
    print(value);
  });
  print(x);
  // print(fetchUserOrder());
}
