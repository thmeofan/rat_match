import 'package:flutter/material.dart';
import 'package:rat_match/views/app/widgets/navigation_button.dart';
import 'package:rat_match/views/consts/app_text_style/settings_style.dart';

import '../../../util/app_routes.dart';
import '../../app/view/my_in_app_web_view.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.1,
            left: size.width * 0.025,
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
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: size.height * 0.8,
                  width: size.width * 0.6,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/banner.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -(size.height * 0.1),
                  right: -(size.width * 0.08),
                  child: Image.asset(
                    'assets/images/chipmunk.png',
                    height: size.height * 0.9,
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.white,
                            Color(0xFFEC9851),
                          ],
                        ).createShader(bounds);
                      },
                      child: TextButton(
                        child: const Text(
                          'PRIVACY POLICY',
                          style: SettingsTextStyle.heavyTextStyle,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyInAppWebView(
                                  url: 'https://google.com/'),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.white,
                            Color(0xFFEC9851),
                          ],
                        ).createShader(bounds);
                      },
                      child: TextButton(
                        child: const Text(
                          'TERMS OF USE',
                          style: SettingsTextStyle.heavyTextStyle,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyInAppWebView(
                                  url: 'https://google.com/'),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.white,
                            Color(0xFFEC9851),
                          ],
                        ).createShader(bounds);
                      },
                      child: TextButton(
                        child: const Text(
                          'RATE APP',
                          style: SettingsTextStyle.heavyTextStyle,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyInAppWebView(
                                  url: 'https://google.com/'),
                            ),
                          );
                        },
                      ),
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
