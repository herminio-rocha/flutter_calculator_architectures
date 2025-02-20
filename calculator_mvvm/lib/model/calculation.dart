import 'package:calculator_mvvm/model/calculation_property.dart';
import 'package:calculator_mvvm/model/calculator_button_symbol.dart';

/// Gerencia o estado do cálculo, armazenando a equação e o resultado.
///
/// Manages the calculation state, storing the equation and result.
class Calculation {
  /// Armazena a equação.
  ///
  /// Stores the equation.
  String _equation;

  /// Armazena o resultado da equaçao.
  ///
  /// Stores the result of the equation.
  String _result;

  Calculation()
      : _equation = "",
        _result = "0";

  /// Getters Methods
  ///
  String get equation => _equation;
  String get result => _result;

  /// Reseta todos os valores da instância de `Calculation` para seus estados iniciais.
  ///
  /// Resets all values of the `Calculation` instance to their initial states.
  void reset() {
    _equation = "";
    _result = "0";
  }

  /// Atualiza uma propriedade específica da [Calculation], garantindo segurança de tipos.
  /// - `property`: Qual propriedade será alterada.
  /// - `value`: O novo valor a ser atribuído (String ou double).
  /// - `removeLast`: Se verdadeiro, remove o último caractere (apenas para Strings).
  ///
  /// Updates a specific property of [Calculation], ensuring type safety.
  /// - `property`: Which property to modify.
  /// - `value`: The new value to be assigned (String or double).
  /// - `removeLast`: If true, removes the last character (only for Strings).
  void updateProperties<T extends Object>({
    required CalculationProperty property,
    T? value,
    bool removeLast = false,
  }) {
    switch (property) {
      case CalculationProperty.equation:
        if (removeLast && _equation.isNotEmpty) {
          _equation = _equation.substring(0, _equation.length - 1);

          if (equation.isEmpty) {
            updateProperties(
              property: CalculationProperty.result,
              value: CalculatorButtonSymbol.zero.label,
            );
          }
        }

        if (value is String) {
          _equation += value;
        }

        _updateLabelDecimalSeparatorForShowInDisplay(property);

        return;
      case CalculationProperty.result:
        if (value is String) {
          _result = value;
        }

        _updateLabelDecimalSeparatorForShowInDisplay(property);

        return;
    }
  }

  void _updateLabelDecimalSeparatorForShowInDisplay(
      CalculationProperty property) {
    property == CalculationProperty.equation
        ? _equation = _equation.replaceAll(
            CalculatorButtonSymbol.decimalSeparatorOperator.label,
            CalculatorButtonSymbol.decimalSeparator.label,
          )
        : _result = _result.replaceAll(
            CalculatorButtonSymbol.decimalSeparatorOperator.label,
            CalculatorButtonSymbol.decimalSeparator.label,
          );
  }
}
