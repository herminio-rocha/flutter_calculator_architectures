import 'dart:io';
import 'dart:ui' as ui;

import 'package:calculator_mvvm/model/calculation.dart';
import 'package:calculator_mvvm/model/calculator_model.dart';
import 'package:calculator_mvvm/repository/calculator_button_config_repository.dart';
import 'package:calculator_mvvm/view/android_calculator_view.dart';
import 'package:calculator_mvvm/view/ios_calculator_view.dart';
import 'package:calculator_mvvm/viewmodel/calculator_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Future.delayed(
      const Duration(
        seconds: 1,
      ), () {
    FlutterNativeSplash.remove();
  });

  runApp(
    MultiProvider(
      providers: [
        Provider<Calculation>(
          create: (_) => Calculation(),
        ),
        Provider<CalculatorButtonConfigRepository>(
          create: (_) => CalculatorButtonConfigRepository(),
        ),
        ProxyProvider<Calculation, CalculatorModel>(
          update: (_, calculation, __) => CalculatorModel(calculation),
        ),
        ChangeNotifierProxyProvider2<CalculatorButtonConfigRepository,
            CalculatorModel, CalculatorViewModel>(
          create: (_) => CalculatorViewModel(
            CalculatorButtonConfigRepository(),
            CalculatorModel(Calculation()),
          ),
          update: (_, configRepo, calculatorModel, viewModel) {
            viewModel ??= CalculatorViewModel(configRepo, calculatorModel);
            return viewModel;
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            debugShowCheckedModeBanner: false,
            supportedLocales: supportedLocales,
            localizationsDelegates: localizationsDelegates,
            locale: locale,
            home: const AndroidCalculatorView(),
          )
        : CupertinoApp(
            title: "Flutter Calculator",
            theme: const CupertinoThemeData(
                primaryColor: CupertinoColors.systemGrey),
            debugShowCheckedModeBanner: false,
            supportedLocales: supportedLocales,
            localizationsDelegates: localizationsDelegates,
            locale: locale,
            home: const IosCalculatorView(),
          );
  }
}
