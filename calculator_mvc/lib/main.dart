import 'dart:io';

import 'package:calculator_mvc/view/android_calculator_view.dart';
import 'package:calculator_mvc/view/ios_calculator_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? MaterialApp(
            title: 'Flutter Calculator',
            theme: ThemeData(
              primarySwatch: Colors.grey,
            ),
            home: const AndroidCalculatorView(),
          )
        : const CupertinoApp(
            title: "Flutter Calculator",
            theme: CupertinoThemeData(primaryColor: CupertinoColors.systemGrey),
            home: IosCalculatorView(),
          );
  }
}
