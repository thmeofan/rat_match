// import 'package:flutter/material.dart';
//
// import 'line_painter.dart';
//
// class LevelIndicator extends StatelessWidget {
//   final int levelCount;
//   final int currentLevel;
//
//   LevelIndicator({required this.levelCount, required this.currentLevel});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 20.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: List.generate(
//           levelCount,
//           (index) => LevelNode(
//             isActive: index <= currentLevel,
//             isLast: index == levelCount - 1,
//           ),
//         ),
//       ),
//     );
//   }
// }
