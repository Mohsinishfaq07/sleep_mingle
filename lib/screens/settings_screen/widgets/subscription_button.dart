import 'package:bettersleep/utils/colors.dart';
import 'package:flutter/material.dart';

class SubscriptionButton extends StatelessWidget {
  const SubscriptionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Subscription",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Free",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 40,
              width: 90,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // Colors.black,
                    primaryColor,
                    Colors.blue,
                    Colors.white,
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Upgrade",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
