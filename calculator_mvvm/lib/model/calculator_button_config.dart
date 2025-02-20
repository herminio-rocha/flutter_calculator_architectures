import 'dart:io';

import 'package:calculator_mvvm/model/calculator_button_category.dart';
import 'package:calculator_mvvm/viewmodel/calculator_viewmodel.dart';
import 'package:flutter/material.dart';

/// Define a configuração dos botões da calculadora, incluindo texto, categoria e ações.
///
/// Defines the configuration of calculator buttons, including label, category, and actions.
class CalculatorButtonConfig {
  final String label;
  final CalculatorButtonCategory category;
  final void Function(CalculatorViewModel) onPressed;

  const CalculatorButtonConfig(this.label, this.category, this.onPressed);

  /// Métodos para obter as cores baseadas no sistema operacional e no tipo do botão.
  ///
  /// Methods for getting colors based on operating system and button type.

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

  /// Cores específicas para Sistema Android.
  ///
  /// Specific colors for Android system.

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

  /// Cores específicas para sistema iOS.
  ///
  ///Specific colors for iOS system.

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
