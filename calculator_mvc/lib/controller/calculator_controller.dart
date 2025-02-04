import 'package:calculator_mvc/model/calculator_model.dart';

class CalculatorController {
  final CalculatorModel _calculatorModel;

  CalculatorController(this._calculatorModel);

  String get equation => _calculatorModel.equation;

  String get result => _calculatorModel.result;

  bool get showResult => _calculatorModel.showResult;

  void clear() => _calculatorModel.clear();

  void backspace() => _calculatorModel.backspace();

  void percent() => _calculatorModel.percent();

  void divide() => _calculatorModel.divide();

  void multiply() => _calculatorModel.multiply();

  void subtract() => _calculatorModel.subtract();

  void add() => _calculatorModel.add();

  void inputNumber(String number) => _calculatorModel.inputNumber(number);

  void decimalSeparator() => _calculatorModel.decimalSeparator();

  void calculate() => _calculatorModel.calculate();
}
