// import 'package:bettersleep/common_widgets/star_background.dart';
//  import 'package:flutter/material.dart';
// import '../utils/colors.dart';
// import 'custom_elevated_button.dart';
//
// class RateExceedSleep extends StatefulWidget {
//   const RateExceedSleep({super.key});
//
//   @override
//   State<RateExceedSleep> createState() => _RateExceedSleepState();
// }
//
// class _RateExceedSleepState extends State<RateExceedSleep> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: skyColor,
//               ),
//             ),
//           ),
//           const StarBackground(),
//           Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
//              children: [
//                Align(
//                  alignment: Alignment.topRight,
//                  child: Padding(
//                    padding: const EdgeInsets.only(right: 12, top: 10),
//                    child: GestureDetector(
//                      onTap: () {
//                        Navigator.of(context).pop();
//                      },
//                      child: const Icon(
//                        Icons.close,
//                        color: Colors.white,
//                        size: 30,
//                      ),
//                    ),
//                  ),
//                ),
//                const Padding(
//                  padding: EdgeInsets.all(10.0),
//                  child: Text(
//                    "Do you Love Exceed Sleep",
//                    style: TextStyle(color: Colors.white, fontSize: 24),
//                  ),
//                ),
//                CustomElevatedButton(title: "Yes", onTap: () {}, width: double.infinity),
//                Padding(
//                  padding: const EdgeInsets.symmetric(vertical: 2.0),
//                  child: CustomElevatedButton(
//                    title: "No",
//                    onTap: () {
//                      // Perform the clear action here
//                    },
//                    width: double.infinity,
//                  ),
//                ),
//                SizedBox(),
//               ],
//            ),
//                       ),
//         ],
//
//     );
//   }
// }
