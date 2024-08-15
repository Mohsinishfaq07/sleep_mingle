
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleDailyPick extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String image;
  final bool isHalf;
  final bool isPaid;
  SingleDailyPick({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.image,
    this.isHalf = false,
    required this.isPaid,
  });
  // AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width / 100;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              // audioPlayer.play(
              //     Source());
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 180,
              width: isHalf ? screenWidth * 47 : double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover, // Adjust this based on your needs
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isPaid
                      ? const Icon(
                          Icons.lock,
                          color: Colors.white,
                        )
                      : const SizedBox(),
                  const Icon(
                    CupertinoIcons.heart_circle,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          if (isHalf)
            SizedBox(
              width: screenWidth * 35,
              child: Text(
                text1,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          if (!isHalf)
            Text(
              text1,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          const SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text2,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                height: 4,
                width: 4,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                text3,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
