import 'package:bettersleep/common_widgets/star_background.dart';
 import 'package:flutter/material.dart';
 import '../utils/colors.dart';

class AlarmBottomSheet extends StatefulWidget {
  const AlarmBottomSheet({super.key});

  @override
  State<AlarmBottomSheet> createState() => _AlarmBottomSheetState();
}

class _AlarmBottomSheetState extends State<AlarmBottomSheet> {
  bool switchValue = false; // Initial value for the switch

  void toggleSwitch(bool value) {
    // This function is called when the switch is toggled.
    setState(() {
      switchValue = value;
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 10,
                      bottom: 10,
                      right: 10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                const Center(
                  child: Text(
                    "Alarm",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.music_off_outlined,
                      color: Colors.white,
                      size: 14,
                    ),
                    SizedBox(width: 6),
                    Text(
                      "No alarm set",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(height: 6),

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white24),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       const Row(

                        children: [
                          Text(
                            "8:00",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "AM",
                            style: TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ],
                                                   ),
                       // Use the switchValue for the Switch's value parameter,
                       // and the toggleSwitch function for the onChanged parameter.
                       Switch(value: switchValue, onChanged: toggleSwitch),
                     ],
                                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
