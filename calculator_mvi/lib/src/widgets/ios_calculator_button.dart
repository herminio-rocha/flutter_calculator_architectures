import 'package:calculator_mvi/src/data/bloc/calculator/calculator_bloc.dart';
import 'package:calculator_mvi/src/data/model/calculator_button_config.dart';
import 'package:calculator_mvi/src/widgets/ios_text_style.dart';
import 'package:flutter/cupertino.dart';

class IosCalculatorButton extends StatelessWidget {
  final CalculatorButtonConfig buttonConfig;
  final CalculatorBloc calculatorBloc;

  const IosCalculatorButton({
    super.key,
    required this.buttonConfig,
    required this.calculatorBloc,
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
          onPressed: () => buttonConfig.onPressed(calculatorBloc),
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
