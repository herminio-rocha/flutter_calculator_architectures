import 'package:math_expressions/math_expressions.dart';

class MathEquationProcessor {
  static String solveEquation(String equation) => _evaluateEquation(
        equation,
      ).toStringAsPrecision(9);

  static double _evaluateEquation(String expression) =>
      Parser().parse(expression).evaluate(
            EvaluationType.REAL,
            ContextModel(),
          );
}
