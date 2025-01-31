import 'package:calculator_mvc/model/calculation.dart';
import 'package:calculator_mvc/model/calculator_button_symbol.dart';
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

  void clear() => _executeNotify((_) => _calculation.reset());

  void backspace() {}

  void percent() =>
      _executeNotify((_) => _addOperator(CalculatorButtonSymbol.percent.label));

  void divide() =>
      _executeNotify((_) => _addOperator(CalculatorButtonSymbol.divide.label));

  void multiply() => _executeNotify(
      (_) => _addOperator(CalculatorButtonSymbol.multiply.label));

  void subtract() => _executeNotify(
      (_) => _addOperator(CalculatorButtonSymbol.subtract.label));

  void add() =>
      _executeNotify((_) => _addOperator(CalculatorButtonSymbol.add.label));

  void inputNumber(String number) => _executeNotify((_) => _addNumber(number));

  void decimalSeparator() => _executeNotify((_) => _addDecimalSeparator());

  void calculate() {}

///////////////
  ///
  ///
  void _executeNotify(void Function(dynamic) action, [dynamic param]) {
    action(param);
    notifyListeners();
  }

  String _getLastCharOperation() =>
      _calculation.equationString[_calculation.equationString.length - 1];

  bool _isOperatorOrSymbol(String char) {
    return [
      CalculatorButtonSymbol.add.label,
      CalculatorButtonSymbol.subtract.label,
      CalculatorButtonSymbol.multiply.label,
      CalculatorButtonSymbol.divide.label,
      CalculatorButtonSymbol.percent.label,
      CalculatorButtonSymbol.decimalSeparator.label,
    ].contains(char);
  }

  //Antes de adicionar um operador ou símbolo à equationString,
  //precisamos garantir que a última entrada não seja outro operador
  //ou símbolo. Isso evita entradas inválidas, como ++, ÷x, ou %+.
  void _addOperator(String operator) {
    if (_calculation.equationString.isNotEmpty) {
      if (!_isOperatorOrSymbol(_getLastCharOperation())) {
        _calculation.equationString += operator;
      } else {
        // Caso o ultimo digito seja um operador,
        // apenas o substitui pelo novo
        if (!_calculation.equationString
            .endsWith(CalculatorButtonSymbol.decimalSeparator.label)) {
          _calculation.equationString.replaceRange(
            _calculation.equationString.length - 1,
            _calculation.equationString.length,
            operator,
          );
        }
      }
    } else if (operator == CalculatorButtonSymbol.subtract.label) {
      // Permite que o primeiro caractere seja um sinal negativo
      _calculation.equationString += operator;
    }
  }

  void _addDecimalSeparator() {
    if (_calculation.equationString.isNotEmpty) {
      // Add ponto se o ultimo digito nao for uma operacao ou ponto
      if (!_isOperatorOrSymbol(_getLastCharOperation()) &&
          !_calculation.equationString
              .endsWith(CalculatorButtonSymbol.decimalSeparator.label)) {
        _calculation.equationString +=
            CalculatorButtonSymbol.decimalSeparator.label;
      }
    } else {
      // Permite que o primeiro caractere seja um ponto, precedido por zero
      _calculation.equationString = CalculatorButtonSymbol.zero.label +
          CalculatorButtonSymbol.decimalSeparator.label;
    }
  }

  void _addNumber(String number) {}
}
