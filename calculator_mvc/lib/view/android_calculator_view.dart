import 'package:calculator_mvc/controller/calculator_controller.dart';
import 'package:calculator_mvc/model/button_config_repository.dart';
import 'package:calculator_mvc/model/calculator_model.dart';
import 'package:calculator_mvc/view/widgets/android_text_style.dart';
import 'package:flutter/material.dart';

import 'widgets/android_calculator_button.dart';

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
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SafeArea(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        reverse: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: Text(
                                _calculatorController.equationString,
                                style: androidTextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.13,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: Text(
                      _calculatorController.resultString,
                      style: androidTextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.07,
                      ),
                    ),
                  ),
                ],
              ),
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
              clipBehavior: Clip.hardEdge,
              children: [
                ...ButtonConfigRepository.buttons.map(
                  (buttonConfig) => AndroidCalculatorButton(
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
