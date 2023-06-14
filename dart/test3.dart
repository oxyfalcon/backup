class Fraction {
  final int _x;
  final int _y;

  const Fraction.constConstruct(this._x, this._y);
  const Fraction(this._x) : this._y = _x * 3;
  void printFraction() {
    _y;
    print("$this._x $this._y");
  }
}

class Sample {
  static const x = 10;
  static const y = 10;
  void fun() {
    const int xy = 20;
    xy;
  }

  const Sample();
}

class Logger {
  final String name;
  bool mute = false;
  int counter;

  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }
  Logger._internal(this.name) : this.counter = name.length;

  void log(String msg) {
    if (!mute) print(msg);
  }
}

class Singleton {
  int? _x;
  int? _y;

  static Singleton _obj = Singleton._default();
  Singleton._default();

  int? get y => _y;
  int? get x => _x;

  factory Singleton(int x, int y) {
    _obj._x = x;
    _obj._y = y;
    return _obj;
  }
}

class sample2 {
  static sample2 obj = sample2();
  factory sample2() {
    return obj;
  }
}

// class ParameterException extends Exception {}

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
            : throw FormatException("Undefined parameters");

  void checkFraction() {
    ((_denominator == 0 && _numerator == 0) || (_denominator == 0))
        ? throw FormatException('Undefined Fraction Number')
        : print("Fraction Successfull!!");
  }
}

// Made from the constant constructor of Fraction2 class.
// Although it has 2 different constructors, we utilizing the
// const constructors for the annotations
@Fraction2.constConstruct(numerator: 10, denominator: 30)
class Example {
  final int? a;

  Example._(this.a);
  factory Example(int val) {
    return Example._(val);
  }
}

void main() {
  // try{
  //   fll = Fraction2();
  // }
  Singleton s1 = Singleton(10, 20);
  Singleton s2 = Singleton(10, 30);
  print(s1.y);
  print(s2.y);
  (s1 == s2) ? print("Singleton: yes") : print("Singleton: no");

  Fraction x1 = Fraction.constConstruct(10, 20);
  print(x1._x);
  Fraction f = const Fraction.constConstruct(10, 20);
  Fraction f1 = const Fraction.constConstruct(10, 20);

  (f == f1) ? print("yes: f1") : print("No: f1");

  try {
    Fraction2 f3 = Fraction2();
    f3;
  } catch (e) {
    print(e);
  }

  var logger3 = Logger("name2");
  var checklogger3 = Logger("name2");

  print(Logger._cache);
  (logger3 == checklogger3) ? print("yes: logger") : print("no: logger");

  final diameters = <double, String>{1.0: 'Earth'};
  final otherDiameters = <double, String>{0.383: 'Mercury', 0.949: 'Venus'};

  for (final item in otherDiameters.entries) {
    diameters.putIfAbsent(item.key, () => item.value);
  }
  print(diameters);

  // If the key already exists, the current value is returned.
  // If the key doesn't exist, the value is then added.
  // In this case, it is the value that is returned, "Jupiter"
  final result = diameters.putIfAbsent(0.384, () => "Jupiter");
  print(result); // Mercury
  print(diameters); // {1.0: Earth, 0.383: Mercury, 0.949: Venus}
}
