import 'package:flutter/material.dart';

class LevelWidget extends StatelessWidget {
  const LevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment
          .center, // Align the children relative to the stack's center.
      children: <Widget>[
        // Level banner in the middle
        Image.asset('assets/lvl_banner.png'),
        // Grass image behind the banner at the bottom
        Positioned(
          bottom: 0,
          child: Image.asset('assets/grass.png'),
        ),
        // Level stars on top of the banner
        Positioned(
          top: 0,
          child: Image.asset('assets/lvl_stars_empty.png'),
        ),
      ],
    );
  }
}
