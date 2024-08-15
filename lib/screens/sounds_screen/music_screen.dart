import 'package:bettersleep/screens/home_screen/widget/daily_picks.dart';
import 'package:bettersleep/utils/colors.dart';
import 'package:bettersleep/utils/global_variables.dart';
import 'package:flutter/material.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width / 100;

    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Top 10",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 300,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index][0],
                  text2: sleepAids[index][1],
                  text3: sleepAids[index][2],
                  image: sleepAids[index][3],
                  isPaid: sleepAids[index][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Joe Krby's \"A Far Away Island\"",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "An ambient and dreamlike piano soundscape experience.",
                style: TextStyle(
                  color: lightWhiteColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length - 2,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index + 2][0],
                  text2: sleepAids[index + 2][1],
                  text3: sleepAids[index + 2][2],
                  image: sleepAids[index + 2][3],
                  isPaid: sleepAids[index + 2][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Daylight Savings",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Music to help you fall asleep early and adapt to the time change.",
                style: TextStyle(
                  color: lightWhiteColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length - 1,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index + 1][0],
                  text2: sleepAids[index + 1][1],
                  text3: sleepAids[index + 1][2],
                  image: sleepAids[index + 1][3],
                  isPaid: sleepAids[index + 1][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Delta Brainwave Music",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length - 2,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index + 2][0],
                  text2: sleepAids[index + 2][1],
                  text3: sleepAids[index + 2][2],
                  image: sleepAids[index + 2][3],
                  isPaid: sleepAids[index + 2][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Orchestral Magic",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index][0],
                  text2: sleepAids[index][1],
                  text3: sleepAids[index][2],
                  image: sleepAids[index][3],
                  isPaid: sleepAids[index][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Jazz Piano",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length - 2,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index + 2][0],
                  text2: sleepAids[index + 2][1],
                  text3: sleepAids[index + 2][2],
                  image: sleepAids[index + 2][3],
                  isPaid: sleepAids[index + 2][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Lofi Beats",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index][0],
                  text2: sleepAids[index][1],
                  text3: sleepAids[index][2],
                  image: sleepAids[index][3],
                  isPaid: sleepAids[index][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Iroquoian FLute",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length - 3,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index + 3][0],
                  text2: sleepAids[index + 3][1],
                  text3: sleepAids[index + 3][2],
                  image: sleepAids[index + 3][3],
                  isPaid: sleepAids[index + 3][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Brainwave music for wellness",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index][0],
                  text2: sleepAids[index][1],
                  text3: sleepAids[index][2],
                  image: sleepAids[index][3],
                  isPaid: sleepAids[index][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Classical Piano",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index][0],
                  text2: sleepAids[index][1],
                  text3: sleepAids[index][2],
                  image: sleepAids[index][3],
                  isPaid: sleepAids[index][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Healing Soundbaths",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index][0],
                  text2: sleepAids[index][1],
                  text3: sleepAids[index][2],
                  image: sleepAids[index][3],
                  isPaid: sleepAids[index][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Blissful 3D Sleep Mixes",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index][0],
                  text2: sleepAids[index][1],
                  text3: sleepAids[index][2],
                  image: sleepAids[index][3],
                  isPaid: sleepAids[index][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "New releases",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index][0],
                  text2: sleepAids[index][1],
                  text3: sleepAids[index][2],
                  image: sleepAids[index][3],
                  isPaid: sleepAids[index][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Popular Playlists",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index][0],
                  text2: sleepAids[index][1],
                  text3: sleepAids[index][2],
                  image: sleepAids[index][3],
                  isPaid: sleepAids[index][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "\"Flight insominia\" Starter Pack",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index][0],
                  text2: sleepAids[index][1],
                  text3: sleepAids[index][2],
                  image: sleepAids[index][3],
                  isPaid: sleepAids[index][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Focus Flow",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index][0],
                  text2: sleepAids[index][1],
                  text3: sleepAids[index][2],
                  image: sleepAids[index][3],
                  isPaid: sleepAids[index][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Healing Music",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index][0],
                  text2: sleepAids[index][1],
                  text3: sleepAids[index][2],
                  image: sleepAids[index][3],
                  isPaid: sleepAids[index][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Deep Sleep",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index][0],
                  text2: sleepAids[index][1],
                  text3: sleepAids[index][2],
                  image: sleepAids[index][3],
                  isPaid: sleepAids[index][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Yoga and Meditation",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index][0],
                  text2: sleepAids[index][1],
                  text3: sleepAids[index][2],
                  image: sleepAids[index][3],
                  isPaid: sleepAids[index][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Baby Bedtime",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index][0],
                  text2: sleepAids[index][1],
                  text3: sleepAids[index][2],
                  image: sleepAids[index][3],
                  isPaid: sleepAids[index][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Peaceful Piano",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index][0],
                  text2: sleepAids[index][1],
                  text3: sleepAids[index][2],
                  image: sleepAids[index][3],
                  isPaid: sleepAids[index][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Relaxing Acoustic Collection",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 280,
            width: screenWidth * 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sleepAids.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index][0],
                  text2: sleepAids[index][1],
                  text3: sleepAids[index][2],
                  image: sleepAids[index][3],
                  isPaid: sleepAids[index][4],
                  isHalf: true,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
