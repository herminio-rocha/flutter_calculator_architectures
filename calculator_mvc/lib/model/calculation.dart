import 'package:calculator_mvc/model/calculation_property.dart';
import 'package:calculator_mvc/model/calculator_button_symbol.dart';

class Calculation {
  String _equation;
  String _result;

  Calculation()
      : _equation = "",
        _result = "0";

  String get equation => _equation;
  String get result => _result;

  /// Reseta todos os valores da instância de `Calculation` para seus valores iniciais.
  void reset() {
    _equation = "";
    _result = "0";
  }

  /// Atualiza uma propriedade específica da `Calculation`, garantindo segurança de tipos.
  ///
  /// - `property`: Qual propriedade será alterada.
  /// - `value`: O novo valor a ser atribuído (String ou double).
  /// - `removeLast`: Se verdadeiro, remove o último caractere (apenas para Strings).
  ///
  void updateProperts<T extends Object>({
    required CalculationProperty property,
    T? value,
    bool removeLast = false,
  }) {
    switch (property) {
      case CalculationProperty.equation:

        /// Remove o último caracter
        /// caso equationString não seja vazia
        /// e removeLast = true
        if (removeLast && _equation.isNotEmpty) {
          _equation = _equation.substring(0, _equation.length - 1);

          if (equation.isEmpty) {
            updateProperts(
              property: CalculationProperty.result,
              value: CalculatorButtonSymbol.zero.label,
            );
          }
        }

        /// Acrescenta um valor a equationString
        if (value is String) {
          //_handleInput(equation, value);
          _equation += value;
        }
        return;
      case CalculationProperty.result:
        if (value is String) {
          _result = value;
        }

        return;
    }
  }

  String _handleInput(String currentExpression, String newInput) {
    // Define os operadores matemáticos possíveis
    final operatorPattern = RegExp(r'[+\-*/÷×]');
    print(operatorPattern.hasMatch(newInput));

    // Se o novo input for um operador, apenas o adiciona
    if (operatorPattern.hasMatch(newInput)) {
      return currentExpression + newInput;
    }

    // Verifica o número atual na expressão
    List<String> parts = currentExpression.split(operatorPattern);

    // Verifica o último número (parte da expressão depois do último operador)
    String lastNumber = parts.isNotEmpty ? parts.last : '';

    // Se o último número tiver 9 caracteres, não permite adicionar mais dígitos
    if (lastNumber.length >= 9) {
      return currentExpression; // Retorna a expressão atual sem adicionar o novo número
    }

    // Se não atingiu o limite, permite adicionar o número
    return currentExpression + newInput;
  }
}
