import 'package:calculator_mvc/controller/calculator_controller.dart';
import 'package:calculator_mvc/model/calculator_button_config_repository.dart';
import 'package:calculator_mvc/model/calculator_model.dart';
import 'package:calculator_mvc/view/widgets/ios_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/ios_calculator_button.dart';

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
                                textAlign: TextAlign.end,
                                style: iosTextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.13,
                                ),
                              ),
                            ),
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
                      style: iosTextStyle(
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
                ...CalculatorButtonConfigRepository.buttons.map(
                  (buttonConfig) => IosCalculatorButton(
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
