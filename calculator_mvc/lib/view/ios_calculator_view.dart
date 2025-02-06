import 'package:calculator_mvc/controller/calculator_controller.dart';
import 'package:calculator_mvc/model/calculator_button_config_repository.dart';
import 'package:calculator_mvc/model/calculator_model.dart';
import 'package:calculator_mvc/view/widgets/ios_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/ios_calculator_button.dart';

/// Representa a interface do usuário da calculadora no Sistema IOS.
///
/// AndroidCalculatorView represents the UI for the calculator on IOS System.
class IosCalculatorView extends StatefulWidget {
  const IosCalculatorView({super.key});

  @override
  State<IosCalculatorView> createState() => _IosCalculatorViewState();
}

class _IosCalculatorViewState extends State<IosCalculatorView> {
  final CalculatorModel _calculatorModel = CalculatorModel();
  late final CalculatorController _calculatorController;

  @override
  void initState() {
    _calculatorModel.addListener(_updateUI);
    _calculatorController = CalculatorController(_calculatorModel);

    super.initState();
  }

  @override
  void dispose() {
    _calculatorModel.removeListener(_updateUI);
    super.dispose();
  }

  void _updateUI() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return CupertinoPageScaffold(
      backgroundColor: Colors.grey[850],
      child: Column(
        children: [
          _buildDisplay(screenWidth),
          _buildKeypad(screenWidth, screenHeight),
        ],
      ),
    );
  }

  /// Constrói a seção do visor da calculadora.
  ///
  /// Builds the calculator display section.
  Widget _buildDisplay(double screenWidth) {
    return Expanded(
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
                          _calculatorController.equation,
                          textAlign: TextAlign.end,
                          style: iosTextStyle(
                            fontSize: _calculatorController.showResult
                                ? MediaQuery.of(context).size.width * 0.07
                                : MediaQuery.of(context).size.width * 0.13,
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
                _calculatorController.result,
                style: iosTextStyle(
                  fontSize: _calculatorController.showResult
                      ? MediaQuery.of(context).size.width * 0.13
                      : MediaQuery.of(context).size.width * 0.07,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Constrói o teclado da calculadora com botões.
  ///
  /// Builds the calculator keypad with buttons.
  Widget _buildKeypad(double screenWidth, double screenHeight) {
    return Expanded(
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
        children: CalculatorButtonConfigRepository.buttons
            .map(
              (buttonConfig) => IosCalculatorButton(
                buttonConfig: buttonConfig,
                calculatorController: _calculatorController,
              ),
            )
            .toList(),
      ),
    );
  }
}
