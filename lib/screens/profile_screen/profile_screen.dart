import 'package:bettersleep/common_widgets/star_background.dart';
import 'package:bettersleep/screens/bed_time_goal_screen.dart';
import 'package:bettersleep/screens/profile_screen/widgets/chronotype_button.dart';
import 'package:bettersleep/screens/profile_screen/widgets/register_button.dart';
import 'package:bettersleep/screens/profile_screen/widgets/sinlge_resourse_button.dart';
import 'package:bettersleep/screens/settings_screen/settings_screen.dart';
import 'package:bettersleep/utils/colors.dart';
import 'package:bettersleep/utils/global_variables.dart';
import 'package:flutter/material.dart';

import '../sleep_goals.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(createRightToLeftRoute(
                                const SettingsScreen(), const RouteSettings()));
                          },
                          icon: const Icon(
                            Icons.settings_outlined,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                    CircleAvatar(
                    backgroundColor: Colors.white12,
                    radius: 55,
                    child:  Image.asset("assets/images/butterfly.png"),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02),                    child: const Text(
                      "Sleeper",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 26,
                      ),
                    ),
                  ),

                  const ChronotypeButton(),
                  const SizedBox(
                    height: 10,
                  ),
                  const RegisterButton(),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "$appName Resources",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SingleResourceButton(
                    name: "Sleep Goal",
                    position: "top",
                    time: "8h",
                    ontap: () {

                      Navigator.of(context).push(createRightToLeftRoute(
                            const SleepGoalSlider(), const RouteSettings()));
                    },
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SingleResourceButton(
                    name: "Bedtime goal",
                    position: "none",
                    time: "Set",
                    ontap: () {
                      Navigator.of(context).push(createRightToLeftRoute(
                          const BedTimeGoalScreen(), const RouteSettings()));



                    },
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SingleResourceButton(
                    name: "Alarm",
                    position: "none",
                    time: "8:00AM",
                    ontap: () {},
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SingleResourceButton(
                    name: "Help & Support",
                    position: "bottom",
                    ontap: () {},
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
