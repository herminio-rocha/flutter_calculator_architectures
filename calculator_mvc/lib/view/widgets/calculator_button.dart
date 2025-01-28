import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String label;

  const CalculatorButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0 //MediaQuery.of(context).size.width * 0.015,
          ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[850],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(
              color: Colors.grey[900]!.withOpacity(0.5),
              width: 2,
            ),
          ),
          elevation: 16,
          shadowColor: Colors.black,
        ),
        child: Row(
          children: [
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 50,
                    fontFamily: "Courier New",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
