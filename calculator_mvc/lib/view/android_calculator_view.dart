import 'package:calculator_mvc/controller/calculator_controller.dart';
import 'package:calculator_mvc/model/button_config_repository.dart';
import 'package:calculator_mvc/model/calculator_model.dart';
import 'package:calculator_mvc/view/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

class AndroidCalculatorView extends StatefulWidget {
  const AndroidCalculatorView({super.key});

  @override
  State<AndroidCalculatorView> createState() => _AndroidCalculatorViewState();
}

class _AndroidCalculatorViewState extends State<AndroidCalculatorView> {
  final CalculatorModel _calculatorModel = CalculatorModel();
  late CalculatorController _calculatorController;

  @override
  void initState() {
    _calculatorModel.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    _calculatorController = CalculatorController(_calculatorModel);
    super.initState();
  }

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
                MediaQuery.of(context).size.width * 0.03,
                MediaQuery.of(context).size.height * 0.03,
                MediaQuery.of(context).size.width * 0.03,
                MediaQuery.of(context).size.height * 0.03,
              ),
              crossAxisSpacing: MediaQuery.of(context).size.width * 0.025,
              mainAxisSpacing: MediaQuery.of(context).size.height * 0.025,
              crossAxisCount: 4,
              children: [
                ...ButtonConfigRepository.buttons.map(
                  (buttonConfig) => CalculatorButton(
                    buttonConfig: buttonConfig,
                    calculatorController: _calculatorController,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
