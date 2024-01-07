import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:rat_match/views/consts/app_text_style/onboarding_style.dart';

class SpeechBubble extends StatelessWidget {
  final String text1;
  final String text2;

  const SpeechBubble({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          // color: Colors.red,
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Bubble(
            color: Colors.black.withOpacity(0.4),
            nip: BubbleNip.leftBottom,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text1,
                  style: OnboardingTextStyle.introduction,
                ),
                const SizedBox(height: 4),
                Text(
                  text2,
                  style: OnboardingTextStyle.description,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
