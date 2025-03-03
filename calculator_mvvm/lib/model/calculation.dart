import 'package:calculator_mvvm/model/calculation_property.dart';
import 'package:calculator_mvvm/model/calculator_button_symbol.dart';

class Calculation {
  String _equation;

  String _result;

  Calculation()
      : _equation = "",
        _result = "0";

  String get equation => _equation;
  String get result => _result;

  void reset() {
    _equation = "";
    _result = "0";
  }

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
