import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class StarWidget extends StatefulWidget {
  final double size;

  const StarWidget({Key? key, required this.size}) : super(key: key);

  @override
  _StarWidgetState createState() => _StarWidgetState();
}

class _StarWidgetState extends State<StarWidget> {
  Color _currentColor = Colors.white38;
  late Timer _colorChangeTimer;

  @override
  void initState() {
    super.initState();
    _startColorChangeTimer();
  }

  @override
  void dispose() {
    _colorChangeTimer.cancel();
    super.dispose();
  }

  void _startColorChangeTimer() {
    _colorChangeTimer = Timer.periodic(
      Duration(milliseconds: getRandomDuration()),
      (timer) {
        setState(() {
          // Change the color after every random duration
          _currentColor = getRandomColor();
        });
      },
    );
  }

  Color getRandomColor() {
    final random = Random();
    return random.nextBool() ? Colors.white38 : Colors.white10;
  }

  int getRandomDuration() {
    final random = Random();
    return random.nextInt(2000) +
        1000; // Random duration between 500 and 1500 milliseconds
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: getRandomDuration()),
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentColor,
        ),
      ),
    );
  }
}
