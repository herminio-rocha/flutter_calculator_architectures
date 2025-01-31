import 'package:calculator_mvc/controller/calculator_controller.dart';
import 'package:calculator_mvc/model/calculator_button_config.dart';
import 'package:calculator_mvc/view/widgets/ios_text_style.dart';
import 'package:flutter/cupertino.dart';

class IosCalculatorButton extends StatelessWidget {
  final CalculatorButtonConfig buttonConfig;
  final CalculatorController calculatorController;

  const IosCalculatorButton({
    super.key,
    required this.buttonConfig,
    required this.calculatorController,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100), // Borda arredondada
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: buttonConfig.backgroundColor, // Cor de fundo
          borderRadius: BorderRadius.circular(100), // Borda arredondada
          border: Border.all(
            color: buttonConfig.borderColor, // Cor da borda
            width: 2, // Espessura da borda
          ),
        ),
        child: CupertinoButton(
          onPressed: () => buttonConfig.onPressed(calculatorController),
          padding: EdgeInsets.zero,
          minSize: 70, // Tamanho mínimo do botão
          child: SizedBox(
            width: 70, // Largura fixa do botão
            height: 70, // Altura fixa do botão
            child: Center(
              child: Text(
                buttonConfig.label,
                style: iosTextStyle(
                  color: buttonConfig.textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
