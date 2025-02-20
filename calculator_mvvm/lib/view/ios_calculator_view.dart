import 'package:calculator_mvvm/view/widgets/ios_text_style.dart';
import 'package:calculator_mvvm/viewmodel/calculator_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/ios_calculator_button.dart';

class IosCalculatorView extends StatefulWidget {
  const IosCalculatorView({super.key});

  @override
  State<IosCalculatorView> createState() => _IosCalculatorViewState();
}

class _IosCalculatorViewState extends State<IosCalculatorView> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Consumer<CalculatorViewModel>(
      builder: (context, viewModel, child) {
        return CupertinoPageScaffold(
          backgroundColor: Colors.grey[850],
          child: Column(
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
                          textAlign: TextAlign.end,
                          style: iosTextStyle(
                            fontSize: viewModel.showResult
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
                viewModel.result,
                style: iosTextStyle(
                  fontSize: viewModel.showResult
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

  Widget _buildKeypad(
      double screenWidth, double screenHeight, CalculatorViewModel viewModel) {
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
        children: viewModel.buttons
            .map(
              (buttonConfig) => IosCalculatorButton(
                buttonConfig: buttonConfig,
                calculatorViewModel: viewModel,
              ),
            )
            .toList(),
      ),
    );
  }
}
