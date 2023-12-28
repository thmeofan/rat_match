import 'package:flutter/material.dart';

class LevelButton extends StatelessWidget {
  const LevelButton(
      {Key? key,
      required this.assetName,
      required this.onTap,
      required this.buttonKey,
      this.isSelected = false})
      : super(key: key);
  final String assetName;
  final Function() onTap;
  final GlobalKey buttonKey;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.1;
    final buttonHeight = screenWidth * 0.1;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: buttonWidth,
          height: buttonHeight,
          decoration: BoxDecoration(
            border: isSelected // Check if the level is selected
                ? Border.all(
                    color: Colors.white, width: 3.0) // Selected border style
                : null,
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
