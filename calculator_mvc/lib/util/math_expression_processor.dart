import 'package:math_expressions/math_expressions.dart';

class MathExpressionProcessor {
  /// Avalia uma expressão matemática em String e retorna o resultado como String.
  ///
  /// A função calcula o resultado usando a função `_evaluateExpression`.
  static String solveExpression(String expression) => _evaluateExpression(
        expression,
      ).toStringAsPrecision(9);

  /// Avalia uma expressão matemática representada como `String` e retorna o resultado como `double`.
  static double _evaluateExpression(String expression) =>
      Parser().parse(expression).evaluate(
            EvaluationType.REAL,
            ContextModel(),
          );
}
