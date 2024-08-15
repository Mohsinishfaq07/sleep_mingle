import 'dart:async';

import 'package:bettersleep/common_widgets/star_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../provider/sound_player_provider.dart';
import '../utils/colors.dart';

class TimerDurationScreen extends StatefulWidget {
  const TimerDurationScreen({super.key});

  @override
  _TimerDurationScreenState createState() => _TimerDurationScreenState();
}

class _TimerDurationScreenState extends State<TimerDurationScreen> {
   Timer? _shutdownTimer;

   void handleTimerEnd() {
     // Stop all sounds when the timer ends
     context.read<SoundPlayerProvider>().pauseAllSounds().then((_) {
       // Close the app if the setting is enabled
       if (context.read<SoundPlayerProvider>().closeAppOnTimerEnd) {
         SystemNavigator.pop();
       }
     });
   }
   void startTimer(Duration duration) {
     if (_shutdownTimer != null) {
       _shutdownTimer!.cancel();
     }
     setState(() {
       _shutdownTimer = Timer(duration, handleTimerEnd);
     });
   }
  Map<String, Duration> timeMapping = {
    '2 hours': const Duration(hours: 2),
    '1 hour': const Duration(hours: 1),
    '45 minutes': const Duration(minutes: 45),
    '30 minutes': const Duration(minutes: 30),
    '20 minutes': const Duration(minutes: 20),
    '10 minutes': const Duration(minutes: 10),
    'Advance': const Duration(seconds:10 ) // Example for Advance
  };
  List<String> timerOptions = [
    '2 hours',
    '1 hour',
    '45 minutes',
    '30 minutes',
    '20 minutes',
    '10 minutes',
    'Advance',
  ];


  @override
  void dispose() {
    _shutdownTimer?.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
  final  soundProvider = Provider.of<SoundPlayerProvider>(context);
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
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 60),
                child: GestureDetector(
                    onTap: Navigator.of(context).pop,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
              ),
              const Text(
                "Timer Duration",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "All sound will gradually stops at the end",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 20,
                    childAspectRatio: 2,
                  ),
                  itemCount: timeMapping.keys.length,
                  itemBuilder: (context, index) {
                    String option = timeMapping.keys.elementAt(index);
                    return TimerOptionButton(
                      text: option,
                      onPressed: () => startTimer(timeMapping[option]!),
                      isFullWidth: false,
                    );
                  },
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SwitchListTile(
                  title: const Text('Close app when timer ends', style: TextStyle(color: Colors.white)),
                  value: soundProvider.closeAppOnTimerEnd,
                  onChanged: (bool value) {
                    soundProvider.setCloseAppOnTimerEnd(value);
                  },
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.purple,
                  activeColor: Colors.purple,
                  activeTrackColor: Colors.white,
                ),
              ),             const Divider(
                color: Colors.grey,
                thickness: 0.1,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class TimerOptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isFullWidth;

  const TimerOptionButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isFullWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // Add this line

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // Check if isFullWidth is true, then set width to screenWidth, otherwise let it be null
        width:
            isFullWidth ? screenWidth / 2 - 12 * 2 : null, // Updated this line
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.black],
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
