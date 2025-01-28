import 'dart:io';

import 'package:calculator_mvc/utils/button_config.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final ButtonConfig buttonConfig;

  const CalculatorButton({super.key, required this.buttonConfig});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor:
            buttonConfig.backgroundColor, //colorButton ?? Colors.grey[850]!,
        foregroundColor: buttonConfig.textColor,
        shape: Platform.isAndroid
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(
                  color: buttonConfig.borderColor,
                  width: 2,
                ),
              )
            : CircleBorder(
                side: BorderSide(
                  color: buttonConfig.borderColor,
                  width: 2,
                ),
              ),
        elevation: Platform.isAndroid ? 16 : 0,
        shadowColor: Colors.black,
      ),
      child: Row(
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                buttonConfig.label,
                style: const TextStyle(
                  fontSize: 50,
                  fontFamily: "Courier New",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
