import 'package:audioplayers/audioplayers.dart';
import 'package:bettersleep/screens/sounds_screen/widgets/single_sound_box.dart';
import 'package:bettersleep/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common_widgets/custom_elevated_button.dart';
import 'sound_bottom_sheet.dart';
import '../../provider/sound_player_provider.dart';

class MySoundScreen extends StatefulWidget {
  const MySoundScreen({
    super.key,
  });

  @override
  State<MySoundScreen> createState() => _MySoundScreenState();
}

class _MySoundScreenState extends State<MySoundScreen> {
  String? currentSoundPath;
  int tapped = 0;
   bool isPlaying = false;
  int? _currentSoundIndex;
  String? _currentSoundPath;
  String? _currentSoundName;
  IconData? _currentSoundIcon;
  final audioPlayer = AudioPlayer();
  List<String> soundCategories = [
    'All',
    'Popular',
    'My ❤',
    'New',
    "White Noise",
    "Water",
    'Nature',
    'Asmr',
    'Animal',
    'Baby',
    "Brainwave",
    "City",
    "Melodies",
    "Sci-Fi",
    "Solfeggio",
    "Spoken",
  ];
  void toggleAnimation() async {
    if (_currentSoundPath != null) {
      var soundProvider = Provider.of<SoundPlayerProvider>(context, listen: false);

      // Check if the sound is currently playing.
      if (isPlaying && _currentSoundPath == currentSoundPath) {
        // Sound is currently playing and the same sound was clicked again
        await audioPlayer.stop(); // Stop playing the sound
        soundProvider.removeSound(_currentSoundPath!); // Remove the sound from the provider

        setState(() {
          // Reset the current state as no sound is now playing
          _currentSoundName = null;
          _currentSoundIcon = null;
          isPlaying = false;
          currentSoundPath = null;  // Ensure the path is cleared
        });
      } else {
        // A different sound is selected or no sound was playing
        if (currentSoundPath != _currentSoundPath) {
          await audioPlayer.stop(); // Stop the currently playing sound if any
          soundProvider.stopSound(_currentSoundPath!); // Stop the sound in the provider too
        }

        // Start playing the new sound
        await audioPlayer.play(UrlSource(currentSoundPath!));
        soundProvider.playSound(currentSoundPath!, _currentSoundName!, _currentSoundIcon); // Play sound using provider

        setState(() {
          isPlaying = true;
          _currentSoundPath = currentSoundPath;
          _currentSoundName = _currentSoundName;
          _currentSoundIcon = _currentSoundIcon;
        });
      }
    }
  }

  // void toggleAnimation() async {
  //   if (currentSoundPath != null) {
  //     var soundProvider = Provider.of<SoundPlayerProvider>(context, listen: false);
  //
  //     // Check if the sound is currently playing.
  //     if (isPlaying) {
  //       // If the sound is playing and it's the same sound as the current sound, remove it on the second click.
  //       if (currentSoundPath == _currentSoundPath) {
  //         // Remove the sound using the provider.
  //         soundProvider.removeSound(currentSoundPath!);
  //         setState(() {
  //           // Clear the current sound display and reset play status.
  //           _currentSoundName = null;
  //           _currentSoundIcon = null;
  //           isPlaying = false;
  //           currentSoundPath = null;
  //         });
  //       } else {
  //         // If it's a different sound, stop the current and play the new one.
  //         await audioPlayer.stop();
  //         soundProvider.stopSound(_currentSoundPath!);
  //         await audioPlayer.play(UrlSource(currentSoundPath!));
  //         soundProvider.playSound(currentSoundPath!, _currentSoundName!);
  //         setState(() {
  //           isPlaying = true;
  //           _currentSoundPath = currentSoundPath;
  //           _currentSoundName = _currentSoundName;
  //           _currentSoundIcon = _currentSoundIcon;
  //         });
  //       }
  //     } else {
  //       // If not playing, play the sound.
  //       await audioPlayer.play(UrlSource(currentSoundPath!));
  //       soundProvider.playSound(currentSoundPath!, _currentSoundName!);
  //       setState(() {
  //         isPlaying = true;
  //         _currentSoundPath = currentSoundPath;
  //         _currentSoundName = _currentSoundName;
  //         _currentSoundIcon = _currentSoundIcon;
  //       });
  //     }
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // Listen to audio player state changes, if necessary
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose(); // Release the audio player resources
    super.dispose();
  }

  // Map<String, WidgetBuilder> categoryScreens = {
  //   'White Noise': (_) => const WhiteNoiseScreen(),
  //   'Water': (_) => const WaterScreen(),
  //   // Define other category screens...
  // };

  String selectedCategory = "None";

  @override
  Widget build(BuildContext context) {
    var soundProvider = Provider.of<SoundPlayerProvider>(context, listen: true);

    double screenHeight = MediaQuery.of(context).size.height / 100;
    bool showPlayer = soundProvider.numberOfActiveSounds > 0;

    return Column(
      children: [
        // SizedBox(
        //   // width: screenWidth * 100,
        //   height: 32,
        //   child: ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: soundCategories.length,
        //     itemBuilder: (context, index) {
        //       return GestureDetector(
        //         onTap: () {
        //           setState(() {
        //             tapped = index;
        //             selectedCategory = soundCategories[index];
        //           });
        //         },
        //         child: SingleSoundCategory(
        //
        //           name: soundCategories[index],
        //           isTaped: index == tapped ? true : false,
        //         ),
        //       );
        //     },
        //   ),
        // ),
        SizedBox(
          height: screenHeight * 1,
        ),
        Column(
          children: [
            SizedBox(
              height: screenHeight * 55,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Adjust the number of columns as needed
                ),
                itemCount: soundData.length,
                itemBuilder: (context, index) {
                  return SingleSoundBox(
                    icon: soundData[index]['icon'],
                    text: soundData[index]['name'],
                    isPaid: soundData[index]['isPaid'],
                    filePath: soundData[index]['filePath'],
                    onTap: () {
                      setState(() {
                        _currentSoundIndex = index;
                        _currentSoundPath = soundData[index]['filePath'];
                        _currentSoundName = soundData[index]['name'];
                        _currentSoundIcon = soundData[index]['icon'];
                        showPlayer = true;
                      });
                    },
                    isPlaying: isPlaying,
                    toggleAnimation: toggleAnimation,
                  );
                },
              ),
            ),
             if (showPlayer)
            // if (soundProvider.numberOfPlayingSounds > 0)
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Colors.purple,
                        Colors.black,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 50, // Adjust the size as needed
                  width: MediaQuery.of(context)
                      .size
                      .width, // Adjust the size as needed
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (_currentSoundIcon != null && showPlayer)
                        GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return SoundBottomSheet(
                                    currentSoundIndex: _currentSoundIndex,
                                    soundData: soundData,
                                    iconData: _currentSoundIcon,
                                  );
                                },
                              );
                            },
                            child: const Icon(
                              Icons.keyboard_arrow_up_sharp,
                              size: 30,
                              color: Colors.white,
                            )),
                        if (_currentSoundIcon !=
                            null)

                           Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFD2B48C), // Light Tan
                                    Color.fromARGB(
                                        255, 219, 120, 20), // Warm Brown
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(_currentSoundIcon,
                                    color: Colors.white),
                              )),
                        Text(
                          '  ${soundProvider.numberOfPlayingSounds} items',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _currentSoundName ?? "No sound playing",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                            ),
                            const Text(
                              "Current Mix", // You can keep this or replace it with more relevant information
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            var soundProvider =
                                Provider.of<SoundPlayerProvider>(context,
                                    listen: false);

                            if (_currentSoundPath != null &&
                                soundProvider
                                    .isSoundPlaying(_currentSoundPath!)) {
                              // If the sound is playing, pause all sounds
                              soundProvider.pauseAllSounds();
                            } else if (_currentSoundPath != null) {
                              // If the sound is not playing, play the specified sound
                              soundProvider.playAllSounds();
                            }

                            // This setState call might be necessary if the UI needs to update based on changes in the sound state
                            setState(() {
                              // Update any local state here if necessary
                            });
                          },
                          child: Icon(
                            // Determine the icon based on whether the current sound is playing
                            Provider.of<SoundPlayerProvider>(context)
                                    .isSoundPlaying(_currentSoundPath ?? "")
                                ? Icons.pause
                                : Icons.play_arrow,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class CustomPlaylistWidget extends StatelessWidget {
  final String title;
  final String title1;
  final String subtitle;
  final String buttonText;
  final VoidCallback buttonAction;
  final String imagePath; //
  final double width;

  const CustomPlaylistWidget(
      {super.key,
      required this.title,
      required this.title1,
      required this.subtitle,
      required this.buttonText,
      required this.buttonAction,
      required this.imagePath, //
      // Require the image path

      required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            // Use Expanded for the column to ensure it takes the necessary space
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      title1,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                CustomElevatedButton(
                  title: buttonText,
                  width: width,
                  onTap: buttonAction,
                ),

                //   child: Text(buttonText, style: const TextStyle(color: Colors.white)),
                // ),
              ],
            ),
          ),
          // Add padding around the image for better alignment
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(imagePath, height: 60), // Use imagePath here
          ),
        ],
      ),
    );
  }
}

