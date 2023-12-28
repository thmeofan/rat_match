import 'package:flutter/material.dart';
import 'package:rat_match/views/app/widgets/navigation_button.dart';
import 'package:rat_match/views/app/widgets/start_button.dart';

import '../../../util/app_routes.dart';

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
      _currentPage = _numPages - 1; // Wrap to last page
    } else {
      _currentPage--;
    }
    _pageController.animateToPage(
      _currentPage,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onNext() {
    if (_currentPage == _numPages - 1) {
      _currentPage = 0; // Wrap to first page
    } else {
      _currentPage++;
    }
    _pageController.animateToPage(
      _currentPage,
      duration: Duration(milliseconds: 300),
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
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.transparent.withOpacity(1),
            BlendMode.dstATop,
          ),
        )),
        child: Stack(children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                buildPage(size, 'assets/images/star_one.png', 'SIMPLE LEVEL'),
                buildPage(size, 'assets/images/star_three.png', 'MIDDLE LEVEL'),
                buildPage(size, 'assets/images/star_two.png', 'ADVANCED LEVEL'),
              ],
            ),
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
}

Widget buildPage(Size size, String starImage, String levelText) {
  return Center(
    child: SizedBox(
      width: size.width * 0.65,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/lvl_banner.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(starImage),
            SizedBox(
                height:
                    size.height * 0.01), // Space between the star and the text
            Text(
              levelText,
              style: TextStyle(
                // Define the text style as needed
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
