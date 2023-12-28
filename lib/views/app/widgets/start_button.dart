import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton(
      {Key? key,
      required this.onTap,
      required this.assetName,
      required this.buttonWidth,
      required this.buttonHeight})
      : super(key: key);
  final Function() onTap;
  final String assetName;
  final double buttonWidth;
  final double buttonHeight;
  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    // final buttonWidth = screenWidth * 0.16; // 20% of the screen width
    // = screenHeight * 0.25; // 25% of the screen height

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: buttonWidth,
          height: buttonHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(assetName),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
