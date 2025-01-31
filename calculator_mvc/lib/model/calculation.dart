class Calculation {
  String equationString;
  double equationValue;
  String resultString;
  double resultValue;

  Calculation({
    required this.equationString,
    required this.equationValue,
    required this.resultString,
    required this.resultValue,
  });

  void reset() {
    equationString = "";
    equationValue = 0.0;
    resultString = "0";
    resultValue = 0.0;
  }
}
