import 'package:calculator_mvi/src/data/bloc/calculator/calculator_bloc.dart';
import 'package:calculator_mvi/src/data/bloc/calculator/calculator_event.dart';
import 'package:calculator_mvi/src/data/bloc/calculator/calculator_state.dart';
import 'package:calculator_mvi/src/data/model/calculation.dart';
import 'package:calculator_mvi/src/data/repository/calculator_button_config_repository.dart';
import 'package:calculator_mvi/src/widgets/ios_calculator_button.dart';
import 'package:calculator_mvi/src/widgets/ios_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    return BlocProvider<CalculatorBloc>(
      lazy: false,
      create: (_) => CalculatorBloc(
        context.read<CalculatorButtonConfigRepository>(),
        context.read<Calculation>(),
      )..add(
          LoadCalculatorData(),
        ),
      child: CupertinoPageScaffold(
        backgroundColor: Colors.grey[850],
        child: Column(
          children: [
            BlocBuilder<CalculatorBloc, CalculatorState>(
              buildWhen: (previus, current) => current is CalculatorLabels,
              builder: (context, state) {
                if (state is CalculatorLabels) {
                  return _buildDisplay(
                    screenWidth,
                    BlocProvider.of<CalculatorBloc>(context),
                    state,
                  );
                }

                return const SizedBox.shrink();
              },
            ),
            BlocBuilder<CalculatorBloc, CalculatorState>(
              buildWhen: (previus, current) =>
                  current is CalculatorButtonsLoaded,
              builder: (context, state) {
                if (state is CalculatorButtonsLoaded) {
                  return _buildKeypad(
                    screenWidth,
                    screenHeight,
                    BlocProvider.of<CalculatorBloc>(context),
                    state,
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDisplay(
    double screenWidth,
    CalculatorBloc calculatorBloc,
    CalculatorLabels state,
  ) {
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
                          state.equation,
                          textAlign: TextAlign.end,
                          style: iosTextStyle(
                            fontSize: state.showResult
                                ? screenWidth * 0.07
                                : screenWidth * 0.13,
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
                state.result,
                style: iosTextStyle(
                  fontSize: state.showResult
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
    double screenWidth,
    double screenHeight,
    CalculatorBloc calculatorBloc,
    CalculatorButtonsLoaded state,
  ) {
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
        children: state.buttons
            .map(
              (buttonConfig) => IosCalculatorButton(
                buttonConfig: buttonConfig,
                calculatorBloc: calculatorBloc,
              ),
            )
            .toList(),
      ),
    );
  }
}
