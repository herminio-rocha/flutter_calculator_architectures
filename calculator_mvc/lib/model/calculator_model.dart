import 'package:calculator_mvc/model/calculation.dart';
import 'package:calculator_mvc/model/calculation_property.dart';
import 'package:calculator_mvc/model/calculator_button_symbol.dart';
import 'package:calculator_mvc/util/math_equation_processor.dart';
import 'package:flutter/foundation.dart';

/// [CalculatorModel] gerencia o estado e a lógica da aplicação da calculadora,
/// seguindo o padrão MVC.
///
/// [CalculatorModel] is responsible for managing the state and logic
/// of the calculator application, following the MVC pattern.
class CalculatorModel extends ChangeNotifier {
  final Calculation _calculation = Calculation();
  bool _showResult = false;

  /// Getters Methods
  ///
  /// Métodos que retornam propriedades do estado atual da calculadora.
  ///
  /// Methods that return properties of the current state of the calculator.
  String get equation => _calculation.equation;
  String get result => _calculation.result;
  bool get showResult => _showResult;

  /// Public Methods
  ///
  /// Métodos chamados pelo controlador para executar ações conforme o usuário interage com a UI.
  ///
  /// Methods called by the controller to perform actions as the user interacts with the UI.
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

  /// Private Methods
  ///
  /// Métodos que contêm a lógica interna da calculadora.
  ///
  /// Methods that contain the calculator's internal logic.

  /// Gerencia a lógica de atualização do cálculo, incluindo o gerenciamento
  /// do estado e a notificação dos ouvintes.
  ///
  /// Handles the calculation update logic, including state management
  /// and notifying listeners.
  void _handleCalculationUpdate(
    void Function(dynamic) action, [
    dynamic param,
  ]) {
    _updateShowResultState(param);
    action(param);
    _updateResultIfNeeded();
    notifyListeners();
  }

  /// Atualiza o estado de exibição do resultado com base no botão pressionado.
  ///
  /// Updates the show result state based on the button pressed.
  void _updateShowResultState(dynamic param) {
    if (param == CalculatorButtonSymbol.calculate) {
      _toggleShowResult();
    } else {
      _resetIfNewOperation();
    }
  }

  /// Alterna a variável `_showResult` para `true` ao calcular um resultado,
  /// caso a equação não esteja vazia.
  ///
  /// Change the `_showResult` variable to `true` when calculating a result,
  /// if the equation is not empty.
  void _toggleShowResult() {
    if (_calculation.equation.isNotEmpty) {
      _showResult = true;
    }
  }

  /// Reinicia o estado se um novo número ou operação for inserido após um cálculo.
  ///
  /// Resets the state if a new number or operation is entered after a calculation.
  void _resetIfNewOperation() {
    if (_showResult && _calculation.equation.isNotEmpty) {
      _showResult = false;
      _calculation.reset();
    }
  }

  /// Atualiza o resultado da equação caso a entrada seja válida.
  ///
  /// Updates the result of the equation if the input is valid.
  void _updateResultIfNeeded() {
    if (_calculation.equation.isNotEmpty &&
        !_isMathOperator(_getLastCharOperation())) {
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

  /// Reinicia o estado para iniciar uma nova equacao.
  ///
  /// Reset the state to start a new equation.
  void _equationReset() => _calculation.reset();

  ///Apaga o ultimo caracter digitado.
  ///
  ///Erase the last character typed.
  void _backspace() => _calculation.updateProperties(
        property: CalculationProperty.equation,
        removeLast: true,
      );

  /// Adiciona um operador matemático à equação,
  /// garantindo uma entrada válida.
  ///
  /// Adds a mathematical operator to the equation,
  /// ensuring valid input.
  void _addMathOperator(String mathOperator) {
    /// Caso a equação não esteja vazia, é preciso fazer
    /// algumas validaçoes para garantir que a equação seja válida
    /// e evitar entradas inválidas, como por exemplo
    /// `++`, `÷x`, ou `%+` etc.
    ///
    /// If the equation is not empty, you must do
    /// some validations to ensure that the equation is valid
    /// and avoid invalid entries, e.g.
    /// `++`, `÷x`, or `%+` etc.
    if (_calculation.equation.isNotEmpty) {
      /// Caso o operador matemático pressionado seja `%``,
      /// executa as regras que se aplicam a ele.
      ///
      /// If the mathematical operator specified is `%``,
      /// executes the rules that apply to it.
      if (mathOperator == CalculatorButtonSymbol.percent.label) {
        _handlePercentOperator();
      } else

      /// Se o último caracter digitado não for um operador matemático,
      /// então insere o operador matemático desejado a equação.
      ///
      /// If the last character entered is not an mathematical operator,
      /// then insert the desired mathematical operator into the equation.
      if (!_isMathOperator(_getLastCharOperation())) {
        _calculation.updateProperties(
          property: CalculationProperty.equation,
          value: mathOperator,
        );
      } else {
        /// Caso o ultimo caractere seja um operador matemático,
        /// o substitui pelo novo.
        ///
        /// If the last character is a mathematical operator,
        /// replace it with the new one.
        _replaceLastMathOperator(mathOperator);
      }
    } else {
      /// Se a equação estiver vazia acrescenta um 0 antes do operador matemático
      /// para tornar a equação valida.
      ///
      /// If the equation is empty, add a 0 before the mathematical operator
      /// to make the equation valid.
      _handleEmptyEquation(mathOperator);
    }
  }

  /// Adiciona um número à equação, garantindo uma entrada válida.
  ///
  /// Adds a number to the equation, ensuring valid input.
  void _addNumber(String number) {
    /// Caso o número pressionado seja `00`
    /// executa as regras que se aplicam a ele.
    ///
    /// If the number entered is `00`
    /// executes the rules that apply to it.
    if (number == CalculatorButtonSymbol.doubleZero.label) {
      _handleDoubleZeroInput();
    } else {
      /// Validações e regras para os demais números.
      ///
      /// Validations and rules for other numbers.
      _handleSingleNumberInput(number);
    }
  }

  /// Adiciona um separador decimal à equação, garantindo uma entrada válida.
  ///
  /// Adds a decimal separator to the equation, ensuring valid input.
  void _addDecimalSeparator() {
    /// Se a equação estiver vazia então inicia com `0`, OU
    /// Se o ultimo caracter for um operador matemético, adiciona `0,` a equação.
    ///
    /// If the equation is empty then it starts with `0`, OR
    /// If the last character is an mathematical operator, add `0,` to the equation.
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

    /// Se já existe `,` no último número depois do último operador matemático
    /// não permite adicionar `,` novamente no mesmo número.
    ///
    /// If there is already `,` in the last number after the last mathematical operator
    /// does not allow adding `,` again in the same number.
    if (_getLastNumber()
        .contains(CalculatorButtonSymbol.decimalSeparator.label)) {
      return;
    }

    /// Se não atender nenhuma condição, entao pode adicionar `,`.
    ///
    /// If no conditions are met, then you can add `,`.
    _calculation.updateProperties(
      property: CalculationProperty.equation,
      value: CalculatorButtonSymbol.decimalSeparator.label,
    );
  }

  /// Helper Methods
  ///
  /// Métodos auxiliares que realizam tarefas específicas e repetitivas.
  ///
  /// Auxiliary methods that perform specific and repetitive tasks.

  /// Gerencia a lógica a ser aplicada para o operador matemático `%`.
  ///
  /// Handles the logic to be applied to the `%`` mathematical operator.
  void _handlePercentOperator() {
    /// Caso o ultimo caracter da equação seja um operador matemático
    /// não permite adicionar `%` a equação.
    ///
    /// If the last character of the equation is a mathematical operator
    /// does not allow adding `%` to the equation.
    if (_isMathOperator(_getLastCharOperation())) return;

    /// Faz os cálculos para definir valor decimal da porcentagem.
    ///
    /// Execute the calculations to define the decimal value of the percentage.
    String percent = _solvePercent();

    /// Remove o ultimo número para adicionar
    /// porcentagem em forma decimal.
    ///
    /// Remove the last number to add
    /// percentage in decimal form.
    for (var _ in _getLastNumber().split('')) {
      _calculation.updateProperties(
          property: CalculationProperty.equation, removeLast: true);
    }

    /// Atualiza o equação com a porcentagem digitada
    /// em sua forma decimal.
    ///
    /// Updates the equation  with the percentage type
    /// in its decimal form.
    _calculation.updateProperties(
      property: CalculationProperty.equation,
      value: percent,
    );
  }

  /// Verifica se um caractere é um operador matemático válido.
  ///
  /// Checks if a character is a valid mathematical operator.
  bool _isMathOperator(String char) => [
        CalculatorButtonSymbol.add.label,
        CalculatorButtonSymbol.subtract.label,
        CalculatorButtonSymbol.multiply.label,
        CalculatorButtonSymbol.divide.label,
        CalculatorButtonSymbol.percent.label,
      ].contains(char);

  /// Retorna o último caractere da equação atual.
  ///
  /// Returns the last character of the current equation.
  String _getLastCharOperation() =>
      _calculation.equation[_calculation.equation.length - 1];

  /// Resolve o cálculo de porcentagem com base na equação atual.
  ///
  /// Solves the percentage calculation based on the current equation.
  String _solvePercent() {
    String percentValue = _getLastNumber();
    String formattedEquation = _normalizeEquation();
    String lastMathOperator = _getMathLastOperator(formattedEquation);
    String partialEquation =
        _extractEquationBeforeLastMathOperator(formattedEquation);
    String partialResult = MathEquationProcessor.solveEquation(partialEquation);
    String percentDecimalValue = _convertPercentageToDecimal(percentValue);

    /// Aplica a porcentagem dependendo do último operador matemático da equeção.
    ///
    /// Applies the percentage depending on the last mathematical operator of the equation.
    return lastMathOperator == CalculatorButtonSymbol.multiplyOperator.label ||
            lastMathOperator == CalculatorButtonSymbol.divideOperator.label ||
            lastMathOperator.isEmpty
        ? percentDecimalValue
        : _removeTrailingZeros(((double.tryParse(partialResult) ?? 0.0) *
                (double.tryParse(percentDecimalValue) ?? 0.0))
            .toStringAsPrecision(9));
  }

  /// Retorna o último número na equação.
  ///
  /// Returns the last number in the equation.
  String _getLastNumber() {
    final mathOperators = [
      CalculatorButtonSymbol.add.label,
      CalculatorButtonSymbol.subtract.label,
      CalculatorButtonSymbol.multiply.label,
      CalculatorButtonSymbol.divide.label
    ];
    String lastNumber = '';

    /// Itera a equação de trás para frente.
    ///
    /// Iterates the equation backwards.
    for (int i = _calculation.equation.length - 1; i >= 0; i--) {
      final char = _calculation.equation[i];
      if (mathOperators.contains(char)) {
        /// Encontrou um operador matemático, para a iteração.
        ///
        /// Found an mathematical operator, for iteration
        break;
      }
      lastNumber = char + lastNumber;
    }

    return lastNumber;
  }

  /// Normaliza a equação substituindo símbolos por seus equivalentes matemáticos.
  /// Substitui o símbolo `÷` por seu equivalentes matemático `/`.
  /// Substitui o símbolo `×` por seu equivalentes matemático `*`.
  /// Substitui o símbolo `,` por seu equivalentes matemático  `.`.
  ///
  /// Normalizes the equation by replacing symbols with their mathematical equivalents.
  /// Replaces the symbol `÷` with its mathematical equivalent `/`.
  /// Replaces the symbol `×` with its mathematical equivalent `*`.
  /// Replaces the symbol `,` with its mathematical equivalent `.`.
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

  /// Retorna o último operador matemático encontrado na equação.
  ///
  /// Returns the last mathematical operator in the equation.
  String _getMathLastOperator(String equation) {
    /// Define os operadores matemáticos possíveis.
    ///
    /// Defines the possible mathematical operators.
    final mathOperatorPattern = RegExp(r'[+\-*/]');

    /// Encontra todos os operadores matemáticos na equação.
    ///
    /// Finds all mathematical operators in the equation.
    final matches = mathOperatorPattern.allMatches(equation);

    /// Retorna o último operador matemático encontrado
    ///
    /// Returns the last mathematical operator found.
    return matches.isNotEmpty ? matches.last.group(0)! : '';
  }

  /// Extrai a equação antes do último operador matemático.
  ///
  /// Extracts the equation before the last mathematical operator.
  String _extractEquationBeforeLastMathOperator(String equation) {
    /// Encontra a última ocorrência de um operador matemático.
    ///
    /// Finds the last occurrence of a mathematical operator.
    RegExp regex = RegExp(r'[\+\-\*/%](?=[^+\-*/%]*$)');
    Match? match = regex.firstMatch(equation);

    if (match != null) {
      return equation.substring(0, match.end - 1);
    }

    return equation;
  }

  /// Converte um valor percentual para seu equivalente decimal.
  ///
  /// Converts a percentage value to its decimal equivalent.
  String _convertPercentageToDecimal(String equation) => _removeTrailingZeros(
      ((double.tryParse(equation) ?? 0.0) / 100).toStringAsPrecision(9));

  /// Remove zeros à direita de uma string numérica.
  ///
  /// Removes trailing zeros from a numeric string.
  String _removeTrailingZeros(String value) =>
      value.replaceAll(RegExp(r'([.]*0+)$'), '');

  /// Substitui o último operador matemático na equação por um novo.
  ///
  /// Replaces the last mathematical operator in the equation with a new one.
  void _replaceLastMathOperator(String mathOperator) {
    _calculation
      ..updateProperties(
          property: CalculationProperty.equation, removeLast: true)
      ..updateProperties(
        property: CalculationProperty.equation,
        value: mathOperator,
      );
  }

  /// Gerencia a adição de um operador matemático quando a equação está vazia.
  ///
  /// Handles adding an mathematical operator when the equation is empty.
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

  ///Gerencia a lógica para adicionar "00" à equação.
  ///
  /// Handles the logic for adding "00" to the equation.
  void _handleDoubleZeroInput() {
    /// Se a equação for igual a `0` ou
    /// Se o último número depois do operador matemático for igual a `0`
    /// Então não permite `00` para não tornar a equação inválida.
    ///
    /// If the equation is equal to `0` or
    /// If the last number after the mathematical operator is equal to `0`
    /// So don't allow `00` to avoid making the equation invalid.
    if (_calculation.equation == CalculatorButtonSymbol.zero.label ||
        _getLastNumber() == CalculatorButtonSymbol.zero.label) return;

    /// Se a equação estiver vazia, ou
    /// Se o último caractere for um operador matemático,
    /// adiciona `0` em vez de `00`
    ///
    /// If the equation is empty, or
    /// If the last character is a mathematical operator,
    /// add `0` instead of `00`
    if (_calculation.equation.isEmpty ||
        _isMathOperator(_getLastCharOperation())) {
      _calculation.updateProperties(
        property: CalculationProperty.equation,
        value: CalculatorButtonSymbol.zero.label,
      );
      return;
    }

    /// Se não atender nenhuma condição, entao pode adicionar `00`.
    ///
    /// If no conditions are met, then you can add `00`.
    _calculation.updateProperties(
      property: CalculationProperty.equation,
      value: CalculatorButtonSymbol.doubleZero.label,
    );
  }

  /// Gerencia a lógica para adicionar um único número à equação.
  ///
  /// Handles the logic for adding a single number to the equation.
  void _handleSingleNumberInput(String number) {
    /// Se a equação for igual a `0`
    /// substitui `0` e inicia equação com o número pressionado
    ///
    /// If the equation is equal to `0`
    /// replaces `0` and starts equation with the number pressed
    if (_calculation.equation == CalculatorButtonSymbol.zero.label) {
      _calculation.updateProperties(
        property: CalculationProperty.equation,
        value: number,
      );
      return;
    }

    /// Se o último número depois do operador matemático for `0`
    /// substitui pelo número pressionado
    ///
    /// If the last number after the mathematical operator is `0`
    /// replaces with the number pressed
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

    /// Se não atender nenhuma regra
    /// adiciona o número pressionado a equação matemática
    ///
    /// If you don't meet any rules
    /// adds the pressed number to the mathematical equation
    _calculation.updateProperties(
      property: CalculationProperty.equation,
      value: number,
    );
  }
}
