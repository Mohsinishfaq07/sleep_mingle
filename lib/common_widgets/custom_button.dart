import 'package:bettersleep/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final BuildContext context;
  final bool haveIcon;
  final IconData icon;
  final double iconSize;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.context,
    this.haveIcon = false,
    this.icon = Icons.person_outline,
    this.iconSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: whiteColor,
        fixedSize: Size(width * 90, (height * 3) + 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (haveIcon)
              Icon(
                icon,
                size: iconSize,
                color: Colors.black,
              ),
            if (haveIcon)
              SizedBox(
                width: width * 2,
              ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
