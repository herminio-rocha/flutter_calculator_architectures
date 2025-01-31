import 'package:calculator_mvc/model/calculation.dart';
import 'package:flutter/foundation.dart';

class CalculatorModel extends ChangeNotifier {
  final Calculation _calculation = Calculation(
    equationString: "",
    equationValue: 0.0,
    resultString: "0",
    resultValue: 0.0,
  );

  String get equationString => _calculation.equationString;
  double get equationValue => _calculation.equationValue;
  String get resultString => _calculation.resultString;
  double get resultValue => _calculation.resultValue;

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
