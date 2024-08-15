import 'package:flutter/material.dart';

class SingleResourceButton extends StatelessWidget {
  final String name;
  final String? time;
  final String position;
  final bool isSwitch;
  final VoidCallback ontap;
  const SingleResourceButton(
      {super.key,
      required this.name,
      this.time,
      required this.position,
        required this.ontap,
      this.isSwitch = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: position == "top"
              ? const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))
              : position == "bottom"
                  ? const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))
                  : BorderRadius.circular(0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              Text(
                time ?? "",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 5,
              ),
              isSwitch
                  ? SizedBox(
                      height: 5,
                      child: Switch(value: true, onChanged: (value) {}))
                  : const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
