import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class CustomCard extends StatelessWidget {
  final String iconName;
  final bool isFlipped;
  final VoidCallback onTap;

  CustomCard({
    super.key,
    required this.iconName,
    required this.isFlipped,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // You can adjust these values to get the desired card size
    double cardWidth =
        MediaQuery.of(context).size.width * 0.2; // 20% of screen width
    double cardHeight =
        cardWidth * 1.4; // Maintain a 1:1.4 aspect ratio for cards

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: isFlipped
              ? DecorationImage(
                  image: AssetImage('assets/images/card_face.png'),
                  fit: BoxFit.contain,
                )
              : DecorationImage(
                  image: AssetImage('assets/images/card_back.png'),
                  fit: BoxFit.contain,
                ),
        ),
        child: Center(
          child: isFlipped ? Image.asset('assets/icons/$iconName') : null,
        ),
      ),
    );
  }
}
//
// Future<List<CustomCard>> loadCards() async {
//   final manifestContent = await rootBundle.loadString('AssetManifest.json');
//   final Map<String, dynamic> manifestMap = json.decode(manifestContent);
//
//   final iconPaths = manifestMap.keys
//       .where((String key) => key.startsWith('assets/icons/'))
//       .toList();
//
//   List<CustomCard> cards = iconPaths
//       .map((iconPath) => CustomCard(iconName: iconPath.split('/').last))
//       .toList();
//
//   return cards;
// }
