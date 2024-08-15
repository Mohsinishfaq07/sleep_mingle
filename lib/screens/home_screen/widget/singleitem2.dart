import 'package:bettersleep/common_widgets/star_background.dart';
import 'package:bettersleep/utils/colors.dart';
import 'package:flutter/material.dart';

class SingleItem2 extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String image;
  const SingleItem2({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient:
                LinearGradient(colors: skyColor2, begin: Alignment.topLeft),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (text1.length > 1)
                    Text(
                      text1,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  Text(
                    text2,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Text(
                    text3,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                   const SizedBox(height: 12,),
                  GestureDetector(
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: Center(
                        child: Text(
                          text4,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Image.asset(
            image,
            height: 90,
          ),
        ),
        const StarBackgroundSmall(),
      ],
    );
  }
}
