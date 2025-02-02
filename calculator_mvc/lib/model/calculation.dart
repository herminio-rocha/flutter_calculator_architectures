import 'package:calculator_mvc/model/calculation_property.dart';

class Calculation {
  String _equationString;
  double _equationValue;
  String _resultString;
  double _resultValue;

  Calculation()
      : _equationString = "",
        _equationValue = 0.0,
        _resultString = "",
        _resultValue = 0.0;

  String get equationString => _equationString;
  double get equationValue => _equationValue;
  String get resultString => _resultString;
  double get resultValue => _resultValue;

  /// Reseta todos os valores da instância de `Calculation` para seus valores iniciais.
  void reset() {
    _equationString = "";
    _equationValue = 0.0;
    _resultString = "0";
    _resultValue = 0.0;
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
      case CalculationProperty.equationString:

        /// Remove o último caracter
        /// caso equationString não seja vazia
        /// e removeLast = true
        if (removeLast && equationString.isNotEmpty) {
          _equationString =
              equationString.substring(0, equationString.length - 1);
        }

        /// Acrescenta um valor a equationString
        if (value is String) {
          _equationString += value;
        }
        return;
      case CalculationProperty.equationValue:
        // TODO: Handle this case.
        break;
      case CalculationProperty.resultString:
        // TODO: Handle this case.
        break;
      case CalculationProperty.resultValue:
        // TODO: Handle this case.
        break;
    }
  }
}
