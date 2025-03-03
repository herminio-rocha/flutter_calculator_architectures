import 'package:calculator_mvi/src/data/model/calculator_button_config.dart';

sealed class CalculatorState {}

class InitialState extends CalculatorState {}

class CalculatorButtonsLoaded extends CalculatorState {
  final List<CalculatorButtonConfig> buttons;

  CalculatorButtonsLoaded(this.buttons);
}

class CalculatorLabels extends CalculatorState {
  String equation;
  String result;
  bool showResult;

  CalculatorLabels(this.equation, this.result, this.showResult);
}
