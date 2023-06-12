class Fraction{
  late final dynamic x;
  late final dynamic y;
  
  Fraction.constConstruct(int x1, int x2){
    x = x1;
    y = x2;
    
  }
}

class Fraction2{
  final int ?_numerator;
  final int ?_denominator;
  
  const Fraction2({int ?numerator, int ?denominator}) : _numerator = numerator, _denominator = denominator;
}

void main(){
//   const Fraction f = Fraction.constConstruct(10, 20);
//   const Fraction f1 = Fraction.constConstruct(10, 20);
  Fraction f2 = Fraction.constConstruct(10, 20);
//   (f == f1) ? print("yes") : print("no");
//   (f == f2) ? print("yes") : print("no");
  print(f2.x);
  
  
}