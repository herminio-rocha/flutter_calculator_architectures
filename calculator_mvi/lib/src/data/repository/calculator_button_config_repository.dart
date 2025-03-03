import 'package:calculator_mvi/src/data/bloc/calculator/calculator_event.dart';
import 'package:calculator_mvi/src/data/model/calculator_button_category.dart';
import 'package:calculator_mvi/src/data/model/calculator_button_config.dart';
import 'package:calculator_mvi/src/data/model/calculator_button_symbol.dart';

class CalculatorButtonConfigRepository {
  List<CalculatorButtonConfig> getButtons() => [
        CalculatorButtonConfig(
          CalculatorButtonSymbol.clear.label,
          CalculatorButtonCategory.function,
          (bloc) => bloc.add(
            ButtonPress(
              ClearAction(),
            ),
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.backspace.label,
          CalculatorButtonCategory.function,
          (bloc) => bloc.add(
            ButtonPress(
              BackspaceAction(),
            ),
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.percent.label,
          CalculatorButtonCategory.operation,
          (bloc) => bloc.add(
            ButtonPress(
              PercentAction(),
            ),
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.divide.label,
          CalculatorButtonCategory.operation,
          (bloc) => bloc.add(
            ButtonPress(
              DivideAction(),
            ),
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.seven.label,
          CalculatorButtonCategory.number,
          (bloc) => bloc.add(
            ButtonPress(
              InputNumberAction(
                CalculatorButtonSymbol.seven.label,
              ),
            ),
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.eight.label,
          CalculatorButtonCategory.number,
          (bloc) => bloc.add(
            ButtonPress(
              InputNumberAction(
                CalculatorButtonSymbol.eight.label,
              ),
            ),
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.nine.label,
          CalculatorButtonCategory.number,
          (bloc) => bloc.add(
            ButtonPress(
              InputNumberAction(
                CalculatorButtonSymbol.nine.label,
              ),
            ),
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.multiply.label,
          CalculatorButtonCategory.operation,
          (bloc) => bloc.add(
            ButtonPress(
              MultiplyAction(),
            ),
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.four.label,
          CalculatorButtonCategory.number,
          (bloc) => bloc.add(
            ButtonPress(
              InputNumberAction(
                CalculatorButtonSymbol.four.label,
              ),
            ),
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.five.label,
          CalculatorButtonCategory.number,
          (bloc) => bloc.add(
            ButtonPress(
              InputNumberAction(
                CalculatorButtonSymbol.five.label,
              ),
            ),
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.six.label,
          CalculatorButtonCategory.number,
          (bloc) => bloc.add(
            ButtonPress(
              InputNumberAction(
                CalculatorButtonSymbol.six.label,
              ),
            ),
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.subtract.label,
          CalculatorButtonCategory.operation,
          (bloc) => bloc.add(
            ButtonPress(
              SubtractAction(),
            ),
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.one.label,
          CalculatorButtonCategory.number,
          (bloc) => bloc.add(
            ButtonPress(
              InputNumberAction(
                CalculatorButtonSymbol.one.label,
              ),
            ),
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.two.label,
          CalculatorButtonCategory.number,
          (bloc) => bloc.add(
            ButtonPress(
              InputNumberAction(
                CalculatorButtonSymbol.two.label,
              ),
            ),
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.three.label,
          CalculatorButtonCategory.number,
          (bloc) => bloc.add(
            ButtonPress(
              InputNumberAction(
                CalculatorButtonSymbol.three.label,
              ),
            ),
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.add.label,
          CalculatorButtonCategory.operation,
          (bloc) => bloc.add(
            ButtonPress(
              AddAction(),
            ),
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.doubleZero.label,
          CalculatorButtonCategory.number,
          (bloc) => bloc.add(
            ButtonPress(
              InputNumberAction(
                CalculatorButtonSymbol.doubleZero.label,
              ),
            ),
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.zero.label,
          CalculatorButtonCategory.number,
          (bloc) => bloc.add(
            ButtonPress(
              InputNumberAction(
                CalculatorButtonSymbol.zero.label,
              ),
            ),
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.decimalSeparator.label,
          CalculatorButtonCategory.number,
          (bloc) => bloc.add(
            ButtonPress(
              DecimalSeparatorAction(),
            ),
          ),
        ),
        CalculatorButtonConfig(
          CalculatorButtonSymbol.calculate.label,
          CalculatorButtonCategory.result,
          (bloc) => bloc.add(
            ButtonPress(
              CalculateAction(),
            ),
          ),
        ),
      ];
}
