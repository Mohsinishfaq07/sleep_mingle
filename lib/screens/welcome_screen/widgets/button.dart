// Generated by Dart Safe Data Class Generator. * Change this header on extension settings *
// ignore_for_file: type=lint
import 'package:flutter/material.dart';

import 'package:bettersleep/utils/colors.dart';

// ignore: must_be_immutable
class RoundButton extends StatelessWidget {
  Function() ontap;
  RoundButton({
    Key? key,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(shape: BoxShape.circle, color: whiteColor),
        child: Icon(
          Icons.arrow_forward_rounded,
          size: 40,
        ),
      ),
    );
  }
}
