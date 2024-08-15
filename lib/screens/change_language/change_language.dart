import 'package:bettersleep/common_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import '../../common_widgets/star_background.dart';
import '../../utils/colors.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  String selectedLanguage = 'English';
  final List<String> languages = [
    'English',
    'French',
    'Italian',
    'German',
    'Spanish',
    'Portuguese',
    'Chinese',
    'English',
    'French',
    'Italian',
    'German',
    'Spanish',
    'Portuguese',
    'Chinese',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:  CustomElevatedButton(width: 300,
        title: 'Save',
        onTap: () {},
      ),
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
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.06),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      )),
                ),

                const Text(
                  "Change Language",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Other widgets like header, IconButton, etc.
                Expanded(
                  // This makes ListView take all available space
                  child: ListView.builder(
                    itemCount: languages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.1)),
                          child: ListTile(
                            title: Text(languages[index],
                                style: const TextStyle(color: Colors.white)),
                            trailing: selectedLanguage == languages[index]
                                ? const Icon(Icons.check, color: Colors.white)
                                : null,
                            onTap: () => setState(
                                () => selectedLanguage = languages[index]),
                          ),
                        ),
                      );
                    },
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
