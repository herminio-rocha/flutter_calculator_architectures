sealed class CalculatorEvent {}

class LoadCalculatorData extends CalculatorEvent {}

class ButtonPress extends CalculatorEvent {
  final CalculatorButtonAction action;
  ButtonPress(this.action);
}

//------------------------------------------------------//
sealed class CalculatorButtonAction extends CalculatorEvent {}

class ClearAction extends CalculatorButtonAction {}

class BackspaceAction extends CalculatorButtonAction {}

class PercentAction extends CalculatorButtonAction {}

class DivideAction extends CalculatorButtonAction {}

class InputNumberAction extends CalculatorButtonAction {
  String number;
  InputNumberAction(this.number);
}

class MultiplyAction extends CalculatorButtonAction {}

class SubtractAction extends CalculatorButtonAction {}

class AddAction extends CalculatorButtonAction {}

class DecimalSeparatorAction extends CalculatorButtonAction {}

class CalculateAction extends CalculatorButtonAction {}
