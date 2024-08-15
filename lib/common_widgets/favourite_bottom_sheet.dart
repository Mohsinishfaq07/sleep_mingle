import 'package:bettersleep/common_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class FavouriteBottomSheet extends StatelessWidget {
  const FavouriteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.purple,
            Colors.black12,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30,
                      )),
                )),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Name Your Mix",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                // Label text to be displayed above the TextFormField when focused and as placeholder when TextFormField is empty and unfocused
                labelText: 'Your Name',
                // Hint text to be displayed inside the TextFormField as a placeholder
                hintText: 'Enter your name',
                // Optional: Add an icon to the left of the TextFormField
                // Optional: Style the label text
                labelStyle: TextStyle(
                  color: Colors.purple,
                ),
                // Optional: Style the hint text
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                // Optional: Add a border to the TextFormField
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomElevatedButton(
                title: "close",
                onTap: () {},
                width: double.infinity,
              ),
            )
          ],
        ),
      ),
    );
  }
}
