import 'package:flutter/material.dart';

import '../../../util/app_routes.dart';
import '../../app/widgets/navigation_button.dart';
import '../widget/game_card_widget.dart';

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
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.transparent.withOpacity(1),
            BlendMode.dstATop,
          ),
        )),
        child: Padding(
          padding: EdgeInsets.all(size.height * 0.05),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Center(
                child: Container(
                  height: size.height * 0.8,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/banner.png'),
                    fit: BoxFit.contain,
                  )),
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height * 0.2),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2,
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
        _checkForCompletion(); // Check if the game is complete after a successful match.
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
    // If all cards are flipped, then the game is complete
    if (_cardFlipped.every((bool status) => status)) {
      // Navigate to the ResultScreen
      Navigator.of(context).pushNamed(
        AppRoutes.result,
      );
    }
  }
}
