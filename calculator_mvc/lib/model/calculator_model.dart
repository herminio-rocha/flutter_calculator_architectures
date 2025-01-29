import 'package:flutter/foundation.dart';

class CalculatorModel extends ChangeNotifier {
  String display = "";
  double result = 0.0;

  void clear() {}

  void backspace() {}

  void percent() {}

  void divide() {}

  void multiply() {}

  void subtract() {}

  void add() {}

  void inputNumber(String number) {}

  void inputDot() {}

  void calculate() {}
}
