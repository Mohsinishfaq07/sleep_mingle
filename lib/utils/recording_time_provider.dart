import 'package:flutter/cupertino.dart';

class RecordingTimeProvider with ChangeNotifier {
  DateTime? _recordingStartTime;
  DateTime? _recordingStopTime;

  DateTime? get recordingStartTime => _recordingStartTime;
  DateTime? get recordingStopTime => _recordingStopTime;

  // Calculate the duration between start and stop times
  Duration? get recordingDuration {
    if (_recordingStartTime != null && _recordingStopTime != null) {
      return _recordingStopTime!.difference(_recordingStartTime!);
    }
    return null;
  }

  // Returns formatted duration as a string
  String get formattedDuration {
    final duration = recordingDuration;
    if (duration != null) {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      final hours = twoDigits(duration.inHours);
      final minutes = twoDigits(duration.inMinutes.remainder(60));
      final seconds = twoDigits(duration.inSeconds.remainder(60));
      return "$hours:$minutes:$seconds";
    } else {
      return "No Duration"; // or any placeholder text you prefer
    }
  }

  void startRecording() {
    _recordingStartTime = DateTime.now();
    notifyListeners();
  }

  void stopRecording() {
    _recordingStopTime = DateTime.now();
    notifyListeners();
  }

  void resetTimes() {
    _recordingStartTime = null;
    _recordingStopTime = null;
    notifyListeners();
  }
}
