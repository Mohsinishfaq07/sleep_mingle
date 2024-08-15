import 'package:bettersleep/common_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:bettersleep/screens/home_screen/home_screen.dart';
import 'package:bettersleep/screens/profile_screen/profile_screen.dart';
import 'package:bettersleep/screens/sounds_screen/sounds_screen_main.dart';
import 'package:flutter/services.dart';
import '../journal_screen/journal_screen.dart';
import '../sleep_tracking/sleep_tracking.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  // Build the screens for each tab here
  final List<Widget> _screens = [
    const HomeScreen(),
    const SoundsScreen(),
    Container(),
    const JournalScreen(), // Placeholder for another screen
    const ProfileScreen(),
  ];
  void _onItemTapped(int index) {
    if (index == 2) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return const SleepTracking();
        },
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Show the exit confirmation dialog
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.purple,
            title: const Text(
              'Exit App',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontSize: 20),
            ),
            content: const Text(
              'Do you really want to exit the app?',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            actions: [
              CustomElevatedButton(
                  title: "No",
                  onTap: () {
                    Navigator.of(context).pop(false); // Do not exit the app
                  }),
              CustomElevatedButton(
                  title: "Yes",
                  onTap: () {
                    Navigator.of(context).pop(true);
                    SystemNavigator.pop(); // Exit the app
                  })
            ],
          ),
        );
        return shouldPop ?? false;
      },
      child: Scaffold(
        body: _screens[_selectedIndex], // Display the selected screen
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _onItemTapped(2); // middle item index
          },
          backgroundColor: Colors.purple,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            side: BorderSide(color: Colors.purple), // Border width and color
          ),
          child: const Icon(
            Icons.mic,
            size: 40,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height *
              0.1, // Set the height of the BottomAppBar
          color: Colors.black,
          child: BottomAppBar(
            color: Colors.black, // BottomAppBar background color
            shape: const CircularNotchedRectangle(),
            elevation: 0, // Removes shadow
            child: Row(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildIcon(Icons.home_outlined, "Home", 0),
                _buildIcon(Icons.music_note, "Sounds", 1),
                // const SizedBox(width: 10), // Space for floating action button
                _buildIcon(Icons.insert_chart_outlined, "Journal", 3),
                _buildIcon(Icons.person, "Profile", 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(IconData iconData, String text, int index) {
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            color: _selectedIndex == index ? Colors.white : Colors.grey,
            size: 24,
          ),
          Text(text,
              style: TextStyle(
                  color: _selectedIndex == index ? Colors.purple : Colors.grey,
                  fontSize: 12))
        ],
      ),
    );
  }
}
