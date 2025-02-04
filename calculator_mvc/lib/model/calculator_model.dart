import 'package:calculator_mvc/model/calculation.dart';
import 'package:calculator_mvc/model/calculation_property.dart';
import 'package:calculator_mvc/model/calculator_button_symbol.dart';
import 'package:calculator_mvc/util/math_expression_processor.dart';
import 'package:flutter/foundation.dart';

class CalculatorModel extends ChangeNotifier {
  final Calculation _calculation = Calculation();
  bool _showResult = false;

  String get equation => _calculation.equation;
  String get result => _calculation.result;
  bool get showResult => _showResult;

  void clear() => _executeNotify((_) => _calculation.reset());

  void backspace() => _executeNotify(
        (_) => _calculation.updateProperts(
          property: CalculationProperty.equation,
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

  void calculate() =>
      _executeNotify((_) => {}, CalculatorButtonSymbol.calculate);

///////////////
  ///
  ///
  void _executeNotify(void Function(dynamic) action, [dynamic param]) {
    if (param == CalculatorButtonSymbol.calculate) {
      if (_calculation.equation.isNotEmpty) {
        _showResult = true;
      }
    } else {
      if (_showResult && _calculation.equation.isNotEmpty) {
        _showResult = false;
        _calculation.reset();
      }
    }

    action(param);

    if (_calculation.equation.isNotEmpty &&
        !_isOperator(_getLastCharOperation())) {
      _calculation.updateProperts(
        property: CalculationProperty.result,
        value: _removeTrailingZeros(
          MathExpressionProcessor.solveExpression(
            _normalizeExpression(),
          ),
        ),
      );
    }

    notifyListeners();
  }

  String _getLastCharOperation() =>
      _calculation.equation[_calculation.equation.length - 1];

  String _removeTrailingZeros(String value) =>
      value.replaceAll(RegExp(r'([.]*0+)$'), '');

  /// Obtém o último número da expressão
  String _getLastNumber() {
    final operators = [
      CalculatorButtonSymbol.add.label,
      CalculatorButtonSymbol.subtract.label,
      CalculatorButtonSymbol.multiply.label,
      CalculatorButtonSymbol.divide.label
    ];
    String lastNumber = '';

    // Itera a string de trás para frente
    for (int i = _calculation.equation.length - 1; i >= 0; i--) {
      final char = _calculation.equation[i];
      if (operators.contains(char)) {
        // Encontrou um operador, para a iteração
        break;
      }
      lastNumber = char + lastNumber;
    }

    return lastNumber;
  }

  /// Retorna o último operador encontrado na expressão
  String _getLastOperator(String expression) {
    // Define os operadores matemáticos possíveis
    final operatorPattern = RegExp(r'[+\-*/]');

    // Encontra todos os operadores na expressão
    final matches = operatorPattern.allMatches(expression);

    // Retorna o último operador encontrado
    return matches.isNotEmpty ? matches.last.group(0)! : '';
  }

  bool _isOperator(String char) => [
        CalculatorButtonSymbol.add.label,
        CalculatorButtonSymbol.subtract.label,
        CalculatorButtonSymbol.multiply.label,
        CalculatorButtonSymbol.divide.label,
        CalculatorButtonSymbol.percent.label,
      ].contains(char);

  /// Substitui `÷` pelo operador aceito `/`
  /// Substitui `×` pelo operador aceito `*`
  /// Substitui `,` pelo operador aceito `.`
  /// Substitui `%` por sua forma decimal (ex: "20%" → "(20*0.01)")
  String _normalizeExpression() => _calculation.equation
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
      )
      .replaceAllMapped(
        RegExp(r'(\d*\.?\d+)%'),
        (match) => '(${match[1]}*0.01)',
      );

  // Retorna a expressao com o calculo existente antes do
  // ultimo numero e operador
  String _extractExpressionBeforeLastOperator(String expression) {
    // Encontra a última ocorrência de um operador
    RegExp regex = RegExp(r'[\+\-\*/%](?=[^+\-*/%]*$)');
    Match? match = regex.firstMatch(expression);

    if (match != null) {
      return expression.substring(0, match.end - 1);
    }

    return expression;
  }

  /// Converte o valor percentual para sua forma decimal
  String _convertPercentageToDecimal(String expression) => _removeTrailingZeros(
      ((double.tryParse(expression) ?? 0.0) / 100).toStringAsPrecision(9));

  /// Resolve a porcentagem, realizando a conversão e cálculos conforme necessário
  String _solvePercente() {
    String percentValue = _getLastNumber();
    String formattedExpression = _normalizeExpression();
    String lastOperator = _getLastOperator(formattedExpression);
    String partialExpression =
        _extractExpressionBeforeLastOperator(formattedExpression);
    String partialResult =
        MathExpressionProcessor.solveExpression(partialExpression);
    String percentDecimalValue = _convertPercentageToDecimal(percentValue);

    /// Aplica a porcentagem dependendo do operador anterior
    return lastOperator == CalculatorButtonSymbol.multiplyOperator.label ||
            lastOperator == CalculatorButtonSymbol.divideOperator.label ||
            lastOperator.isEmpty
        ? percentDecimalValue
        : _removeTrailingZeros(((double.tryParse(partialResult) ?? 0.0) *
                (double.tryParse(percentDecimalValue) ?? 0.0))
            .toStringAsPrecision(9));
  }

  void _addOperator(String operator) {
    // Antes de adicionar um operador equation,
    // é preciso garantir que a última entrada não seja outro operador.
    // Isso evita entradas inválidas, como ++, ÷x, ou %+.
    if (_calculation.equation.isNotEmpty) {
      // Validações para o operador `%`
      if (operator == CalculatorButtonSymbol.percent.label) {
        // Caso o ultimo caracter seja um operador
        // Nao permite adicionar `%` a expressao
        if (_isOperator(_getLastCharOperation())) {
          return;
        }

        /// Faz os calculos para definir valor da porcentagem
        String percent = _solvePercente();

        for (var _ in _getLastNumber().split('')) {
          _calculation.updateProperts(
              property: CalculationProperty.equation, removeLast: true);
        }

        _calculation.updateProperts(
          property: CalculationProperty.equation,
          value: percent,
        );

        return;
      }

      // Se o último caracter digitado não for um operador
      // insere o operador a equation
      if (!_isOperator(_getLastCharOperation())) {
        _calculation.updateProperts(
          property: CalculationProperty.equation,
          value: operator,
        );
      } else {
        // Caso o ultimo digito seja um operador,
        // apenas o substitui pelo novo
        if (!_calculation.equation
            .endsWith(CalculatorButtonSymbol.decimalSeparator.label)) {
          _calculation
            ..updateProperts(
                property: CalculationProperty.equation, removeLast: true)
            ..updateProperts(
              property: CalculationProperty.equation,
              value: operator,
            );
        }
      }
    } else

    /// Se a equação estiver vazia
    /// acrescenta um 0 antes do operador
    /// para tornar a equação valida
    {
      if (operator != CalculatorButtonSymbol.percent.label) {
        _calculation
          ..updateProperts(
            property: CalculationProperty.equation,
            value: CalculatorButtonSymbol.zero.label,
          )
          ..updateProperts(
            property: CalculationProperty.equation,
            value: operator,
          );
      }
    }
  }

  void _addDecimalSeparator() {
    /// Se equation estiver vazio inicia com 0,
    /// OU
    /// Se o ultimo caracter for um operador adiciona 0,
    if (_calculation.equation.isEmpty || _isOperator(_getLastCharOperation())) {
      _calculation
        ..updateProperts(
          property: CalculationProperty.equation,
          value: CalculatorButtonSymbol.zero.label,
        )
        ..updateProperts(
          property: CalculationProperty.equation,
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
      property: CalculationProperty.equation,
      value: CalculatorButtonSymbol.decimalSeparator.label,
    );
  }

  void _addNumber(String number) {
    /// Validação para 00
    if (number == CalculatorButtonSymbol.doubleZero.label) {
      /// Validação para ignorar múltiplos zeros no início
      if (_calculation.equation == CalculatorButtonSymbol.zero.label) {
        return;
      }

      /// Se a expressão estiver vazia, inicia com 0
      if (_calculation.equation.isEmpty) {
        _calculation.updateProperts(
          property: CalculationProperty.equation,
          value: CalculatorButtonSymbol.zero.label,
        );
        return;
      }

      /// Se o último caractere for um operador, adiciona "0" em vez de "00"
      if (_isOperator(_getLastCharOperation())) {
        _calculation.updateProperts(
          property: CalculationProperty.equation,
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
        property: CalculationProperty.equation,
        value: CalculatorButtonSymbol.doubleZero.label,
      );
    } else {
      // Validação para outros números
      // ------------------------------
      // Caso equation seja igual a 0
      // substitui 0 pelo numero digitado
      if (_calculation.equation == CalculatorButtonSymbol.zero.label) {
        _calculation.updateProperts(
          property: CalculationProperty.equation,
          value: number,
        );
        return;
      }

      // Se o último caractere depois do operador for 0
      // substitui pelo numero digitado
      if (_getLastNumber() == CalculatorButtonSymbol.zero.label) {
        _calculation
          ..updateProperts(
            property: CalculationProperty.equation,
            value: CalculatorButtonSymbol.zero.label,
          )
          ..updateProperts(
              property: CalculationProperty.equation, value: number);

        return;
      }

      /// Se não atender nenhuma regra
      /// adiciona o numero a equation
      _calculation.updateProperts(
        property: CalculationProperty.equation,
        value: number,
      );
    }
  }
}
