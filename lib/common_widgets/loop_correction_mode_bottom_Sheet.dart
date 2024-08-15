 import 'package:bettersleep/common_widgets/star_background.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'custom_elevated_button.dart';
 class LoopCorrectionMode extends StatefulWidget {
   const LoopCorrectionMode({super.key});

   @override
   State<LoopCorrectionMode> createState() => _LoopCorrectionModeState();
 }

 class _LoopCorrectionModeState extends State<LoopCorrectionMode> {
   @override
   Widget build(BuildContext context) {
     return DraggableScrollableSheet(
       expand: false,
       builder: (_, controller) => Stack(
         children:[
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
             child: Container(
               decoration: const BoxDecoration(
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(20),
                     topRight: Radius.circular(20),
                   ),
                   ),
               child: Wrap(
                 children: [
                   Align(
                     alignment: Alignment.topRight,
                     child: Padding(
                       padding: const EdgeInsets.only(right: 12, top: 10),
                       child: GestureDetector(
                         onTap: () {
                           Navigator.of(context).pop();
                         },
                         child: const Icon(
                           Icons.close,
                           color: Colors.white,
                           size: 30,
                         ),
                       ),
                     ),
                   ),
                   const Padding(
                     padding: EdgeInsets.all(20.0),
                     child: Text(
                       "Clear Sleep Recordings",
                       style: TextStyle(color: Colors.white, fontSize: 24),
                     ),
                   ),
                   const Padding(
                     padding: EdgeInsets.all(20.0),
                     child: Text(
                       "Are you sure you want to delete all downloaded content? You will be able to download it back for free.",
                       style: TextStyle(color: Colors.white, fontSize: 14),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(20.0),
                     child: CustomElevatedButton(
                       title: "Clear",
                       onTap: () {
                         // Perform the clear action here
                       },
                       width: double.infinity,
                     ),
                   ),
                 ],
               ),
             ),
           ),
         ]
       ),
     );
   }
 }
