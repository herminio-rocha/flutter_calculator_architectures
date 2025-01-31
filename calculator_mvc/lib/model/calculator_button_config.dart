import 'dart:io';
import 'package:calculator_mvc/controller/calculator_controller.dart';
import 'package:calculator_mvc/model/calculator_button_category.dart';
import 'package:flutter/material.dart';

class CalculatorButtonConfig {
  final String label;
  final CalculatorButtonCategory category;
  final void Function(CalculatorController) onPressed;

  const CalculatorButtonConfig(this.label, this.category, this.onPressed);

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
      case CalculatorButtonCategory.number:
        return Colors.grey[350]!;
      case CalculatorButtonCategory.operation:
        return Colors.orange[600]!;
      case CalculatorButtonCategory.function:
        return Colors.orange[600]!;
      case CalculatorButtonCategory.result:
        return Colors.white;
      default:
        return Colors.black;
    }
  }

  Color _getAndroidBackgroundColor() {
    switch (category) {
      case CalculatorButtonCategory.number:
        return Colors.grey[850]!;
      case CalculatorButtonCategory.operation:
        return Colors.grey[850]!;
      case CalculatorButtonCategory.function:
        return Colors.grey[850]!;
      case CalculatorButtonCategory.result:
        return Colors.orange[600]!;
      default:
        return Colors.grey;
    }
  }

  Color _getAndroidBorderColor() {
    switch (category) {
      case CalculatorButtonCategory.number:
        return Colors.grey[700]!;
      case CalculatorButtonCategory.operation:
        return Colors.grey[700]!;
      case CalculatorButtonCategory.function:
        return Colors.grey[700]!;
      case CalculatorButtonCategory.result:
        return Colors.orange[600]!;
      default:
        return Colors.grey;
    }
  }

  // Cores específicas para iOS
  Color _getIosTextColor() {
    switch (category) {
      case CalculatorButtonCategory.number:
        return Colors.grey[350]!;
      case CalculatorButtonCategory.operation:
        return Colors.grey[350]!;
      case CalculatorButtonCategory.function:
        return Colors.grey[350]!;
      case CalculatorButtonCategory.result:
        return Colors.grey[350]!;
      default:
        return Colors.black;
    }
  }

  Color _getIosBackgroundColor() {
    switch (category) {
      case CalculatorButtonCategory.number:
        return Colors.grey[850]!;
      case CalculatorButtonCategory.operation:
        return Colors.grey[800]!;
      case CalculatorButtonCategory.function:
        return Colors.grey[800]!;
      case CalculatorButtonCategory.result:
        return Colors.orange[600]!;
      default:
        return Colors.grey;
    }
  }

  Color _getIosBorderColor() {
    switch (category) {
      case CalculatorButtonCategory.number:
        return Colors.grey[700]!;
      case CalculatorButtonCategory.operation:
        return Colors.grey[800]!;
      case CalculatorButtonCategory.function:
        return Colors.grey[800]!;
      case CalculatorButtonCategory.result:
        return Colors.orange[600]!;
      default:
        return Colors.grey;
    }
  }
}
