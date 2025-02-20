import 'package:calculator_mvvm/model/calculator_button_category.dart';
import 'package:calculator_mvvm/model/calculator_button_config.dart';
import 'package:calculator_mvvm/model/calculator_button_symbol.dart';

/// Repositório que define a configuração para todos os botões da calculadora.
///
/// Repository that defines the configuration for all calculator buttons.
class CalculatorButtonConfigRepository {
  /// Método que retorna lista de configurações de botões, associando símbolos, categorias e ações.
  ///
  /// Method that returns list of button configurations, associating symbols, categories, and actions.
  List<CalculatorButtonConfig> getButtons() => [
        CalculatorButtonConfig(
          CalculatorButtonSymbol.clear.label,
          CalculatorButtonCategory.function,
          (calculatorViewModel) => calculatorViewModel.clear(),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.backspace.label,
          CalculatorButtonCategory.function,
          (calculatorViewModel) => calculatorViewModel.backspace(),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.percent.label,
          CalculatorButtonCategory.operation,
          (calculatorViewModel) => calculatorViewModel.percent(),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.divide.label,
          CalculatorButtonCategory.operation,
          (calculatorViewModel) => calculatorViewModel.divide(),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.seven.label,
          CalculatorButtonCategory.number,
          (calculatorViewModel) => calculatorViewModel.inputNumber(
            CalculatorButtonSymbol.seven.label,
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.eight.label,
          CalculatorButtonCategory.number,
          (calculatorViewModel) => calculatorViewModel.inputNumber(
            CalculatorButtonSymbol.eight.label,
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.nine.label,
          CalculatorButtonCategory.number,
          (calculatorViewModel) => calculatorViewModel.inputNumber(
            CalculatorButtonSymbol.nine.label,
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.multiply.label,
          CalculatorButtonCategory.operation,
          (calculatorViewModel) => calculatorViewModel.multiply(),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.four.label,
          CalculatorButtonCategory.number,
          (calculatorViewModel) => calculatorViewModel.inputNumber(
            CalculatorButtonSymbol.four.label,
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.five.label,
          CalculatorButtonCategory.number,
          (calculatorViewModel) => calculatorViewModel.inputNumber(
            CalculatorButtonSymbol.five.label,
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.six.label,
          CalculatorButtonCategory.number,
          (calculatorViewModel) => calculatorViewModel.inputNumber(
            CalculatorButtonSymbol.six.label,
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.subtract.label,
          CalculatorButtonCategory.operation,
          (calculatorViewModel) => calculatorViewModel.subtract(),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.one.label,
          CalculatorButtonCategory.number,
          (calculatorViewModel) => calculatorViewModel.inputNumber(
            CalculatorButtonSymbol.one.label,
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.two.label,
          CalculatorButtonCategory.number,
          (calculatorViewModel) => calculatorViewModel.inputNumber(
            CalculatorButtonSymbol.two.label,
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.three.label,
          CalculatorButtonCategory.number,
          (calculatorViewModel) => calculatorViewModel.inputNumber(
            CalculatorButtonSymbol.three.label,
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.add.label,
          CalculatorButtonCategory.operation,
          (calculatorViewModel) => calculatorViewModel.add(),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.doubleZero.label,
          CalculatorButtonCategory.number,
          (calculatorViewModel) => calculatorViewModel.inputNumber(
            CalculatorButtonSymbol.doubleZero.label,
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.zero.label,
          CalculatorButtonCategory.number,
          (calculatorViewModel) => calculatorViewModel.inputNumber(
            CalculatorButtonSymbol.zero.label,
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.decimalSeparator.label,
          CalculatorButtonCategory.number,
          (calculatorViewModel) => calculatorViewModel.decimalSeparator(),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.calculate.label,
          CalculatorButtonCategory.result,
          (calculatorViewModel) => calculatorViewModel.calculate(),
        ),
      ];
}
