import 'package:flutter/material.dart';
import 'package:rat_match/data/repository/score_repo.dart';
import 'package:rat_match/views/app/widgets/start_button.dart';

import '../../../util/app_routes.dart';
import '../../app/widgets/navigation_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Centered banner with chipmunk image aligned at the bottom
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: size.height * 0.8,
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                // Positioned chipmunk image on the border of the banner
                Positioned(
                  bottom: -(size.height * 0.1), // Half the image height
                  right: -(size.width * 0.08), // Half the image width
                  child: Image.asset(
                    'assets/images/chipmunk.png',
                    height: size.height * 0.9,
                    fit: BoxFit.contain, // Adjust the size accordingly
                  ),
                ),
                // Content inside the banner
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${ScoreRepository().score}'),
                  ],
                ),
                // Positioned NavigationButtons at the bottom of the banner
                Positioned(
                  bottom: 10, // Align to bottom edge of the banner
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StartButton(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.home,
                          );
                        },
                        assetName: 'assets/images/okay.png',
                        buttonWidth: size.width * 0.2,
                        buttonHeight: size.height * 0.3,
                      ),
                      // StartButton(
                      //   onTap: () {
                      //     Navigator.of(context).pushNamed(
                      //       AppRoutes.home,
                      //     );
                      //   },
                      //   assetName: 'assets/images/buy.png',
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Original NavigationButton positioned at the top left corner
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
        ],
      ),
    );
  }
}
