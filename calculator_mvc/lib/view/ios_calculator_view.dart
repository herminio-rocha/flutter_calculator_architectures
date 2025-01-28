import 'package:calculator_mvc/utils/button_config.dart';
import 'package:calculator_mvc/view/widgets/calculator_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosCalculatorView extends StatefulWidget {
  const IosCalculatorView({super.key});

  @override
  State<IosCalculatorView> createState() => _IosCalculatorViewState();
}

class _IosCalculatorViewState extends State<IosCalculatorView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.grey[850],
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.amber,
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.count(
              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.03,
                MediaQuery.of(context).size.height * 0.03,
                MediaQuery.of(context).size.width * 0.03,
                MediaQuery.of(context).size.height * 0.03,
              ),
              crossAxisSpacing: MediaQuery.of(context).size.width * 0.025,
              mainAxisSpacing: MediaQuery.of(context).size.height * 0.025,
              crossAxisCount: 4,
              children: [
                ...[
                  ButtonConfig.clear,
                  ButtonConfig.backspace,
                  ButtonConfig.percent,
                  ButtonConfig.divide,
                  ButtonConfig.seven,
                  ButtonConfig.eight,
                  ButtonConfig.nine,
                  ButtonConfig.multiply,
                  ButtonConfig.four,
                  ButtonConfig.five,
                  ButtonConfig.six,
                  ButtonConfig.subtract,
                  ButtonConfig.one,
                  ButtonConfig.two,
                  ButtonConfig.three,
                  ButtonConfig.add,
                  ButtonConfig.doubleZero,
                  ButtonConfig.zero,
                  ButtonConfig.dot,
                  ButtonConfig.equal
                ].map(
                  (buttonConfig) =>
                      CalculatorButton(buttonConfig: buttonConfig),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
