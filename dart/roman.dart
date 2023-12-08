import 'dart:math';

Map<int, String> m = <int, String>{
  1: "I",
  5: "V",
  10: "X",
  50: "L",
  100: "C",
  500: "D",
  1000: "M",
};

num returnNumber(int itr, int number, String input) {
  if (itr > 1) {
    return (pow(10, itr - 1) * number);
  } else {
    return number;
  }
}

void main() {
  String ans = "";
  String input = "49";
  for (int i = input.length - 1; i >= 0; i--) {
    num currentNumber =
        returnNumber(input.length - i, int.parse(input[i]), input);
    num three = returnNumber(input.length - i, 3, input);
    num five = returnNumber(input.length - i, 5, input);
    num one = returnNumber(input.length - i, 1, input);
    num higherNumber = returnNumber(input.length - i + 1, 1, input);
    if (currentNumber <= three) {
      num itr = currentNumber;
      while (itr != 0) {
        ans = m[one]! + ans;
        itr = itr - one;
      }
    } else if (five - currentNumber <= three && five - currentNumber >= 0) {
      ans = m[five]! + ans;
      num itr = five - currentNumber;
      while (itr != 0) {
        ans = m[one]! + ans;
        itr = itr - one;
      }
    } else {
      ans = m[one]! + m[higherNumber]! + ans;
    }
  }
  print(ans);
}
