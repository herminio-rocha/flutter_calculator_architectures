import 'package:math_expressions/math_expressions.dart';

/// Processa expressões matemáticas e avalia seus resultados.
///
/// Processes mathematical expressions and evaluates their results.
class MathEquationProcessor {
  /// Avalia uma expressão matemática em String e retorna o resultado como String.
  /// A função calcula o resultado usando a função `_evaluateExpression`.
  ///
  /// Evaluates a mathematical expression given as a string and returns the result as a string.
  /// The function computes the result using the `_evaluateEquation` method.
  static String solveEquation(String equation) => _evaluateEquation(
        equation,
      ).toStringAsPrecision(9);

  /// Avalia uma expressão matemática representada como `String` e retorna o resultado como `double`.
  ///
  /// Evaluates a mathematical expression represented as a `String` and returns the result as `double`.
  static double _evaluateEquation(String expression) =>
      Parser().parse(expression).evaluate(
            EvaluationType.REAL,
            ContextModel(),
          );
}
