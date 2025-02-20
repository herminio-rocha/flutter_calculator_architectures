import 'package:calculator_mvvm/model/calculator_button_config.dart';
import 'package:calculator_mvvm/model/calculator_model.dart';
import 'package:calculator_mvvm/repository/calculator_button_config_repository.dart';
import 'package:flutter/material.dart';

class CalculatorViewModel extends ChangeNotifier {
  final CalculatorButtonConfigRepository _calculatorButtonConfigRepository;
  final CalculatorModel _calculatorModel;

  List<CalculatorButtonConfig> _buttons = [];

  CalculatorViewModel(
    this._calculatorButtonConfigRepository,
    this._calculatorModel,
  ) {
    _executeNotify(() => _getButtons());
  }

  List<CalculatorButtonConfig> get buttons => _buttons;
  String get equation => _calculatorModel.equation;
  String get result => _calculatorModel.result;
  bool get showResult => _calculatorModel.showResult;

  void _getButtons() =>
      _buttons = _calculatorButtonConfigRepository.getButtons();

  void clear() => _executeNotify(() => _calculatorModel.clear());

  void backspace() => _executeNotify(() => _calculatorModel.backspace());

  void percent() => _executeNotify(() => _calculatorModel.percent());

  void divide() => _executeNotify(() => _calculatorModel.divide());

  void multiply() => _executeNotify(() => _calculatorModel.multiply());

  void subtract() => _executeNotify(() => _calculatorModel.subtract());

  void add() => _executeNotify(() => _calculatorModel.add());

  void inputNumber(String number) =>
      _executeNotify(() => _calculatorModel.inputNumber(number));

  void decimalSeparator() =>
      _executeNotify(() => _calculatorModel.decimalSeparator());

  void calculate() => _executeNotify(() => _calculatorModel.calculate());

  void _executeNotify(
    void Function() action,
  ) {
    action();
    notifyListeners();
  }
}
