import 'package:calculator_mvi/src/data/bloc/calculator/calculator_bloc.dart';
import 'package:calculator_mvi/src/data/model/calculator_button_config.dart';
import 'package:calculator_mvi/src/widgets/android_text_style.dart';
import 'package:flutter/material.dart';

/// UI de um botão estilizado da calculadora para sistema Android.
///
/// UI of a styled calculator button for Android system.
class AndroidCalculatorButton extends StatelessWidget {
  final CalculatorButtonConfig buttonConfig;
  final CalculatorBloc calculatorBloc;

  const AndroidCalculatorButton({
    super.key,
    required this.buttonConfig,
    required this.calculatorBloc,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => buttonConfig.onPressed(calculatorBloc),
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
