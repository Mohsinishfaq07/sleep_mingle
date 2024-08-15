import 'package:bettersleep/common_widgets/star_background.dart';
import 'package:bettersleep/screens/sounds_screen/my_sound_screen.dart';
import 'package:bettersleep/screens/sounds_screen/mixes_screen.dart';
import 'package:bettersleep/screens/sounds_screen/music_screen.dart';
import 'package:bettersleep/utils/colors.dart';
import 'package:flutter/material.dart';

class SoundsScreen extends StatefulWidget {
  const SoundsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SoundsScreenState createState() => _SoundsScreenState();
}

class _SoundsScreenState extends State<SoundsScreen> {
  int selectedButtonIndex = 1;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      backgroundColor: Colors.red,
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
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedButtonIndex = 1;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            // backgroundColor:
                            //     selectedButtonIndex == 1 ? Colors.green : Colors.blue,
                            ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sounds',
                              style: TextStyle(
                                color: selectedButtonIndex == 1
                                    ? Colors.white
                                    : Colors.white38,
                                fontSize: 20,
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: 50,
                              height: 2,
                              decoration: BoxDecoration(
                                  color: selectedButtonIndex == 1
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(30)),
                            )
                          ],
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () {
                      //     setState(() {
                      //       selectedButtonIndex = 2;
                      //     });
                      //   },
                      //   style: ElevatedButton.styleFrom(
                      //       // backgroundColor:
                      //       //     selectedButtonIndex == 1 ? Colors.green : Colors.blue,
                      //       ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         'Music',
                      //         style: TextStyle(
                      //           color: selectedButtonIndex == 2
                      //               ? Colors.white
                      //               : Colors.white38,
                      //           fontSize: 20,
                      //           // decoration: TextDecoration.underline,
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         height: 3,
                      //       ),
                      //       Container(
                      //         width: 40,
                      //         height: 2,
                      //         decoration: BoxDecoration(
                      //             color: selectedButtonIndex == 2
                      //                 ? Colors.white
                      //                 : Colors.transparent,
                      //             borderRadius: BorderRadius.circular(30)),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedButtonIndex = 3;
                          });
                        },
                        style: ElevatedButton.styleFrom(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mixes',
                              style: TextStyle(
                                color: selectedButtonIndex == 3
                                    ? Colors.white
                                    : Colors.white38,
                                fontSize: 20,
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: 40,
                              height: 2,
                              decoration: BoxDecoration(
                                color: selectedButtonIndex == 3
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              // Colors.black,
                              primaryColor,
                              Colors.blue,
                              Colors.white,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            "Upgrade",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                selectedButtonIndex == 1
                    ? const MySoundScreen()
                    : selectedButtonIndex == 2
                        ? SizedBox(
                            height: screenHeight * 74,
                            child: const MusicScreen())
                        : SizedBox(
                            height: screenHeight * 75,
                            child: const MixesScreen(),
                          ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
