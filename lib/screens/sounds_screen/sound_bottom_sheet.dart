import 'package:bettersleep/common_widgets/star_background.dart';
import 'package:bettersleep/common_widgets/timer_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
 import 'package:provider/provider.dart';
import 'package:share/share.dart';
import '../sleep_tracking/sleep_tracking.dart';
import '../../provider/sound_player_provider.dart';
import '../../utils/colors.dart';
import '../../common_widgets/custom_elevated_button.dart';
import '../../common_widgets/favourite_bottom_sheet.dart';

class SoundBottomSheet extends StatefulWidget {
  final int? currentSoundIndex;
  final IconData? iconData;
  final List<Map<String, dynamic>> soundData;

  const SoundBottomSheet({
    Key? key,
    this.currentSoundIndex,
    this.iconData,
    required this.soundData,
  }) : super(key: key);

  @override
  State<SoundBottomSheet> createState() => _SoundBottomSheetState();
}

class _SoundBottomSheetState extends State<SoundBottomSheet> {
   int selectedHour = 0;
  int selectedMinute = 0;

  TextEditingController controller = TextEditingController();
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: skyColor,
                ),
              ),
            ),
            const StarBackground(),
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        "Name Your mix",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Name Your mix before adding it to your playlist",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        label: Text("Name"),
                        labelStyle: TextStyle(color: Colors.white),
                        focusColor: Colors.white,
                        alignLabelWithHint: true,
                      ),
                      cursorColor: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    CustomElevatedButton(
                      width: 200,
                      title: "Save",
                      onTap: () => _showTimePicker(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showTimePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Stack(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: skyColor,
                ),
              ),
            ),
            const StarBackground(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Select your duration:',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Hours Picker
                    Expanded(
                      child: CupertinoPicker(
                        diameterRatio: 100,
                        looping: true,
                        itemExtent: 60,
                        onSelectedItemChanged: (int index) {
                          setState(() {
                            selectedHour = index;
                          });
                        },
                        children: List<Widget>.generate(24, (int index) {
                          return Center(
                            child: Text(
                              '$index h',
                              style: TextStyle(
                                color: index == selectedHour
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 24,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    // Minutes Picker
                    Expanded(
                      child: CupertinoPicker(
                        itemExtent: 60,
                        onSelectedItemChanged: (int index) {
                          setState(() {
                            selectedMinute = index;
                          });
                        },
                        children: List<Widget>.generate(60, (int index) {
                          return Center(
                            child: Text(
                              '$index min',
                              style: TextStyle(
                                color: index == selectedMinute
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 24,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Button color
                      ),
                      child: const Text('Confirm',
                          style: TextStyle(color: Colors.black)),
                      // Text color
                      onPressed: () {
                        // Here, you can handle the confirmation action, like closing the bottom sheet
                        // and using the selectedHour and selectedMinute values as needed.
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ]),
            ),
          ]);
        });
  }
   BuildContext? _sheetContext;
   @override
   void didChangeDependencies() {
     super.didChangeDependencies();
     // Listen to playing sounds and close the bottom sheet if they are all stopped.
     var soundProvider = Provider.of<SoundPlayerProvider>(context);
     if (soundProvider.playingSounds.isEmpty && _sheetContext != null) {
       Navigator.of(_sheetContext!).pop();
       _sheetContext = null;  // Reset the context reference
     }
   }
  Widget buildCurrentlyPlayingSounds(BuildContext context) {
    var soundProvider = Provider.of<SoundPlayerProvider>(context);
    if (soundProvider.playingSounds.isEmpty) {
      return const Center(
          child: Text("No sounds are currently playing.",
              style: TextStyle(color: Colors.white)));
    }

    return SizedBox(
      height: 200,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: soundProvider.playingSounds.length,
          itemBuilder: (context, index) {
            SoundDetails sound = soundProvider.playingSounds[index];
            return Column(
              children: [
                Text(sound.soundName,
                    style: const TextStyle(color: Colors.white)),
                Row(
                  children: [
                    Stack(children: [
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
                            padding: const EdgeInsets.all(14.0),
                            child: Icon(sound.icon ?? Icons.music_note,
                                color: Colors.white,size: 24,),
                          )),
                      GestureDetector(
                        onTap: (){
                          soundProvider.removeSound(sound.filePath);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(30)),
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 16,
                            )),
                      ),
                    ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Slider(
                              thumbColor: Colors.purple.shade900,
                              value: sound.volume,
                              min: 0.0,
                              max: 1.0,
                              divisions: 100,
                              onChanged: (value) {
                                soundProvider.setVolumeForSound(
                                    sound.filePath, value);
                              }),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(6)),
                      child: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.electric_bolt_outlined,
                          color: Colors.white,
                          size: 19,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          })
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 10,
      title: Text(
        Provider.of<SoundPlayerProvider>(context).currentSoundName ??
            "No sound playing",
        style: const TextStyle(color: Colors.white),
      ),
      leading: IconButton(
        icon: const Icon(Icons.keyboard_arrow_down_sharp, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.menu_open, color: Colors.white),
          onPressed: () => _showBottomSheet(context),
        ),
        IconButton(
          icon: const Icon(Icons.share, color: Colors.white),
          onPressed: () => Share.share("Check out this app!"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var soundProvider = Provider.of<SoundPlayerProvider>(context, listen: true);
    return Scaffold(
      body: Stack(children: [
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
          padding: const EdgeInsets.all(12.0),
          child: Wrap(
            children: [
              _buildAppBar(),
              // CustomPlaylistWidget(
              //   title: 'BRAINWAVE ',
              //   subtitle: "You don't have any mix here",
              //   buttonText: 'ADD BRAINWAVE',
              //   buttonAction: () {
              //     // Your button action here
              //   },
              //   imagePath: 'assets/images/butterfly.png',
              //   title1: '0/15',
              //   width: 200,
              // ),
              // const Divider(
              //   color: Colors.grey,
              //   thickness: 0.2,
              // ),
              // CustomPlaylistWidget(
              //   title: 'Music ',
              //   subtitle: "You don't have any mix here",
              //   buttonText: 'ADD MUSIC',
              //   buttonAction: () {
              //     // Your button action here
              //   },
              //   imagePath: 'assets/images/butterfly.png',
              //   title1: '0/1',
              //   width: 200,
              // ),
              // const Divider(
              //   color: Colors.grey,
              //   thickness: 0.2,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Playing Sounds: ${soundProvider.numberOfPlayingSounds}',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white)),
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.electric_bolt_outlined,
                              color: Colors.white,
                              size: 19,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('All',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              buildCurrentlyPlayingSounds(context),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Container(
              //         decoration: BoxDecoration(
              //           gradient: const LinearGradient(
              //             begin: Alignment.topLeft,
              //             end: Alignment.bottomRight,
              //             colors: [
              //               Color(0xFFD2B48C), // Light Tan
              //               Color.fromARGB(255, 219, 120, 20), // Warm Brown
              //             ],
              //           ),
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         child: Padding(
              //           padding: const EdgeInsets.all(10.0),
              //           child: Icon(widget.iconData ?? Icons.music_note,
              //               color: Colors.white),
              //         )),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Text(
              //           Provider.of<SoundPlayerProvider>(context)
              //                   .currentSoundName ??
              //               "No sound playing",
              //           style: const TextStyle(color: Colors.white),
              //         ),
              //         Container(
              //           alignment: Alignment.centerLeft,
              //           width: MediaQuery.of(context).size.width * 0.7,
              //           child: Slider(
              //             thumbColor: Colors.purple.shade900,
              //             value: _volume,
              //             min: 0.0,
              //             max: 1.0,
              //             divisions: 100, // More divisions for finer control
              //             onChanged: (value) {
              //               setState(() => _volume = value);
              //               // Call setVolume on SoundPlayerProvider
              //               Provider.of<SoundPlayerProvider>(context,
              //                       listen: false)
              //                   .setVolume(value);
              //             },
              //           ),
              //         )
              //       ],
              //     ),
              //     const Icon(
              //       Icons.electric_bolt_outlined,
              //       color: Colors.white,
              //       size: 19,
              //     ),
              //   ],
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Visibility(
                  visible: soundProvider.playingSounds.isNotEmpty,
                  child: CustomElevatedButton(
                    title: 'Clear all',
                    width: double.infinity,
                    onTap: () {},
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.2,
              ),
              Visibility(
                visible: soundProvider.playingSounds.isNotEmpty,

                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.purple),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .black26, // Set the container's color
                                      borderRadius: BorderRadius.circular(
                                          30), // Match ClipRRect's borderRadius
                                    ),
                                    child: IconButton(
                                      icon: const Icon(Icons.alarm_sharp,
                                          color: Colors.white, size: 30),
                                      onPressed: () {
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const TimerDurationScreen();
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    "Add Timer ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .black26, // Set the container's color
                                      borderRadius: BorderRadius.circular(
                                          30), // Match ClipRRect's borderRadius
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Provider.of<SoundPlayerProvider>(context)
                                                .isSoundPlaying(widget.soundData[
                                                    widget.currentSoundIndex ??
                                                        0]['filePath'])
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                      onPressed: () {
                                        var soundProvider =
                                            Provider.of<SoundPlayerProvider>(
                                                context,
                                                listen: false);
                                        String currentSoundPath =
                                            widget.soundData[
                                                    widget.currentSoundIndex ?? 0]
                                                ['filePath'];

                                        if (soundProvider
                                            .isSoundPlaying(currentSoundPath)) {
                                          soundProvider.pauseAllSounds();
                                        } else {
                                          soundProvider.playAllSounds();
                                        }

                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(""),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .black26, // Set the container's color
                                      borderRadius: BorderRadius.circular(
                                          30), // Match ClipRRect's borderRadius
                                    ),
                                    child: IconButton(
                                      icon: const Icon(Icons.favorite_border,
                                          color: Colors.white, size: 30),
                                      onPressed: () {
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: false,
                                          backgroundColor: Colors
                                              .transparent, // Add this line to make background transparent
                                          builder: (BuildContext context) {
                                            // Use a Container with padding or a different widget to control the height dynamically
                                            return const FavouriteBottomSheet();
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    "Save Mix",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CustomElevatedButton(
                            title: "Track My Sleep",
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SleepTracking()));
                            },
                            width: 160,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
