import 'package:calculator_mvc/model/calculator_button_config.dart';
import 'package:calculator_mvc/model/calculator_model.dart';
import 'package:calculator_mvc/repository/calculator_button_config_repository.dart';

/// Controlador responsável por gerenciar interações do usuário e
/// encaminhá-las ao [CalculatorModel].
///
/// Controller responsible for handling user interactions and
/// forwarding them to the [CalculatorModel].
class CalculatorController {
  /// Classe model que contém a lógica de negócios da calculadora.
  ///
  /// The model class that holds the business logic of the calculator.
  final CalculatorModel _calculatorModel;

  /// Classe que define a configuração para os botões da calculadora.
  ///
  /// Class hat defines the configuration for calculator buttons.
  final CalculatorButtonConfigRepository _buttonRepository =
      CalculatorButtonConfigRepository();

  /// Inicializa o controlador com o classe model fornecid.
  ///
  /// Initializes the controller with the given model class.
  CalculatorController(this._calculatorModel);

  /// Método que retorna lista de configurações de botões.
  ///
  /// Method that returns list of button configurations.
  List<CalculatorButtonConfig> get buttons => _buttonRepository.getButtons();

  /// Retorna a string da equação atual.
  ///
  /// Retrieves the current equation string.
  String get equation => _calculatorModel.equation;

  /// Retorna o resultado atual do cálculo.
  ///
  /// Retrieves the current calculation result.
  String get result => _calculatorModel.result;

  /// Indica se o resultado deve ser exibido.
  ///
  /// Indicates whether the result should be displayed.
  bool get showResult => _calculatorModel.showResult;

  /// Limpa a display da calculadora.
  ///
  /// Clears the calculator display.
  void clear() => _calculatorModel.clear();

  /// Apaga o último caractere da equação.
  ///
  /// Deletes the last character from the equation.
  void backspace() => _calculatorModel.backspace();

  /// Adiciona uma operação de porcentagem a equação.
  ///
  /// Adds percentage operation to the equation.
  void percent() => _calculatorModel.percent();

  /// Adiciona uma operação de divisão a equação.
  ///
  /// Adds division operation to the equation.
  void divide() => _calculatorModel.divide();

  /// Adiciona uma operação de multiplicação a equação.
  ///
  /// Adds multiplication operation to the equation.
  void multiply() => _calculatorModel.multiply();

  /// Adiciona uma operação de subtração a equação.
  ///
  /// Adds subtraction operation to the equation.
  void subtract() => _calculatorModel.subtract();

  /// Adiciona uma operação de adição a equação.
  ///
  /// Adds addition operation to the equation.
  void add() => _calculatorModel.add();

  /// Processa a entrada numérica.
  ///
  /// Handles numeric input.
  void inputNumber(String number) => _calculatorModel.inputNumber(number);

  /// Adiciona um separador decimal a equação.
  ///
  /// Adds a decimal separator to the equation.
  void decimalSeparator() => _calculatorModel.decimalSeparator();

  /// Calcula o resultado com base na equação atual.
  ///
  /// Calculates the result based on the current equation.
  void calculate() => _calculatorModel.calculate();
}
