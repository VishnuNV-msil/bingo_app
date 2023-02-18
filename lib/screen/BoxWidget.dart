
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color textColor;
  final String buttonText;
  final Function() buttonTapped;

  const ButtonWidget(
      {super.key,
        required this.textColor,
        required this.buttonText,
        required this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Container(
        margin: const EdgeInsets.all(0.5),
        decoration: BoxDecoration(
          color: ([...Colors.primaries]..shuffle()).first,
        ),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

