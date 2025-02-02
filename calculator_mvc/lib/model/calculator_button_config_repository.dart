import 'package:calculator_mvc/model/calculator_button_category.dart';
import 'package:calculator_mvc/model/calculator_button_config.dart';
import 'package:calculator_mvc/model/calculator_button_symbol.dart';

class CalculatorButtonConfigRepository {
  static List<CalculatorButtonConfig> buttons = [
    CalculatorButtonConfig(
      CalculatorButtonSymbol.clear.label,
      CalculatorButtonCategory.function,
      (calculatorController) => calculatorController.clear(),
    ),
    CalculatorButtonConfig(
      CalculatorButtonSymbol.backspace.label,
      CalculatorButtonCategory.function,
      (calculatorController) => calculatorController.backspace(),
    ),
    CalculatorButtonConfig(
      CalculatorButtonSymbol.percent.label,
      CalculatorButtonCategory.operation,
      (calculatorController) => calculatorController.percent(),
    ),
    CalculatorButtonConfig(
      CalculatorButtonSymbol.divide.label,
      CalculatorButtonCategory.operation,
      (calculatorController) => calculatorController.divide(),
    ),
    CalculatorButtonConfig(
      CalculatorButtonSymbol.seven.label,
      CalculatorButtonCategory.number,
      (calculatorController) => calculatorController.inputNumber(
        CalculatorButtonSymbol.seven.label,
      ),
    ),
    CalculatorButtonConfig(
      CalculatorButtonSymbol.eight.label,
      CalculatorButtonCategory.number,
      (calculatorController) => calculatorController.inputNumber(
        CalculatorButtonSymbol.eight.label,
      ),
    ),
    CalculatorButtonConfig(
      CalculatorButtonSymbol.nine.label,
      CalculatorButtonCategory.number,
      (calculatorController) => calculatorController.inputNumber(
        CalculatorButtonSymbol.nine.label,
      ),
    ),
    CalculatorButtonConfig(
      CalculatorButtonSymbol.multiply.label,
      CalculatorButtonCategory.operation,
      (calculatorController) => calculatorController.multiply(),
    ),
    CalculatorButtonConfig(
      CalculatorButtonSymbol.four.label,
      CalculatorButtonCategory.number,
      (calculatorController) => calculatorController.inputNumber(
        CalculatorButtonSymbol.four.label,
      ),
    ),
    CalculatorButtonConfig(
      CalculatorButtonSymbol.five.label,
      CalculatorButtonCategory.number,
      (calculatorController) => calculatorController.inputNumber(
        CalculatorButtonSymbol.five.label,
      ),
    ),
    CalculatorButtonConfig(
      CalculatorButtonSymbol.six.label,
      CalculatorButtonCategory.number,
      (calculatorController) => calculatorController.inputNumber(
        CalculatorButtonSymbol.six.label,
      ),
    ),
    CalculatorButtonConfig(
      CalculatorButtonSymbol.subtract.label,
      CalculatorButtonCategory.operation,
      (calculatorController) => calculatorController.subtract(),
    ),
    CalculatorButtonConfig(
      CalculatorButtonSymbol.one.label,
      CalculatorButtonCategory.number,
      (calculatorController) => calculatorController.inputNumber(
        CalculatorButtonSymbol.one.label,
      ),
    ),
    CalculatorButtonConfig(
      CalculatorButtonSymbol.two.label,
      CalculatorButtonCategory.number,
      (calculatorController) => calculatorController.inputNumber(
        CalculatorButtonSymbol.two.label,
      ),
    ),
    CalculatorButtonConfig(
      CalculatorButtonSymbol.three.label,
      CalculatorButtonCategory.number,
      (calculatorController) => calculatorController.inputNumber(
        CalculatorButtonSymbol.three.label,
      ),
    ),
    CalculatorButtonConfig(
      CalculatorButtonSymbol.add.label,
      CalculatorButtonCategory.operation,
      (calculatorController) => calculatorController.add(),
    ),
    CalculatorButtonConfig(
      CalculatorButtonSymbol.doubleZero.label,
      CalculatorButtonCategory.number,
      (calculatorController) => calculatorController.inputNumber(
        CalculatorButtonSymbol.doubleZero.label,
      ),
    ),
    CalculatorButtonConfig(
      CalculatorButtonSymbol.zero.label,
      CalculatorButtonCategory.number,
      (calculatorController) => calculatorController.inputNumber(
        CalculatorButtonSymbol.zero.label,
      ),
    ),
    CalculatorButtonConfig(
      CalculatorButtonSymbol.decimalSeparator.label,
      CalculatorButtonCategory.number,
      (calculatorController) => calculatorController.decimalSeparator(),
    ),
    CalculatorButtonConfig(
      CalculatorButtonSymbol.calculate.label,
      CalculatorButtonCategory.result,
      (calculatorController) => calculatorController.calculate(),
    ),
  ];
}
