import 'package:bettersleep/common_widgets/star_background.dart';
import 'package:bettersleep/screens/welcome_screen/welcome_screen.dart';
import 'package:bettersleep/screens/welcome_screen/widgets/button.dart';
import 'package:bettersleep/screens/welcome_screen/widgets/sliding_button.dart';
import 'package:bettersleep/utils/colors.dart';
import 'package:flutter/material.dart';

class InterestSelectionScreen extends StatefulWidget {
  const InterestSelectionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InterestSelectionScreenState createState() =>
      _InterestSelectionScreenState();
}

class _InterestSelectionScreenState extends State<InterestSelectionScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Define the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Define the slide animation
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    // Dispose of the animation controller
    _controller.dispose();
    super.dispose();
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const WelcomeScreen(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(-1, 0);
                                const end = Offset.zero;
                                const curve = Curves.easeInOut;
                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                var offsetAnimation = animation.drive(tween);
                                return SlideTransition(
                                    position: offsetAnimation, child: child);
                              },
                              transitionDuration:
                                  const Duration(milliseconds: 1000),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.cancel_outlined,
                          color: Colors.white70,
                          size: 30,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "skip",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Center(
                    child: Text(
                      "What would you like to try?",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SlideTransition(
                    position: _slideAnimation,
                    child: SlidingButton(text: 'Calming sounds', ontap: () {}),
                  ),
                  SlideTransition(
                    position: _slideAnimation,
                    child: SlidingButton(text: 'Music', ontap: () {}),
                  ),
                  SlideTransition(
                    position: _slideAnimation,
                    child: SlidingButton(
                        text: 'Meditation & Hypnosis', ontap: () {}),
                  ),
                  SlideTransition(
                    position: _slideAnimation,
                    child: SlidingButton(text: 'Sleep Tales', ontap: () {}),
                  ),
                  SlideTransition(
                    position: _slideAnimation,
                    child:
                        SlidingButton(text: 'Breating Exercise', ontap: () {}),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(child: RoundButton(ontap: () {}))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
