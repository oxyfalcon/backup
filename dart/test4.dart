import 'dart:collection';

class Foo {
  const Foo.empty();
  const factory Foo(int i) = Bar; // Error
}

class Bar extends Foo {
  const Bar(int i) : super.empty();
}

class Fractions {
  final int _x;
  final int _y;

  static final Map<(int, int), Fractions> _f = HashMap();
  factory Fractions(int x, int y) =>
      _f.putIfAbsent((x, y), () => Fractions._constFactory(x1: x, y1: y));

  const factory Fractions._constFactory({required int x1, required int y1}) =
      Fractions._private;
  const Fractions._private({required int x1, required int y1})
      : _x = x1,
        _y = y1;

  int get getx => _x;
  int get gety => _y;

  // void set setX(int value) {
  //   this._x = value;
  // }

  // void set setY(int value) {
  //   this._y = value;
  // }
}

class Fraction {
  int _numerator;
  int _denominator;
  Fraction(this._numerator, this._denominator);
  // Getters are read-only
  int get numerator => _numerator;
  int get denominator {
    return _denominator;
  }
}

class ParameterException implements Exception {
  final String? message;

  ParameterException([this.message]);

  String toString() {
    String result;
    (message == null)
        ? result = "ParameterException: NOTDEFINED"
        : result = "ParameterException: $message";
    return result;
  }
}

class FractionFailure implements Exception {
  final String? message;

  FractionFailure([this.message]);

  String toString() {
    String result;
    (message == null)
        ? result = "FractionFailure: UNDEFINED FRACTION"
        : result = "FractionFailure: $message";
    return result;
  }
}

class Fraction2 {
  final int? _numerator;
  final int? _denominator;
  final double? fraction;

  const Fraction2.constConstruct(
      {required int numerator, required int denominator})
      : _numerator = numerator,
        _denominator = denominator,
        fraction = numerator / denominator;

  Fraction2({int? numerator, int? denominator})
      : _numerator = numerator,
        _denominator = denominator,
        fraction = (denominator != null && numerator != null)
            ? numerator / denominator
            : throw ParameterException;

  void checkFraction() {
    ((_denominator == 0 && _numerator == 0) || (_denominator == 0))
        ? throw FractionFailure("Parameters undefined")
        : print("Fraction Successfull!!");
  }
}

// Made from the constant constructor of Fraction2 class.
// Although it has 2 different constructors, we utilizing the
// const constructors for the annotations
@Fraction2.constConstruct(numerator: 10, denominator: 30)
class Fraction3 implements Fraction2 {
  int? _numerator = 10;
  int? _denominator = 20;
  double? fraction;

  Fraction3({required int numerator, required int denominator})
      : _numerator = numerator,
        _denominator = denominator,
        fraction = numerator / denominator;
  void checkFraction() {}
  // Function f = check
}

void main() {
  Fractions frac1 = Fractions(10, 20);
  Fractions frac2 = Fractions(10, 20);
  Fractions frac3 = Fractions(15, 15);
  (frac1 == frac2) ? print("yes") : print("no");
  (frac3 == frac2) ? print("yes") : print("no");
  print(frac1.getx);

  try {
    Fraction2 f2 = Fraction2(numerator: 0);
    f2.checkFraction();
  } on ParameterException catch (e) {
    print(e);
  } on FractionFailure catch (e) {
    print(e.toString());
  }

  Fraction f = Fraction(15, 20);
  print(f.numerator);
  f._numerator = 20;
}
