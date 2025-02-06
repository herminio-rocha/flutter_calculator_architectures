import 'package:calculator_mvc/controller/calculator_controller.dart';
import 'package:calculator_mvc/model/calculator_button_config.dart';
import 'package:calculator_mvc/view/widgets/ios_text_style.dart';
import 'package:flutter/cupertino.dart';

/// UI de um botão estilizado da calculadora para sistema iOS.
///
/// UI of a styled calculator button for iOS system.
class IosCalculatorButton extends StatelessWidget {
  final CalculatorButtonConfig buttonConfig;
  final CalculatorController calculatorController;

  const IosCalculatorButton({
    super.key,
    required this.buttonConfig,
    required this.calculatorController,
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
          onPressed: () => buttonConfig.onPressed(calculatorController),
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
