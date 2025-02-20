import 'dart:ui';

import 'package:calculator_mvvm/helper/localization_keys.dart';

/// Classe responsável por fornecer mensagens localizadas de acordo com o idioma do dispositivo.
///
/// Class responsible for providing localized messages according to the device language.
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
