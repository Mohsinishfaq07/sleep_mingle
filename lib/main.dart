import 'package:bettersleep/screens/welcome_screen/welcome_screen.dart';
import 'package:bettersleep/provider/sound_player_provider.dart';
import 'package:bettersleep/utils/colors.dart';
import 'package:bettersleep/utils/recording_time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Import your provider(s) here

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap MaterialApp with MultiProvider
    return MultiProvider(
      providers: [
        // List your providers here
        ChangeNotifierProvider(create: (_) => SoundPlayerProvider()),
        ChangeNotifierProvider(create: (_) => RecordingTimeProvider()),

        // You can add more providers as needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
          primarySwatch: Colors.deepPurple,
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}

