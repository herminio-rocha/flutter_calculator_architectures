import 'package:calculator_mvc/controller/calculator_controller.dart';
import 'package:calculator_mvc/model/calculator_button_config.dart';
import 'package:calculator_mvc/view/widgets/android_text_style.dart';
import 'package:flutter/material.dart';

/// UI de um botão estilizado da calculadora para sistema Android.
///
/// UI of a styled calculator button for Android system.
class AndroidCalculatorButton extends StatelessWidget {
  final CalculatorButtonConfig buttonConfig;
  final CalculatorController calculatorController;

  const AndroidCalculatorButton({
    super.key,
    required this.buttonConfig,
    required this.calculatorController,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => buttonConfig.onPressed(calculatorController),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonConfig.backgroundColor,
        foregroundColor: buttonConfig.textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            color: buttonConfig.borderColor,
            width: 2,
          ),
        ),
        elevation: 16,
        shadowColor: Colors.black,
      ),
      child: Row(
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                buttonConfig.label,
                style: androidTextStyle(
                  color: buttonConfig.textColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
