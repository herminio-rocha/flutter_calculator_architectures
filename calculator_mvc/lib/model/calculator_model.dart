import 'package:calculator_mvc/model/calculation.dart';
import 'package:calculator_mvc/model/calculation_property.dart';
import 'package:calculator_mvc/model/calculator_button_symbol.dart';
import 'package:flutter/foundation.dart';

class CalculatorModel extends ChangeNotifier {
  final Calculation _calculation = Calculation();

  String get equationString => _calculation.equationString;
  double get equationValue => _calculation.equationValue;
  String get resultString => _calculation.resultString;
  double get resultValue => _calculation.resultValue;

  void clear() => _executeNotify((_) => _calculation.reset());

  void backspace() => _executeNotify(
        (_) => _calculation.updateProperts(
          property: CalculationProperty.equationString,
          removeLast: true,
        ),
      );

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

  bool _isValidExpression(String expression) {
    final regex = RegExp(r'^(?:\d+|\d+,\d*)?(?:[+\-×÷](?:\d+|\d+,\d*)?)*$');
    return regex.hasMatch(expression);
  }

  String _getLastCharOperation() =>
      _calculation.equationString[_calculation.equationString.length - 1];

  String _getLastNumber() {
    final operators = [
      CalculatorButtonSymbol.add.label,
      CalculatorButtonSymbol.subtract.label,
      CalculatorButtonSymbol.multiply.label,
      CalculatorButtonSymbol.divide.label
    ];
    String lastNumber = '';

    // Itera a string de trás para frente
    for (int i = _calculation.equationString.length - 1; i >= 0; i--) {
      final char = _calculation.equationString[i];
      if (operators.contains(char)) {
        // Encontrou um operador, para a iteração
        break;
      }
      lastNumber = char + lastNumber;
    }

    return lastNumber;
  }

  bool _isOperator(String char) {
    return [
      CalculatorButtonSymbol.add.label,
      CalculatorButtonSymbol.subtract.label,
      CalculatorButtonSymbol.multiply.label,
      CalculatorButtonSymbol.divide.label,
      CalculatorButtonSymbol.percent.label,
    ].contains(char);
  }

  bool _isDecimalSeparator(String char) =>
      char == CalculatorButtonSymbol.decimalSeparator.label;

  bool _isNumeric(String char) => double.tryParse(char) != null;

  bool _isValidMultipleZeros(String number) {
    // Verifica se o número contém apenas zeros válidos
    if (number == "0") return true; // Apenas um zero é válido

    // Verifica se há múltiplos zeros no início ou no final
    if (number.startsWith("0") && !number.contains(',')) {
      // Números como "0001" são inválidos
      return false;
    }

    // Verifica se há múltiplos zeros após a vírgula
    if (number.contains(',')) {
      final parts = number.split(',');
      if (parts[1].isEmpty || parts[1].replaceAll('0', '').isEmpty) {
        // Números como "0,000" ou "1,0000" são válidos
        return true;
      }
    }

    return true;
  }

  void _addOperator(String operator) {
    // Antes de adicionar um operador equationString,
    // é preciso garantir que a última entrada não seja outro operador.
    // Isso evita entradas inválidas, como ++, ÷x, ou %+.
    if (_calculation.equationString.isNotEmpty) {
      // Se o último caracter digitado não for um operador
      // insere o operador a equationString
      if (!_isOperator(_getLastCharOperation())) {
        _calculation.updateProperts(
          property: CalculationProperty.equationString,
          value: operator,
        );
      } else {
        // Caso o ultimo digito seja um operador,
        // apenas o substitui pelo novo
        if (!_calculation.equationString
            .endsWith(CalculatorButtonSymbol.decimalSeparator.label)) {
          _calculation
            ..updateProperts(
                property: CalculationProperty.equationString, removeLast: true)
            ..updateProperts(
              property: CalculationProperty.equationString,
              value: operator,
            );
        }
      }
    } else if (operator == CalculatorButtonSymbol.subtract.label) {
      // Permite que o primeiro caractere seja um sinal negativo
      _calculation.updateProperts(
        property: CalculationProperty.equationString,
        value: operator,
      );
    }
  }

  void _addDecimalSeparator() {
    /// Se equationString estiver vazio inicia com 0,
    /// OU
    /// Se o ultimo caracter for um operador adiciona 0,
    if (_calculation.equationString.isEmpty ||
        _isOperator(_getLastCharOperation())) {
      _calculation
        ..updateProperts(
          property: CalculationProperty.equationString,
          value: CalculatorButtonSymbol.zero.label,
        )
        ..updateProperts(
          property: CalculationProperty.equationString,
          value: CalculatorButtonSymbol.decimalSeparator.label,
        );

      return;
    }

    /// Se já existe ',' no último número depois do último operador
    /// não permite adicionar ',' novamente
    if (_getLastNumber()
        .contains(CalculatorButtonSymbol.decimalSeparator.label)) {
      return;
    }

    /// Se não atender nenhuma regra,
    /// entao pode adicionar ','
    /// atribui um valor inicial
    _calculation.updateProperts(
      property: CalculationProperty.equationString,
      value: CalculatorButtonSymbol.decimalSeparator.label,
    );
  }

  void _addNumber(String number) {
    /// Validação para 00
    if (number == CalculatorButtonSymbol.doubleZero.label) {
      /// Validação para ignorar múltiplos zeros no início
      if (_calculation.equationString == CalculatorButtonSymbol.zero.label) {
        return;
      }

      /// Se a expressão estiver vazia, inicia com 0
      if (_calculation.equationString.isEmpty) {
        _calculation.updateProperts(
          property: CalculationProperty.equationString,
          value: CalculatorButtonSymbol.zero.label,
        );
        return;
      }

      /// Se o último caractere for um operador, adiciona "0" em vez de "00"
      if (_isOperator(_getLastCharOperation())) {
        _calculation.updateProperts(
          property: CalculationProperty.equationString,
          value: CalculatorButtonSymbol.zero.label,
        );
        return;
      }

      // Se o último caractere depois do operador for 0 ignora
      if (_getLastNumber() == CalculatorButtonSymbol.zero.label) {
        return;
      }

      // Adiciona "00" normalmente
      _calculation.updateProperts(
        property: CalculationProperty.equationString,
        value: CalculatorButtonSymbol.doubleZero.label,
      );
    } else {
      // Validação para outros números
      // ------------------------------
      // Caso equationString seja igual a 0
      // substitui 0 pelo numero digitado
      if (_calculation.equationString == CalculatorButtonSymbol.zero.label) {
        _calculation.updateProperts(
          property: CalculationProperty.equationString,
          value: number,
        );
        return;
      }

      // Se o último caractere depois do operador for 0
      // substitui pelo numero digitado
      if (_getLastNumber() == CalculatorButtonSymbol.zero.label) {
        _calculation
          ..updateProperts(
            property: CalculationProperty.equationString,
            value: CalculatorButtonSymbol.zero.label,
          )
          ..updateProperts(
              property: CalculationProperty.equationString, value: number);

        return;
      }

      /// Se não atender nenhuma regra
      /// adiciona o numero a equationString
      _calculation.updateProperts(
        property: CalculationProperty.equationString,
        value: number,
      );
    }
  }
}
