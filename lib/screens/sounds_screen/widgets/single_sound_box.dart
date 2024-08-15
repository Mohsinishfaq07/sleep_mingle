import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/sound_player_provider.dart';
import 'dart:math' as math;


class SingleSoundBox extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isPaid;
  final VoidCallback onTap;
  final bool isPlaying;
  final VoidCallback toggleAnimation;
  final String filePath;
  final Color iconColor;

  const SingleSoundBox({
    Key? key,
    required this.text,
    required this.icon,
    required this.isPaid,
    required this.onTap,
    required this.isPlaying,
    required this.toggleAnimation,
    required this.filePath,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  State<SingleSoundBox> createState() => _SingleSoundBoxState();
}

class _SingleSoundBoxState extends State<SingleSoundBox> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late AudioPlayer _audioPlayer;

   @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _controller = AnimationController(
     animationBehavior: AnimationBehavior.normal,
      vsync: this,
      duration: const Duration(seconds:12),
      reverseDuration: const Duration(seconds:12),

    );


    _controller.repeat(reverse: true,); // Start the animation

    final provider = Provider.of<SoundPlayerProvider>(context, listen: false);
    if (provider.isSoundPlaying(widget.filePath)) {
      _controller.repeat();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final provider = Provider.of<SoundPlayerProvider>(context);
    if (provider.isSoundPlaying(widget.filePath)) {
      if (!_controller.isAnimating) {
        _controller.repeat();
      }
    } else {
      _controller.stop();
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  Color getIconColor() {
    final provider = Provider.of<SoundPlayerProvider>(context, listen: false);
    if (provider.isSoundPlaying(widget.filePath)) {
      return Colors.yellow.shade400;  // Playing color
    } else if (provider.isSoundPaused(widget.filePath)) {
      return Colors.yellow.shade600;  // Paused color
    }
    return Colors.white;  // Default color
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SoundPlayerProvider>(context);
    Color iconColor = getIconColor();

    return GestureDetector(
      onTap: () async {
        widget.onTap();
        await provider.toggleSound(widget.filePath, widget.text);
        if (provider.isSoundPlaying(widget.filePath)) {
          _controller.repeat();
        } else {
          _controller.stop();
          _controller.reset();
        }
        setState(() {});
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
              angle: math.sin(_controller.value*2*math.pi), // Rotate animation
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 65,
                      width: 70,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        boxShadow: provider.isSoundPlaying(widget.filePath)
                            ? [
                          BoxShadow(
                            color: Colors.yellow.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ]
                            : null,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFD2B48C), // Light Tan
                            Color.fromARGB(255, 219, 120, 20), // Warm Brown
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        widget.icon,
                        size: 37,
                        color: iconColor,
                      ),
                    ),
                    if (widget.isPaid)
                      const Positioned(
                        top: 3,
                        right: 3,
                        child: CircleAvatar(
                          radius: 12.5,
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.lock,
                            color: Colors.white,
                            size: 13,
                          ),
                        ),
                      )
                  ],
                ),
                Flexible(
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
