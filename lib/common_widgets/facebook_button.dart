import 'package:flutter/material.dart';

class FacebookButton extends StatelessWidget {
  final VoidCallback onPressed;
  final BuildContext context;
  final String title;

  const FacebookButton({
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
      icon: const Icon(
        Icons.facebook, // Use the FontAwesomeIcons.facebookF icon
        color: Colors.white,
      ),
      label: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        fixedSize: Size(width * 90, height * 6.3),
        // primary: greyColor,
        backgroundColor: Color.fromRGBO(24, 119, 242, 1),
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
    );
  }
}
