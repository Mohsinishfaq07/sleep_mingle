import 'package:bettersleep/common_widgets/star_background.dart';
import 'package:bettersleep/screens/home_screen/widget/SaleBanner.dart';
import 'package:bettersleep/screens/home_screen/widget/SingletTopItem.dart';
import 'package:bettersleep/screens/home_screen/widget/daily_picks.dart';
import 'package:bettersleep/screens/home_screen/widget/singleitem2.dart';
import 'package:bettersleep/screens/home_screen/widget/top_rated.dart';
import 'package:bettersleep/utils/colors.dart';
import 'package:bettersleep/utils/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: skyColor,
            ),
          ),
        ),
        const StarBackground(),
        SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.search_outlined,
                    color: lightWhiteColor,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Icon(
                    CupertinoIcons.heart,
                    color: lightWhiteColor,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                // width: 1000,
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:   const [
                    SingleTopItem(
                        image: 'assets/image/sleepTales.jpeg', name: "SleepTales"),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      child: SingleTopItem(
                          image: 'assets/image/mixes.jpeg', name: "Mixes"),
                    ),
                    SingleTopItem(
                        image: 'assets/image/musiccc.PNG', name: "Music"),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      child: SingleTopItem(
                          image: 'assets/image/breath.PNG', name: "Breathe"),
                    ),
                    SingleTopItem(
                        image: 'assets/image/meditation.PNG', name: "Meditations"),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      child: SingleTopItem(
                          image: 'assets/image/mov.PNG', name: "SleepMoves"),
                    ),
                  ],
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 220.0,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    // Handle page change
                  },
                ),
                items: singleItem2.map((list) {
                  return Builder(
                    builder: (BuildContext context) {
                      return SingleItem2(
                        text1: list[0],
                        text2: list[1],
                        text3: list[2],
                        text4: list[3],
                        image: list[4],
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Daily Picks",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: false,
                  height: 280,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    // Handle page change
                  },
                ),
                items: dailyPicks.map((list) {
                  return Builder(
                    builder: (BuildContext context) {
                      return SingleDailyPick(
                        text1: list[0],
                        text2: list[1],
                        text3: list[2],
                        image: list[3],
                        isPaid: list[4],
                      );
                    },
                  );
                }).toList(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: SizedBox(
                  // height: 200,
                  child: SingleItem2(
                    text1: '',
                    text2: "Early Bedtime Meditation",
                    text3: "Ease into Daylight Savings With an early bedtime.",
                    text4: "Sleep now",
                    image: 'assets/images/owl.png',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Sleep aids for Daylight Savings",
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
                    "Reclaim your rest with our soothing library.",
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleDailyPick(
                  text1: dailyPicks[2][0],
                  text2: dailyPicks[2][1],
                  text3: dailyPicks[2][2],
                  image: dailyPicks[2][3],
                  isPaid: dailyPicks[2][4],
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
                    "Because you like meditation & hypnosis",
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
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Recently Played",
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
                  itemCount: 1,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(right: 15, left: 15),
                    child: SingleDailyPick(
                      text1: sleepAids[index + 5][0],
                      text2: sleepAids[index + 5][1],
                      text3: sleepAids[index + 5][2],
                      image: sleepAids[index + 5][3],
                      isPaid: sleepAids[index + 5][4],
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
                    "Top 5 Rated",
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
              for (int i = 0; i < 5; i++)
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleTopRated(
                    isFirst: i == 0 ? true : false,
                    text1: sleepAids[i][0],
                    text2: sleepAids[i][1],
                    text3: sleepAids[i][2],
                    image: sleepAids[i][3],
                    isPaid: sleepAids[i][4],
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
                    "Recently Added",
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
                  itemCount: sleepAids.length - 3,
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
                    "Soundscapes",
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
                    "Close your eyes, listen, and dive into a new world...",
                    style: TextStyle(
                      fontSize: 18,
                      color: lightWhiteColor,
                    ),
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
                  itemCount: sleepAids.length - 3,
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
                    "Special Offer",
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 240,
                child: const SaleBanner(sale: '30'),
              ),
              const SizedBox(
                height: 50,
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
                height: 30,
              ),
              SizedBox(
                height: 300,
                width: screenWidth * 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sleepAids.length - 3,
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
                    "Sleep Hypnosis",
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
                  itemCount: sleepAids.length - 3,
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
                // height: 199,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
