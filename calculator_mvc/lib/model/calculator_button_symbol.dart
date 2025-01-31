enum CalculatorButtonSymbol {
  clear("c"),
  backspace("⌫"),
  percent("%"),
  divide("÷"),
  multiply("×"),
  subtract("-"),
  add("+"),
  zero("0"),
  one("1"),
  two("2"),
  three("3"),
  four("4"),
  five("5"),
  six("6"),
  seven("7"),
  eight("8"),
  nine("9"),
  doubleZerro("00"),
  decimalSeparator(","),
  calculate("=");

  final String label;
  const CalculatorButtonSymbol(this.label);
}
