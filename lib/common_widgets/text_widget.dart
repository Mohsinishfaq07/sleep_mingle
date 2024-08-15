

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TextWidget extends StatelessWidget {
  String input;
  double fontSize;
  FontWeight fontWeight;
  Color textColor;


  TextWidget({Key? key, required this.input,required this.fontSize,required this.fontWeight,required this.textColor}):
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Text(input,
          textAlign: TextAlign.justify,
          //you can set font here of your choice
          style: GoogleFonts.cairo(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          )
      );
  }
}