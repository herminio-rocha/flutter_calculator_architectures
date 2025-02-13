import 'package:calculator_mvc/controller/calculator_controller.dart';
import 'package:calculator_mvc/model/calculator_model.dart';
import 'package:calculator_mvc/view/widgets/android_text_style.dart';
import 'package:flutter/material.dart';

import 'widgets/android_calculator_button.dart';

/// Representa a interface do usuário da calculadora no Sistema Android.
///
/// AndroidCalculatorView represents the UI for the calculator on Android System.
class AndroidCalculatorView extends StatefulWidget {
  const AndroidCalculatorView({super.key});

  @override
  State<AndroidCalculatorView> createState() => _AndroidCalculatorViewState();
}

class _AndroidCalculatorViewState extends State<AndroidCalculatorView> {
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

    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Column(
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
                          style: androidTextStyle(
                            fontSize: _calculatorController.showResult
                                ? screenWidth * 0.07
                                : screenWidth * 0.13,
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
                _calculatorController.result,
                style: androidTextStyle(
                  fontSize: _calculatorController.showResult
                      ? screenWidth * 0.13
                      : screenWidth * 0.07,
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
          screenWidth * 0.03,
          screenHeight * 0.03,
          screenWidth * 0.03,
          screenHeight * 0.03,
        ),
        crossAxisSpacing: screenWidth * 0.025,
        mainAxisSpacing: screenHeight * 0.025,
        crossAxisCount: 4,
        clipBehavior: Clip.hardEdge,
        children: _calculatorController.buttons
            .map(
              (buttonConfig) => AndroidCalculatorButton(
                buttonConfig: buttonConfig,
                calculatorController: _calculatorController,
              ),
            )
            .toList(),
      ),
    );
  }
}
