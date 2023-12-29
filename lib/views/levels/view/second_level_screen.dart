import 'package:flutter/material.dart';
import 'package:rat_match/views/app/widgets/navigation_button.dart';
import 'package:rat_match/views/levels/widget/game_card_widget.dart';

import '../../../data/repository/score_repo.dart';
import '../../../util/app_routes.dart';

class SecondLevelScreen extends StatefulWidget {
  const SecondLevelScreen({super.key});

  @override
  _SecondLevelScreenState createState() => _SecondLevelScreenState();
}

class _SecondLevelScreenState extends State<SecondLevelScreen> {
  final List<String> _availableIcons = [
    'barel.png',
    'bomb.png',
    'chest.png',
    'clock.png',
    'crown.png',
    'energy.png',
    'present.png',
  ];

  List<String> _gameIcons = [];
  List<bool> _cardFlipped = [];
  int _previousIndex = -1;
  bool _flipAllowed = true;

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  void _initGame() {
    setState(() {
      List<String> halfGameIcons = List<String>.from(_availableIcons)
        ..shuffle();
      halfGameIcons = halfGameIcons.take(3).toList();

      _gameIcons = [...halfGameIcons, ...halfGameIcons];
      _gameIcons.shuffle();

      _cardFlipped = List<bool>.filled(_gameIcons.length, false);
      _previousIndex = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: const AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.transparent.withOpacity(1),
            BlendMode.dstATop,
          ),
        )),
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.all(size.height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: size.height * 0.9,
                    width: size.width * 0.6,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/images/banner.png'),
                      fit: BoxFit.contain,
                    )),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.height * 0.22,
                        vertical: size.height * 0.15,
                      ),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1,
                        ),
                        itemCount: _gameIcons.length,
                        itemBuilder: (context, index) {
                          return CustomCard(
                            iconName: _gameIcons[index],
                            isFlipped: _cardFlipped[index],
                            onTap: () => _onCardClick(index),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.1,
            left: size.width * 0.05,
            child: Row(
              children: [
                NavigationButton(
                  assetName: 'assets/images/home.png',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.home,
                    );
                  },
                  buttonWidth: size.width * 0.08,
                ),
                NavigationButton(
                  assetName: 'assets/images/settings.png',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.settingsScreen,
                    );
                  },
                  buttonWidth: size.width * 0.08,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void _onCardClick(int index) {
    if (!_flipAllowed || _cardFlipped[index]) return;

    setState(() {
      _cardFlipped[index] = true;
    });

    if (_previousIndex == -1) {
      _previousIndex = index;
    } else {
      if (_gameIcons[index] == _gameIcons[_previousIndex]) {
        _checkForCompletion();
        _previousIndex = -1;
      } else {
        _flipAllowed = false;
        Future.delayed(const Duration(milliseconds: 700), () {
          setState(() {
            _cardFlipped[index] = false;
            _cardFlipped[_previousIndex] = false;
            _previousIndex = -1;
            _flipAllowed = true;
          });
        });
      }
    }
  }

  void _checkForCompletion() {
    if (_cardFlipped.every((bool status) => status)) {
      Navigator.of(context).pushNamed(
        AppRoutes.result,
      );
      score += 150;
    }
  }
}
