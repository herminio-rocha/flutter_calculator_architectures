import 'package:calculator_mvvm/model/calculator_button_config.dart';
import 'package:calculator_mvvm/view/widgets/android_text_style.dart';
import 'package:calculator_mvvm/viewmodel/calculator_viewmodel.dart';
import 'package:flutter/material.dart';

class AndroidCalculatorButton extends StatelessWidget {
  final CalculatorButtonConfig buttonConfig;
  final CalculatorViewModel calculatorViewModel;

  const AndroidCalculatorButton({
    super.key,
    required this.buttonConfig,
    required this.calculatorViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => buttonConfig.onPressed(calculatorViewModel),
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
