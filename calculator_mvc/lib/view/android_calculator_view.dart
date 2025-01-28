import 'package:calculator_mvc/view/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

class AndroidCalculatorView extends StatefulWidget {
  const AndroidCalculatorView({super.key});

  @override
  State<AndroidCalculatorView> createState() => _AndroidCalculatorViewState();
}

class _AndroidCalculatorViewState extends State<AndroidCalculatorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Column(
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
                MediaQuery.of(context).size.width * 0.025,
                MediaQuery.of(context).size.height * 0.03,
                MediaQuery.of(context).size.width * 0.025,
                MediaQuery.of(context).size.height * 0.03,
              ),
              crossAxisSpacing: MediaQuery.of(context).size.width * 0.025,
              mainAxisSpacing: MediaQuery.of(context).size.height * 0.025,
              crossAxisCount: 4,
              children: [
                ...[
                  "c",
                  "⌫",
                  "%",
                  "÷",
                  "7",
                  "8",
                  "9",
                  "x",
                  "4",
                  "5",
                  "6",
                  "-",
                  "1",
                  "2",
                  "3",
                  "+",
                  "00",
                  "0",
                  ".",
                  "="
                ].map(
                  (label) => CalculatorButton(label: label),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
