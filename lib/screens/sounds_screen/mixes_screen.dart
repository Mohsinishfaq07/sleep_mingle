import 'package:bettersleep/screens/home_screen/widget/daily_picks.dart';
import 'package:bettersleep/utils/colors.dart';
import 'package:bettersleep/utils/global_variables.dart';
import 'package:flutter/material.dart';

class MixesScreen extends StatelessWidget {
  const MixesScreen({super.key});

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
                "My Favorites Mixes",
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
                "Unwind with your own personal selection of fovorite sounds.",
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
              itemCount: 1,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index + 4][0],
                  text2: sleepAids[index + 4][1],
                  text3: sleepAids[index + 4][2],
                  image: sleepAids[index + 4][3],
                  isPaid: sleepAids[index + 4][4],
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
                "Starter Mixes",
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
                "Top for a quick fix or visit the sounds tab to personalize your listening experience.",
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
                "Sound journeys to Latin America",
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
                "Enjoy our customizable mixes using sounds from Central and South America.",
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
                "Sleepy Escapes",
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
                "Let us take you to slumber with our handpicked sounds.",
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
              itemCount: sleepAids.length - 4,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index + 4][0],
                  text2: sleepAids[index + 4][1],
                  text3: sleepAids[index + 4][2],
                  image: sleepAids[index + 4][3],
                  isPaid: sleepAids[index + 4][4],
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
                "Relax Your mind",
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
                "Find relaxation and peace with our expertly crafted sounds.",
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
              itemCount: sleepAids.length - 4,
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
                "Bedtime soundscape",
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
              itemCount: sleepAids.length - 4,
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
                "Dreamland Journeys",
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
                "Join us on a trip to sweet dreams with these dynamic soundscapes using our Smart Mix technology.",
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
              itemCount: sleepAids.length - 4,
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
                "Comunity favourites",
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
                "Discover teh most beloved sounds of the $appName Community.",
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
              itemCount: sleepAids.length - 4,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index + 4][0],
                  text2: sleepAids[index + 4][1],
                  text3: sleepAids[index + 4][2],
                  image: sleepAids[index + 4][3],
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
                "Recent Comunity Mixes",
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
                "Discover a world of restful sounds crafted by your fellow sleepers.",
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
              itemCount: sleepAids.length - 4,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 15, left: 15),
                child: SingleDailyPick(
                  text1: sleepAids[index + 4][0],
                  text2: sleepAids[index + 4][1],
                  text3: sleepAids[index + 4][2],
                  image: sleepAids[index + 4][3],
                  isPaid: sleepAids[index + 4][4],
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
