import 'package:flutter/material.dart';

class StartGameButton extends StatelessWidget {
  const StartGameButton({Key? key, required this.onTap}) : super(key: key);
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final buttonWidth = screenWidth * 0.2; // 20% of the screen width
    final buttonHeight = screenHeight * 0.25; // 25% of the screen height

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: buttonWidth,
          height: buttonHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/start_game.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
