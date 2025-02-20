import 'package:flutter/material.dart';

TextStyle androidTextStyle({
  String fontFamily = 'Roboto',
  double fontSize = 36,
  FontWeight fontWeight = FontWeight.w500,
  Color color = Colors.white,
  double letterSpacing = 0.5,
  double height = 1.2,
}) {
  return TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    letterSpacing: letterSpacing,
    height: height,
  );
}
