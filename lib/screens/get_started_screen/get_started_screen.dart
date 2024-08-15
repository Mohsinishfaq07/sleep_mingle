import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bettersleep/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:bettersleep/screens/welcome_screen/widgets/button.dart';
import 'package:bettersleep/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/global_variables.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/moonbg.jpg',
              height: double.infinity,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            // bottom,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: screenHeight * 55,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryColor10,
                    primaryColor,
                    primaryColor,
                    primaryColor,
                    Colors.black,
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 350,
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Drift off with the boost sleep sounds',
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(
                        fontSize: 32.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
                const SizedBox(
                  height: 18,
                ),
                const Center(
                  child: SizedBox(
                    width: 300,
                    child: Text(
                      'Choose from 700+ soothing audio, music, meditations, stories and more.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RoundButton(
                    ontap: () {
                      Navigator.of(context).push(createRightToLeftRoute(
                          const MyBottomNavBar(), const RouteSettings()));
                    }
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
