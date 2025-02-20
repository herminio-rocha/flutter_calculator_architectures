import 'package:calculator_mvvm/view/widgets/android_calculator_button.dart';
import 'package:calculator_mvvm/view/widgets/android_text_style.dart';
import 'package:calculator_mvvm/viewmodel/calculator_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AndroidCalculatorView extends StatefulWidget {
  const AndroidCalculatorView({super.key});

  @override
  State<AndroidCalculatorView> createState() => _AndroidCalculatorViewState();
}

class _AndroidCalculatorViewState extends State<AndroidCalculatorView> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Consumer<CalculatorViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.grey[850],
          body: Column(
            children: [
              _buildDisplay(screenWidth, viewModel),
              _buildKeypad(screenWidth, screenHeight, viewModel),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDisplay(double screenWidth, CalculatorViewModel viewModel) {
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
                          viewModel.equation,
                          style: androidTextStyle(
                            fontSize: viewModel.showResult
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
                viewModel.result,
                style: androidTextStyle(
                  fontSize: viewModel.showResult
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

  Widget _buildKeypad(
      double screenWidth, double screenHeight, CalculatorViewModel viewModel) {
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
        children: viewModel.buttons
            .map(
              (buttonConfig) => AndroidCalculatorButton(
                buttonConfig: buttonConfig,
                calculatorViewModel: viewModel,
              ),
            )
            .toList(),
      ),
    );
  }
}
