import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class SpeechBubble extends StatelessWidget {
  final String text1;
  final String text2;

  const SpeechBubble({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        // color: Colors.red,
        height: MediaQuery.of(context).size.height * 0.45,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Bubble(
          color: Colors.black.withOpacity(0.5),
          nip: BubbleNip.leftBottom,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text1,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 4),
              Text(
                text2,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
