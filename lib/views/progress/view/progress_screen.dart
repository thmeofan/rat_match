import 'dart:math';

import 'package:flutter/material.dart';

import '../../../util/app_routes.dart';
import '../../app/widgets/navigation_button.dart';
import '../../app/widgets/start_button.dart';
import '../widget/level_button.dart';
import '../widget/level_indicator_widget.dart';
import '../widget/line_painter.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final int numberOfLevels = 5;
  int selectedLevelIndex = 0;
  final List<GlobalKey> buttonKeys = List.generate(5, (index) => GlobalKey());
  List<Offset> buttonPositions = [];
  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance
    //     .addPostFrameCallback((_) => _calculateButtonPositions());
  }

  // void _calculateButtonPositions() {
  //   final double screenWidth = MediaQuery.of(context).size.width;
  //   final double screenHeight = MediaQuery.of(context).size.height;
  //   final double buttonWidth =
  //       screenWidth * 0.1; // Assuming button width is 10% of screen width
  //
  //   // Hard-coded Y-Axis percentages to place the buttons vertically.
  //   final List<double> buttonYPositions = [
  //     0.1, // Level 1
  //     0.3, // Level 2
  //     0.5, // Level 3
  //     0.7, // Level 4
  //     0.9, // Level 5
  //   ];
  //
  //   buttonPositions = buttonYPositions
  //       .map((yPos) =>
  //           Offset(screenWidth / 2 - buttonWidth / 2, screenHeight * yPos))
  //       .toList();
  //
  //   setState(() {}); // Trigger a rebuild to paint the buttons and lines
  // }

  void _onPrevious() {
    setState(() {
      selectedLevelIndex =
          (selectedLevelIndex - 1 + numberOfLevels) % numberOfLevels;
    });
  }

  void _onNext() {
    setState(() {
      selectedLevelIndex = (selectedLevelIndex + 1) % numberOfLevels;
    });
  }

  void _onStartLevel() {
    Navigator.of(context).pushNamed('lvl$selectedLevelIndex');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<Offset> buttonPositions = [
      Offset(0.2, 0.1), // Level 1
      Offset(0.4, 0.3), // Level 2
      Offset(0.6, 0.5), // Level 3
      Offset(0.8, 0.2), // Level 4
      Offset(1.0, 0.4), // Level 5
    ]
        .map((offset) => Offset(
              offset.dx * MediaQuery.of(context).size.width,
              offset.dy * MediaQuery.of(context).size.height,
            ))
        .toList();
    final List<Function()> onTapActions = [
      () {
        Navigator.of(context).pushNamed(
          AppRoutes.lvl1,
        );
      }, // Replace with your actual onTap actions
      () {
        Navigator.of(context).pushNamed(
          AppRoutes.lvl2,
        );
      },
      () => print('Level 3 tapped'),
      () => print('Level 4 tapped'),
      () => print('Level 5 tapped'),
    ];
    // Place your buttons with the assigned keys and random top offsets...
    // For example:
    final buttonWidth = MediaQuery.of(context).size.width * 0.1;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.transparent.withOpacity(1),
            BlendMode.dstATop,
          ),
        )),
        child: Column(
          children: [
            Stack(
              children: [
                if (buttonPositions.length == numberOfLevels)
                  CustomPaint(
                    size: Size.infinite,
                    // Pass the buttonPositions to the painter
                    painter: LinePainter(
                      buttonPositions,
                    ),
                  ),
                ...List.generate(numberOfLevels, (index) {
                  return Positioned.fill(
                    left: index *
                        MediaQuery.of(context).size.height *
                        0.4, // Horizontal spacing
                    top: Random().nextDouble() *
                        MediaQuery.of(context).size.height *
                        0.6,
                    child: LevelButton(
                      assetName: 'assets/images/lvl${index + 1}.png',
                      onTap: onTapActions[index],
                      buttonKey: buttonKeys[index], // Use the key here
                    ),
                  );
                }),
                SizedBox(
                  height: size.height * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NavigationButton(
                        assetName: 'assets/images/previous.png',
                        onTap: () {
                          _onPrevious();
                        },
                        buttonWidth: size.width * 0.1,
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      StartButton(
                        buttonWidth: size.width * 0.2,
                        buttonHeight: size.height * 0.3,
                        assetName: 'assets/images/start.png',
                        onTap: () {
                          _onStartLevel();
                        },
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      NavigationButton(
                        assetName: 'assets/images/next.png',
                        onTap: () {
                          _onNext();
                        },
                        buttonWidth: size.width * 0.1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
