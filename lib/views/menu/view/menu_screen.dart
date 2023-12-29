import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rat_match/views/app/widgets/navigation_button.dart';
import 'package:rat_match/views/app/widgets/start_button.dart';
import 'package:rat_match/views/consts/app_text_style/menu_style.dart';

import '../../../util/app_routes.dart';
import '../../app/widgets/heart_widget.dart';
import '../../app/widgets/score_widget.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State createState() => _MenuScreenState();
}

class _MenuScreenState extends State {
  final PageController _pageController = PageController();
  final int _numPages = 3;
  int _currentPage = 0;

  void _onPrevious() {
    if (_currentPage == 0) {
      _currentPage = _numPages - 1;
    } else {
      _currentPage--;
    }
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onNext() {
    if (_currentPage == _numPages - 1) {
      _currentPage = 0;
    } else {
      _currentPage++;
    }
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
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
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              buildPage(
                size,
                'assets/images/star1.svg',
                'SIMPLE LEVEL',
              ),
              buildPage(size, 'assets/images/star2.svg', 'MIDDLE LEVEL'),
              buildPage(size, 'assets/images/star3.svg', 'ADVANCED LEVEL'),
            ],
          ),
          Positioned(
            bottom: size.height * 0.025,
            left: size.width * 0.28,
            child: Center(
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
                      Navigator.of(context).pushNamed(
                        AppRoutes.progress,
                      );
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
          ),
          Positioned(
            top: size.height * 0.1,
            left: size.width * 0.025,
            child: Row(
              children: [
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
          Positioned(
            top: size.height * 0.035,
            right: -size.width * 0.025,
            child: const Column(
              children: [
                ScoreWidget(),
                HeartWidget(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

Widget buildPage(Size size, String starImage, String levelText) {
  return Center(
    child: SizedBox(
      width: size.width * 0.7,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/lvl_banner.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(starImage),
            //  Image.asset(starImage),
            SizedBox(height: size.height * 0.05),
            Text(levelText, style: MenuTextStyle.gradientTextStyle),
          ],
        ),
      ),
    ),
  );
}
