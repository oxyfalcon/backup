import 'a.dart';

class helperClass implements CustomState {
  helperClass() {
    print("Constructors for helperClass called");
  }
}

// 8922802851

class CustomState extends State {
  factory CustomState() {
    print("CustomState constructor called");
    return helperClass();
  }
  void noSuchMethod(Invocation invocation) {
    super.noSuchMethod(invocation);
  }
  // CustomState() : super._(){
  //   return helperClass();
  // }
}

void whatIsThisState(State state) {
  switch (state) {
    case ErrorState():
      print(state.msg);
    case SuccessState():
      print(state.value);
    // default:
    //   print('This case should not exist!');
  }
}

void main() {
  // whatIsThisState(CustomState().help());
  CustomState c = CustomState();
  State S = State.success("Akash");
}
