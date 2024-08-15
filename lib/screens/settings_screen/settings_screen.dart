import 'package:bettersleep/common_widgets/clear_download_bottom_Sheet.dart';
import 'package:bettersleep/common_widgets/loop_correction_mode_bottom_Sheet.dart';
import 'package:bettersleep/common_widgets/star_background.dart';
import 'package:bettersleep/screens/change_language/change_language.dart';
import 'package:bettersleep/screens/profile_screen/widgets/sinlge_resourse_button.dart';
import 'package:bettersleep/screens/settings_screen/widgets/subscription_button.dart';
import 'package:bettersleep/screens/support_code.dart';
import 'package:bettersleep/utils/colors.dart';
import 'package:bettersleep/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';
import '../../common_widgets/clear_sleep_recording_bottom_sheet.dart';
import '../my_data/my_data.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final RateMyApp rateMyApp = RateMyApp(
      minDays: 0,
      minLaunches: 0,
      appStoreIdentifier: "",
      // googlePlayIdentifier: "sld.hymnesetlouanges.com");
      googlePlayIdentifier: "");

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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.1),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            ))
                      ],
                    ),
                  ),
                  const Text(
                    "Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SubscriptionButton(),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleResourceButton(
                    name: "Change Language",
                    position: "top",
                    ontap: () {
                      Navigator.of(context).push(createRightToLeftRoute(
                          const ChangeLanguage(), const RouteSettings()));
                    },
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SingleResourceButton(
                    name: "My Data",
                    position: "none",
                    ontap: () {
                      Navigator.of(context).push(createRightToLeftRoute(
                          const MyData(), const RouteSettings()));
                    },
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SingleResourceButton(
                    name: "Clear Downloads",
                    position: "none",
                    ontap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled:
                            true, // Add this line to make background transparent
                        builder: (BuildContext context) {
                          // Use a Container with padding or a different widget to control the height dynamically
                          return const ClearDownloadBottomSheet();
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SingleResourceButton(
                    name: "Clear Sleep Recordings",
                    position: "none",
                    ontap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled:
                            true, // Add this line to make background transparent
                        builder: (BuildContext context) {
                          // Use a Container with padding or a different widget to control the height dynamically
                          return const ClearSleepRecording();
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SingleResourceButton(
                    name: "Audio Focus",
                    position: "none",
                    isSwitch: true,
                    ontap: () {},
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SingleResourceButton(
                    name: "Loop Correction Mode",
                    position: "none",
                    ontap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled:
                            true, // Add this line to make background transparent
                        builder: (BuildContext context) {
                          // Use a Container with padding or a different widget to control the height dynamically
                          return const LoopCorrectionMode();
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SingleResourceButton(
                    name: "Use Support Code",
                    position: "bottom",
                    ontap: () {
                      Navigator.of(context).push(createRightToLeftRoute(
                          const SupportCode(), const RouteSettings()));
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "More",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleResourceButton(
                    name: "Help & Support",
                    position: "top",
                    ontap: () {},
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SingleResourceButton(
                    name: "Rate $appName",
                    position: "none",
                    ontap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          // Here you define the content of your bottom sheet
                          return Container(
                            color: Colors.white, // Replace with your desired color
                            height: 200, // Replace with desired height
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Text('Do you love this app?', style: TextStyle(color: Colors.black)),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Launch the app page in Google Play or App Store
                                      rateMyApp.launchStore();
                                      Navigator.pop(context); // Close the bottom sheet
                                    },
                                    child: const Text('Rate'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // User chose to rate later
                                      rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed);
                                      Navigator.pop(context); // Close the bottom sheet
                                    },
                                    child: const Text('Maybe Later'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // User refused to rate the app
                                      rateMyApp.callEvent(RateMyAppEventType.noButtonPressed);
                                      Navigator.pop(context); // Close the bottom sheet
                                    },
                                    child: const Text('No Thanks'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SingleResourceButton(
                    name: "Terms of Service",
                    position: "none",
                    ontap: () {},
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SingleResourceButton(
                    name: "Privacy Policy",
                    position: "none",
                    ontap: () {},
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SingleResourceButton(
                    name: "About",
                    position: "bottom",
                    ontap: () {},
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
