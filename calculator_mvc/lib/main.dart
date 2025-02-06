import 'dart:io';
import 'dart:ui' as ui;

import 'package:calculator_mvc/view/android_calculator_view.dart';
import 'package:calculator_mvc/view/ios_calculator_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Iterable<Locale> supportedLocales = [
      Locale('en', ''),
      Locale('pt', ''),
      Locale('es', ''),
    ];

    const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];

    Locale locale = ui.PlatformDispatcher.instance.locale;

    return Platform.isAndroid
        ? MaterialApp(
            title: 'Flutter Calculator',
            theme: ThemeData(
              primarySwatch: Colors.grey,
            ),
            supportedLocales: supportedLocales,
            localizationsDelegates: localizationsDelegates,
            locale: locale,
            home: const AndroidCalculatorView(),
          )
        : CupertinoApp(
            title: "Flutter Calculator",
            theme: const CupertinoThemeData(
                primaryColor: CupertinoColors.systemGrey),
            supportedLocales: supportedLocales,
            localizationsDelegates: localizationsDelegates,
            locale: locale,
            home: const IosCalculatorView(),
          );
  }
}
