import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleTopItem extends StatelessWidget {
  final String image;
  final String name;
  const SingleTopItem({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            image,
            height: 80,
            fit: BoxFit.fitHeight,
          ),
        ),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
