import 'dart:async';
import 'dart:math';

import 'package:bettersleep/common_widgets/app_assets.dart';
import 'package:bettersleep/common_widgets/star_background.dart';
import 'package:bettersleep/screens/get_started_screen/get_started_screen.dart';
import 'package:bettersleep/screens/sign_in_screen/sign_in_screen.dart';
import 'package:bettersleep/screens/welcome_screen/widgets/animated_text.dart';
import 'package:bettersleep/screens/welcome_screen/widgets/button.dart';
import 'package:bettersleep/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/global_variables.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late Timer _textTimer;
  bool _roundButtonVisible = false;
  bool _signInTextVisible = false;

  @override
  void initState() {
    super.initState();
    _startTimers();
  }

  @override
  void dispose() {
    _textTimer.cancel();
    super.dispose();
  }

  void _startTimers() {
    _textTimer = Timer(const Duration(seconds: 1), () {
      Future.delayed(const Duration(seconds: 6), () {
        setState(() {
          _roundButtonVisible = true;
        });
      });
      Future.delayed(const Duration(seconds: 8), () {
        setState(() {
          _signInTextVisible = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: skyColor,
              ),
            ),
          ),
          const StarBackground(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppAssets.appIcon, cacheHeight: 80),
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedTextWidget(),
                  ],
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (_roundButtonVisible)
                  RoundButton(ontap: () {
                    Navigator.of(context).push(createRightToLeftRoute(
                        const GetStartedScreen(), const RouteSettings()));
                  }),
                const SizedBox(
                  height: 30,
                ),
                if (_signInTextVisible)
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(createRightToLeftRoute(
                          const SignInScreen(), const RouteSettings()));
                    },
                    child: Text(
                      "I already have an account. Sign In",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double getRandomSize() {
    final random = Random();
    return random.nextDouble() * 4 + 0.2; // Random size between 3 and 8
  }
}
