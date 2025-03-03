import 'package:calculator_mvvm/helper/localization_helper.dart';
import 'package:calculator_mvvm/helper/localization_keys.dart';
import 'package:calculator_mvvm/model/calculation.dart';
import 'package:calculator_mvvm/model/calculation_property.dart';
import 'package:calculator_mvvm/model/calculator_button_symbol.dart';
import 'package:calculator_mvvm/util/math_equation_processor.dart';

import 'dart:ui' as ui;

class CalculatorModel {
  final Calculation _calculation;

  CalculatorModel(this._calculation);
  bool _showResult = false;

  String get equation => _calculation.equation;
  String get result => _calculation.result;
  bool get showResult => _showResult;

  void clear() => _handleCalculationUpdate((_) => _equationReset());

  void backspace() => _handleCalculationUpdate((_) => _backspace());

  void percent() => _handleCalculationUpdate(
      (_) => _addMathOperator(CalculatorButtonSymbol.percent.label));

  void divide() => _handleCalculationUpdate(
      (_) => _addMathOperator(CalculatorButtonSymbol.divide.label));

  void multiply() => _handleCalculationUpdate(
      (_) => _addMathOperator(CalculatorButtonSymbol.multiply.label));

  void subtract() => _handleCalculationUpdate(
      (_) => _addMathOperator(CalculatorButtonSymbol.subtract.label));

  void add() => _handleCalculationUpdate(
      (_) => _addMathOperator(CalculatorButtonSymbol.add.label));

  void inputNumber(String number) =>
      _handleCalculationUpdate((_) => _addNumber(number));

  void decimalSeparator() =>
      _handleCalculationUpdate((_) => _addDecimalSeparator());

  void calculate() =>
      _handleCalculationUpdate((_) => {}, CalculatorButtonSymbol.calculate);

  void _handleCalculationUpdate(
    void Function(dynamic) action, [
    dynamic param,
  ]) {
    _updateShowResultState(param);
    action(param);
    _updateResultIfNeeded();
  }

  void _updateShowResultState(dynamic param) {
    if (param == CalculatorButtonSymbol.calculate) {
      _toggleShowResult();
    } else {
      _resetIfNewOperation();
    }
  }

  void _toggleShowResult() {
    if (_calculation.equation.isNotEmpty) {
      _showResult = true;
    }
  }

  void _resetIfNewOperation() {
    if (_showResult && _calculation.equation.isNotEmpty) {
      _showResult = false;
      _calculation.reset();
    }
  }

  void _updateResultIfNeeded() {
    if (_calculation.equation.isNotEmpty &&
        !_isMathOperator(_getLastCharOperation())) {
      if (_containsDivisionByZero(_normalizeEquation())) {
        _calculation.updateProperties(
          property: CalculationProperty.result,
          value: LocalizationHelper.getMessage(
            LocalizationKeys.errorDivisionByZero,
            ui.PlatformDispatcher.instance.locale,
          ),
        );
      } else {
        _calculation.updateProperties(
          property: CalculationProperty.result,
          value: _removeTrailingZeros(
            MathEquationProcessor.solveEquation(
              _normalizeEquation(),
            ),
          ),
        );
      }
    }
  }

  void _equationReset() => _calculation.reset();

  void _backspace() => _calculation.updateProperties(
        property: CalculationProperty.equation,
        removeLast: true,
      );

  void _addMathOperator(String mathOperator) {
    if (_calculation.equation.isNotEmpty) {
      if (mathOperator == CalculatorButtonSymbol.percent.label) {
        _handlePercentOperator();
      } else if (!_isMathOperator(_getLastCharOperation())) {
        _calculation.updateProperties(
          property: CalculationProperty.equation,
          value: mathOperator,
        );
      } else {
        _replaceLastMathOperator(mathOperator);
      }
    } else {
      _handleEmptyEquation(mathOperator);
    }
  }

  void _addNumber(String number) {
    if (number == CalculatorButtonSymbol.doubleZero.label) {
      _handleDoubleZeroInput();
    } else {
      _handleSingleNumberInput(number);
    }
  }

  void _addDecimalSeparator() {
    if (_calculation.equation.isEmpty ||
        _isMathOperator(_getLastCharOperation())) {
      _calculation
        ..updateProperties(
          property: CalculationProperty.equation,
          value: CalculatorButtonSymbol.zero.label,
        )
        ..updateProperties(
          property: CalculationProperty.equation,
          value: CalculatorButtonSymbol.decimalSeparator.label,
        );

      return;
    }

    if (_getLastNumber()
        .contains(CalculatorButtonSymbol.decimalSeparator.label)) {
      return;
    }

    _calculation.updateProperties(
      property: CalculationProperty.equation,
      value: CalculatorButtonSymbol.decimalSeparator.label,
    );
  }

  bool _containsDivisionByZero(String expression) {
    final divisionByZeroPattern = RegExp(r'\/\s*0(\.0*)?([^\.\d]|$)');
    return divisionByZeroPattern.hasMatch(expression);
  }

  void _handlePercentOperator() {
    if (_isMathOperator(_getLastCharOperation())) return;

    String percent = _solvePercent();

    for (var _ in _getLastNumber().split('')) {
      _calculation.updateProperties(
          property: CalculationProperty.equation, removeLast: true);
    }

    _calculation.updateProperties(
      property: CalculationProperty.equation,
      value: percent,
    );
  }

  bool _isMathOperator(String char) => [
        CalculatorButtonSymbol.add.label,
        CalculatorButtonSymbol.subtract.label,
        CalculatorButtonSymbol.multiply.label,
        CalculatorButtonSymbol.divide.label,
        CalculatorButtonSymbol.percent.label,
      ].contains(char);

  String _getLastCharOperation() =>
      _calculation.equation[_calculation.equation.length - 1];

  String _solvePercent() {
    String percentValue = _getLastNumber();
    String formattedEquation = _normalizeEquation();
    String lastMathOperator = _getMathLastOperator(formattedEquation);
    String partialEquation =
        _extractEquationBeforeLastMathOperator(formattedEquation);
    String partialResult = MathEquationProcessor.solveEquation(partialEquation);
    String percentDecimalValue = _convertPercentageToDecimal(percentValue);

    return lastMathOperator == CalculatorButtonSymbol.multiplyOperator.label ||
            lastMathOperator == CalculatorButtonSymbol.divideOperator.label ||
            lastMathOperator.isEmpty
        ? percentDecimalValue
        : _removeTrailingZeros(((double.tryParse(partialResult) ?? 0.0) *
                (double.tryParse(percentDecimalValue) ?? 0.0))
            .toStringAsPrecision(9));
  }

  String _getLastNumber() {
    final mathOperators = [
      CalculatorButtonSymbol.add.label,
      CalculatorButtonSymbol.subtract.label,
      CalculatorButtonSymbol.multiply.label,
      CalculatorButtonSymbol.divide.label
    ];
    String lastNumber = '';

    for (int i = _calculation.equation.length - 1; i >= 0; i--) {
      final char = _calculation.equation[i];
      if (mathOperators.contains(char)) {
        break;
      }
      lastNumber = char + lastNumber;
    }

    return lastNumber;
  }

  String _normalizeEquation() => _calculation.equation
      .replaceAll(
        CalculatorButtonSymbol.divide.label,
        CalculatorButtonSymbol.divideOperator.label,
      )
      .replaceAll(
        CalculatorButtonSymbol.multiply.label,
        CalculatorButtonSymbol.multiplyOperator.label,
      )
      .replaceAll(
        CalculatorButtonSymbol.decimalSeparator.label,
        CalculatorButtonSymbol.decimalSeparatorOperator.label,
      );

  String _getMathLastOperator(String equation) {
    final mathOperatorPattern = RegExp(r'[+\-*/]');

    final matches = mathOperatorPattern.allMatches(equation);

    return matches.isNotEmpty ? matches.last.group(0)! : '';
  }

  String _extractEquationBeforeLastMathOperator(String equation) {
    RegExp regex = RegExp(r'[\+\-\*/%](?=[^+\-*/%]*$)');
    Match? match = regex.firstMatch(equation);

    if (match != null) {
      return equation.substring(0, match.end - 1);
    }

    return equation;
  }

  String _convertPercentageToDecimal(String equation) => _removeTrailingZeros(
      ((double.tryParse(equation) ?? 0.0) / 100).toStringAsPrecision(9));

  String _removeTrailingZeros(String value) =>
      value.replaceAll(RegExp(r'([.]*0+)$'), '');

  void _replaceLastMathOperator(String mathOperator) {
    _calculation
      ..updateProperties(
          property: CalculationProperty.equation, removeLast: true)
      ..updateProperties(
        property: CalculationProperty.equation,
        value: mathOperator,
      );
  }

  void _handleEmptyEquation(String mathOperator) {
    if (mathOperator != CalculatorButtonSymbol.percent.label) {
      _calculation
        ..updateProperties(
          property: CalculationProperty.equation,
          value: CalculatorButtonSymbol.zero.label,
        )
        ..updateProperties(
          property: CalculationProperty.equation,
          value: mathOperator,
        );
    }
  }

  void _handleDoubleZeroInput() {
    if (_calculation.equation == CalculatorButtonSymbol.zero.label ||
        _getLastNumber() == CalculatorButtonSymbol.zero.label) return;

    if (_calculation.equation.isEmpty ||
        _isMathOperator(_getLastCharOperation())) {
      _calculation.updateProperties(
        property: CalculationProperty.equation,
        value: CalculatorButtonSymbol.zero.label,
      );
      return;
    }

    _calculation.updateProperties(
      property: CalculationProperty.equation,
      value: CalculatorButtonSymbol.doubleZero.label,
    );
  }

  void _handleSingleNumberInput(String number) {
    if (_calculation.equation == CalculatorButtonSymbol.zero.label) {
      _calculation.updateProperties(
        property: CalculationProperty.equation,
        value: number,
      );
      return;
    }

    if (_getLastNumber() == CalculatorButtonSymbol.zero.label) {
      _calculation
        ..updateProperties(
          property: CalculationProperty.equation,
          value: CalculatorButtonSymbol.zero.label,
        )
        ..updateProperties(
            property: CalculationProperty.equation, value: number);
      return;
    }

    _calculation.updateProperties(
      property: CalculationProperty.equation,
      value: number,
    );
  }
}
