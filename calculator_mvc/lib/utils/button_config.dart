import 'dart:io';
import 'package:flutter/material.dart';

// Enum para categorizar os tipos de botão
enum ButtonConfig {
  clear("c", ButtonCategory.function),
  backspace("⌫", ButtonCategory.function),
  percent("%", ButtonCategory.operation),
  divide("÷", ButtonCategory.operation),
  multiply("x", ButtonCategory.operation),
  subtract("-", ButtonCategory.operation),
  add("+", ButtonCategory.operation),
  nine("9", ButtonCategory.number),
  eight("8", ButtonCategory.number),
  seven("7", ButtonCategory.number),
  six("6", ButtonCategory.number),
  five("5", ButtonCategory.number),
  four("4", ButtonCategory.number),
  three("3", ButtonCategory.number),
  two("2", ButtonCategory.number),
  one("1", ButtonCategory.number),
  doubleZero("00", ButtonCategory.number),
  zero("0", ButtonCategory.number),
  dot(".", ButtonCategory.number),
  equal("=", ButtonCategory.result);

  final String label;
  final ButtonCategory category;

  const ButtonConfig(this.label, this.category);

  // Função para obter as cores com base no sistema operacional e no tipo do botão
  Color get textColor {
    if (Platform.isAndroid) {
      return _getAndroidTextColor();
    } else if (Platform.isIOS) {
      return _getIosTextColor();
    } else {
      return Colors.black;
    }
  }

  Color get backgroundColor {
    if (Platform.isAndroid) {
      return _getAndroidBackgroundColor();
    } else if (Platform.isIOS) {
      return _getIosBackgroundColor();
    } else {
      return Colors.grey;
    }
  }

  Color get borderColor {
    if (Platform.isAndroid) {
      return _getAndroidBorderColor();
    } else if (Platform.isIOS) {
      return _getIosBorderColor();
    } else {
      return Colors.grey;
    }
  }

  // Funções para obter as cores baseadas no sistema operacional e no tipo do botão

  // Cores específicas para Android
  Color _getAndroidTextColor() {
    switch (category) {
      case ButtonCategory.number:
        return Colors.grey[350]!;
      case ButtonCategory.operation:
        return Colors.orange[600]!;
      case ButtonCategory.function:
        return Colors.orange[600]!;
      case ButtonCategory.result:
        return Colors.white;
      default:
        return Colors.black;
    }
  }

  Color _getAndroidBackgroundColor() {
    switch (category) {
      case ButtonCategory.number:
        return Colors.grey[850]!;
      case ButtonCategory.operation:
        return Colors.grey[850]!;
      case ButtonCategory.function:
        return Colors.grey[850]!;
      case ButtonCategory.result:
        return Colors.orange[600]!;
      default:
        return Colors.grey;
    }
  }

  Color _getAndroidBorderColor() {
    switch (category) {
      case ButtonCategory.number:
        return Colors.grey[700]!;
      case ButtonCategory.operation:
        return Colors.grey[700]!;
      case ButtonCategory.function:
        return Colors.grey[700]!;
      case ButtonCategory.result:
        return Colors.orange[600]!;
      default:
        return Colors.grey;
    }
  }

  // Cores específicas para iOS
  Color _getIosTextColor() {
    switch (category) {
      case ButtonCategory.number:
        return Colors.grey[350]!;
      case ButtonCategory.operation:
        return Colors.grey[350]!;
      case ButtonCategory.function:
        return Colors.grey[350]!;
      case ButtonCategory.result:
        return Colors.grey[350]!;
      default:
        return Colors.black;
    }
  }

  Color _getIosBackgroundColor() {
    switch (category) {
      case ButtonCategory.number:
        return Colors.grey[850]!;
      case ButtonCategory.operation:
        return Colors.grey[800]!;
      case ButtonCategory.function:
        return Colors.grey[800]!;
      case ButtonCategory.result:
        return Colors.orange[600]!;
      default:
        return Colors.grey;
    }
  }

  Color _getIosBorderColor() {
    switch (category) {
      case ButtonCategory.number:
        return Colors.grey[700]!;
      case ButtonCategory.operation:
        return Colors.grey[800]!;
      case ButtonCategory.function:
        return Colors.grey[800]!;
      case ButtonCategory.result:
        return Colors.orange[600]!;
      default:
        return Colors.grey;
    }
  }
}

enum ButtonCategory {
  number,
  operation,
  function,
  result,
}
