import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import '../utils/global_variables.dart';

class SoundPlayerProvider with ChangeNotifier {
  Timer? _shutdownTimer;
  void scheduleStop(Duration duration) {
    _shutdownTimer?.cancel(); // Cancel any existing timer
    _shutdownTimer = Timer(duration, pauseAllSounds);
  }

  final Map<String, bool> _isPlaying = {};
  final Map<String, AudioPlayer> _players = {};
  String? _currentPlaying;
  String? _currentSoundName;
  String? get currentSoundName => _currentSoundName;
  int? _currentSoundIndex;
  int? get currentSoundIndex => _currentSoundIndex;
  String? get currentPlaying => _currentPlaying;
  Timer? _loopTimer;
  List<SoundDetails> playingSounds = [];
  late bool _anyActiveSound =
      false; // This tracks if any sound has been interacted with

  bool get anyActiveSound => _anyActiveSound;
  Future<void> setVolumeForSound(String filePath, double volume) async {
    var player = _players[filePath];
    if (player != null) {
      await player.setVolume(volume);
      playingSounds.firstWhere((sound) => sound.filePath == filePath).volume =
          volume;
      notifyListeners();
    }
  }

  // Future<void> setVolume(double volume) async {
  //   // Assuming _players is a Map<String, AudioPlayer> holding your audio player instances
  //   for (AudioPlayer player in _players.values) {
  //     await player.setVolume(volume);
  //   }
  //   // Optionally, store the volume level in the provider if you want to remember it
  //   // _currentVolume = volume;
  //   notifyListeners(); // If you want UI components to react to the volume change
  // }

  void setCurrentSoundIndex(int index) {
    _currentSoundIndex = index;
    notifyListeners();
  }

  Future<void> toggleSound(String filePath, String soundName,
      [IconData? icon]) async {
    var player = _players[filePath];
    if (player == null) {
      player = AudioPlayer();
      _players[filePath] = player;
      player.onPlayerStateChanged.listen((state) {
        _isPlaying[filePath] = state == PlayerState.playing;
        if (state == PlayerState.completed) {
          _isPlaying[filePath] = false;
          playingSounds.removeWhere((sound) => sound.filePath == filePath);
        }
        notifyListeners();
      });
    }

    final isCurrentlyPlaying = _isPlaying[filePath] ?? false;
    if (isCurrentlyPlaying) {
      await player.pause();
      _isPlaying[filePath] = false;
    } else {
      await player.setReleaseMode(ReleaseMode.loop);
      await player.play(AssetSource(filePath));
      _isPlaying[filePath] = true;
      if (!playingSounds.any((sound) => sound.filePath == filePath)) {
        playingSounds.add(
            SoundDetails(filePath: filePath, soundName: soundName, icon: icon));
      }
    }
    notifyListeners();
  }

  AudioPlayer _getOrCreatePlayer(String filePath) {
    return _players.putIfAbsent(filePath, () => AudioPlayer());
  }

  bool isSoundPlaying(String filePath) {
    return _isPlaying[filePath] ?? false;
  }

  @override
  void dispose() {
    // Cancels any running timers to avoid them running after the provider is disposed.
    _loopTimer?.cancel();

    // Disposes each audio player to release system resources.
    for (var player in _players.values) {
      player.dispose();
    }

    // Clear the map to ensure all references to the audio players are released.
    _players.clear();

    // Calls the dispose method of the superclass to clean up any additional resources.
    super.dispose();
  }

  Future<void> playAllSounds() async {
    for (var filePath in _players.keys) {
      if (!(_isPlaying[filePath] ?? false)) {
        await playSound(
            filePath,
            playingSounds
                .firstWhere((sound) => sound.filePath == filePath)
                .soundName);
      }
    }
  }

  Future<void> playSound(String filePath, String soundName,
      [IconData? icon]) async {
    final player = _getOrCreatePlayer(filePath);
    await player.play(AssetSource(filePath));
    _isPlaying[filePath] = true;
    playingSounds.add(SoundDetails(
        filePath: filePath, soundName: soundName, icon: icon, volume: 1.0));
    notifyListeners();
  }

  Future<void> pauseAllSounds() async {
    for (var player in _players.values) {
      if (player.state == PlayerState.playing) {
        await player.pause();
      }
    }
    notifyListeners();
  }

  bool isSoundPaused(String filePath) {
    return _players[filePath]?.state == PlayerState.paused;
  }

  void removeSound(String filePath) {
    // Stop the sound if it's playing
    if (_players.containsKey(filePath)) {
      _players[filePath]
          ?.stop(); // Using stop to ensure the sound is fully stopped
      _players.remove(
          filePath); // Optionally remove the player if not needed anymore
    }

    // Remove the sound from the playing list
    playingSounds.removeWhere((sound) => sound.filePath == filePath);

    // Notify listeners about the update
    notifyListeners();
  }

  int get numberOfActiveSounds {
    return _isPlaying
        .length; // This assumes that all sounds that have been interacted with are in the map
  }

  int get numberOfPlayingSounds {
    // Count how many entries in _isPlaying map are true
    return _isPlaying.values.where((isPlaying) => isPlaying).length;
  }

  void addSound(String filePath) {
    var foundSound =
        soundData.firstWhere((sound) => sound['filePath'] == filePath,
            orElse: () => {
                  'name': 'Unknown', // Provide default values
                  'icon': Icons.help, // Default icon if none found
                  'filePath': filePath,
                  'volume': 1.0
                });

    // Now foundSound is guaranteed to be non-null
    var newSoundDetails = SoundDetails(
        filePath: filePath,
        soundName: foundSound['name'],
        icon: foundSound['icon'],
        volume: 1.0);
    playingSounds.add(newSoundDetails);
    notifyListeners();
  }

  Future<void> stopSound(String filePath) async {
    AudioPlayer? player = _players[filePath];
    if (player != null) {
      await player.stop();
      _players.remove(filePath);
      _isPlaying.remove(filePath);
      if (_currentPlaying == filePath) {
        _currentPlaying = null;
      }
      if (_players.isEmpty) {
        _anyActiveSound = false; // Reset when all sounds are stopped
      }
      notifyListeners();
    }
  }

  void setCurrentSound(String filePath, String soundName, IconData icon) {
    _currentPlaying = filePath;
    _currentSoundName = soundName;
    notifyListeners();
  }

  bool _closeAppOnTimerEnd = false;

  bool get closeAppOnTimerEnd => _closeAppOnTimerEnd;

  void setCloseAppOnTimerEnd(bool value) {
    _closeAppOnTimerEnd = value;
    notifyListeners();
    _saveCloseAppSetting(value);
  }

  void _saveCloseAppSetting(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('closeAppOnTimerEnd', value);
  }
}

class SoundDetails {
  String filePath;
  String soundName;
  IconData? icon; // Change to IconData? to accept nullable IconData
  double volume;

  SoundDetails({
    required this.filePath,
    required this.soundName,
    this.icon, // This is now nullable
    this.volume = 1.0, // Default volume level
  });
}
