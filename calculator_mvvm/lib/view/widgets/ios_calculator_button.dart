import 'package:calculator_mvvm/model/calculator_button_config.dart';
import 'package:calculator_mvvm/view/widgets/ios_text_style.dart';
import 'package:calculator_mvvm/viewmodel/calculator_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class IosCalculatorButton extends StatelessWidget {
  final CalculatorButtonConfig buttonConfig;
  final CalculatorViewModel calculatorViewModel;

  const IosCalculatorButton({
    super.key,
    required this.buttonConfig,
    required this.calculatorViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: buttonConfig.backgroundColor,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: buttonConfig.borderColor,
            width: 2,
          ),
        ),
        child: CupertinoButton(
          onPressed: () => buttonConfig.onPressed(calculatorViewModel),
          padding: EdgeInsets.zero,
          minSize: 70,
          child: SizedBox(
            width: 70,
            height: 70,
            child: Center(
              child: Text(
                buttonConfig.label,
                style: iosTextStyle(
                  color: buttonConfig.textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
