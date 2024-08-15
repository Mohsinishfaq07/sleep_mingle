import 'package:bettersleep/common_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import '../common_widgets/star_background.dart';
import '../utils/colors.dart';

class SupportCode extends StatefulWidget {
  const SupportCode({super.key});

  @override
  State<SupportCode> createState() => _SupportCodeState();
}

class _SupportCodeState extends State<SupportCode> {
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
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 10,
                        bottom: 10,
                        right: 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  const Text(
                    "Support Code",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TextField(),
                  const SizedBox(height: 20),
                  CustomElevatedButton(
                      title: "Activate", width: double.infinity, onTap: () {})
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
