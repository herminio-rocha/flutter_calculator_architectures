import 'package:calculator_mvc/controller/calculator_controller.dart';
import 'package:calculator_mvc/model/button_config_repository.dart';
import 'package:calculator_mvc/model/calculator_model.dart';
import 'package:calculator_mvc/view/widgets/calculator_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosCalculatorView extends StatefulWidget {
  const IosCalculatorView({super.key});

  @override
  State<IosCalculatorView> createState() => _IosCalculatorViewState();
}

class _IosCalculatorViewState extends State<IosCalculatorView> {
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
