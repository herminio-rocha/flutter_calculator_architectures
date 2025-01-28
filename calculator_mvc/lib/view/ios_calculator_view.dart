import 'package:flutter/cupertino.dart';

class IosCalculatorView extends StatefulWidget {
  const IosCalculatorView({super.key});

  @override
  State<IosCalculatorView> createState() => _IosCalculatorViewState();
}

class _IosCalculatorViewState extends State<IosCalculatorView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("IOS"),
      ),
    );
  }
}
