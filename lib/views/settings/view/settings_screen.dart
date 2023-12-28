import 'package:flutter/material.dart';
import 'package:rat_match/views/app/widgets/navigation_button.dart';

import '../../../util/app_routes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
          // NavigationButton positioned at the top left corner
          Positioned(
            top: size.height * 0.1,
            left: size.width * 0.05,
            child: NavigationButton(
              assetName: 'assets/images/home.png',
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.home,
                );
              },
              buttonWidth: size.width * 0.08,
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
                // Your buttons and other content inside the banner
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Text('PRIVACY POLICY'),
                      onPressed: () {
                        // Implement navigation logic
                      },
                      // style: SettingsTextStyle.tile,
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextButton(
                      child: Text('TERMS OF USE'),
                      onPressed: () {
                        // Implement navigation logic
                      },
                      // style: SettingsTextStyle.tile,
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextButton(
                      child: Text('RATE APP'),
                      onPressed: () {
                        // Implement navigation logic
                      },
                      // style: SettingsTextStyle.tile,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
