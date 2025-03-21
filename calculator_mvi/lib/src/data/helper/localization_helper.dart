import 'dart:ui';

import 'package:calculator_mvi/src/data/helper/localization_keys.dart';

class LocalizationHelper {
  static final Map<String, Map<String, String>> _messages = {
    'en': {
      LocalizationKeys.errorDivisionByZero.name: 'Error: Division by zero',
    },
    'pt': {
      LocalizationKeys.errorDivisionByZero.name: 'Erro: Divisão por zero',
    },
    'es': {
      LocalizationKeys.errorDivisionByZero.name: 'Error: división por cero',
    },
  };

  static String getMessage(LocalizationKeys key, Locale locale) {
    return _messages[locale.languageCode]?[key.name] ??
        _messages['en']?[key.name] ??
        key.name;
  }
}
