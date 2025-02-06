import 'package:flutter/material.dart';

/// Define o estilo de texto para os componentes da calculadora no sistema iOS.
///
/// Defines the text style for iOSS system calculator components.
TextStyle iosTextStyle({
  String fontFamily = '.SF Pro Text',
  double fontSize = 40,
  FontWeight fontWeight = FontWeight.w600,
  Color color = Colors.black,
  double letterSpacing = -0.5,
  double height = 1.1,
}) {
  return TextStyle(
    fontFamily: '.SF Pro Text',
    fontSize: fontSize,
    fontWeight: FontWeight.w600,
    color: color,
    letterSpacing: -0.5,
    height: 1.1,
  );
}
