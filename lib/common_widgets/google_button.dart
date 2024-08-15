import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final BuildContext context;
  final String title;

  const GoogleButton({
    Key? key,
    required this.onPressed,
    required this.context,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;

    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Image.asset(
        'assets/images/Google Logo.png',
        height: height * 2.5,
      ),
      label: Text(
        title,
        style: const TextStyle(color: Colors.black, fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: Colors.black12.withOpacity(0.08))),
        fixedSize: Size(width * 90, height * 6.3),
        // primary: co,
        backgroundColor: Colors.white,

        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
    );
  }
}
