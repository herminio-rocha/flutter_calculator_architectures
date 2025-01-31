import 'package:calculator_mvc/model/calculator_model.dart';

class CalculatorController {
  final CalculatorModel _calculatorModel;

  CalculatorController(this._calculatorModel);

  String get equationString => _calculatorModel.equationString;

  String get resultString => _calculatorModel.resultString;

  void clear() => _calculatorModel.clear();

  void backspace() => _calculatorModel.clear();

  void percent() => _calculatorModel.percent();

  void divide() => _calculatorModel.divide();

  void multiply() => _calculatorModel.multiply();

  void subtract() => _calculatorModel.subtract();

  void add() => _calculatorModel.add();

  void inputNumber(String number) => _calculatorModel.inputNumber(number);

  void inputDot() => _calculatorModel.inputDot();

  void calculate() => _calculatorModel.calculate();
}
