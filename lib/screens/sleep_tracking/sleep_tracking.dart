import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../common_widgets/alarm_bottom_sheet.dart';
import '../../common_widgets/custom_elevated_button.dart';
import '../../common_widgets/favourite_bottom_sheet.dart';
import '../../common_widgets/star_background.dart';
import '../../common_widgets/timer_bottom_sheet.dart';
import '../../provider/sound_player_provider.dart';
import '../../utils/colors.dart';
import '../../utils/global_variables.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_sound/flutter_sound.dart';
import '../../utils/recording_time_provider.dart';

class SleepTracking extends StatefulWidget {
  const SleepTracking({Key? key}) : super(key: key);

  @override
  _SleepTrackingState createState() => _SleepTrackingState();
}

class _SleepTrackingState extends State<SleepTracking> {
  bool isRecording = false;

  Future<bool> checkMicrophonePermissions() async {
    var microphoneStatus = await Permission.microphone.status;
    if (!microphoneStatus.isGranted) {
      microphoneStatus = await Permission.microphone.request();
    }
    return microphoneStatus.isGranted;
  }

  void playRecording() async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath =
        '$directory/recording.aac'; // Adjust according to where you save your recordings
    final file = File(filePath);
    if (await file.exists()) {
      await audioPlayer.play(DeviceFileSource(filePath));
    } else {
      // Handle file not found
    }
  }

  bool isPlaying = false;
  String _timeString = '', _period = '';
  String? recordingFilePath; // File path for the recorded audio
  final AudioPlayer audioPlayer = AudioPlayer();

  late Timer _timer;
  List<int> audioData = [];

  @override
  void initState() {
    super.initState();
    _initializeRecorder();
    _initializeAudioPlayer(); // Initialize audio player listeners

    _getTime();
    _timer =
        Timer.periodic(const Duration(minutes: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('h:mm'),
        periodFormatter = DateFormat('a');
    setState(() {
      _timeString = formatter.format(now);
      _period = periodFormatter.format(now);
    });
  }

  @override
  void dispose() {
    _recorder.closeRecorder();
    _player.closePlayer(); //
    _timer.cancel();
    super.dispose();
  }

  int selectedButtonIndex = 1;
  Future<bool> _checkPermission() async {
    if (await Permission.microphone.request().isGranted) {
      return true;
    } else {
      return false;
    }
  }

  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  final FlutterSoundPlayer _player = FlutterSoundPlayer();
  bool _isRecording = false;
  bool _isRecorded = false;
  String? _path;

  Future<void> _initializeRecorder() async {
    await _recorder.openRecorder();
    final session = await _recorder.openRecorder();
    if (session!.isRecording) {
      // Now you can start recording as the session is ready
    }
  }

  Future<void> _startRecording() async {
    String? localPath = await _localPath();
    _path = '$localPath/voice_note.aac';
    final recordingTimeProvider = Provider.of<RecordingTimeProvider>(context, listen: false);
    recordingTimeProvider.startRecording();
    // Start the recorder
    await _recorder.startRecorder(
      toFile: _path,
      codec: Codec.aacADTS,
    );
    setState(() {
      _isRecording = true;
      _isRecorded = false;
    });
  }

  Future<String?> _localPath() async {
    // Use the path_provider package to find the local path
    final directory = await getApplicationDocumentsDirectory();
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    return directory.path;
  }

  Future<void> _stopRecording() async {
    final recordingTimeProvider = Provider.of<RecordingTimeProvider>(context, listen: false);
    recordingTimeProvider.stopRecording();    _path = await _recorder.stopRecorder();

    setState(() {
      _isRecording = false;
      _isRecorded = true;
// Assuming the length gives the duration in milliseconds
    });
  }

  void _initializeAudioPlayer() {
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _isAudioPlaying = false; // Reset playback state when audio finishes
      });
    });
  }
  bool _isAudioPlaying = false; // Add this variable to track audio playing state


  Future<void> _togglePlayback() async {
    if (_isAudioPlaying) {
      // If audio is currently playing, pause it
      await audioPlayer.pause();
    } else {
      // If audio is paused, play it
      if (_path != null) {
        await audioPlayer.play(DeviceFileSource(_path!));
      }
    }
    // Toggle the playback state and update UI
    setState(() {
      _isAudioPlaying = !_isAudioPlaying;
    });
  }

  Widget _buildRecordedMessage() {
    // Use Provider to get the formattedDuration from RecordingTimeProvider
    final recordingTimeProvider = Provider.of<RecordingTimeProvider>(context, listen: false);
    final String durationText = recordingTimeProvider.formattedDuration;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            _isAudioPlaying ? Icons.pause : Icons.play_arrow, // Use _isAudioPlaying to determine the icon
            color: Colors.white,
            size: 30,
          ),
          onPressed: _togglePlayback, // Use _togglePlayback here
        ),
        Text(
          durationText,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    final recordingTimeProvider = Provider.of<RecordingTimeProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (await _checkPermission()) {
            _startRecording();
          } else {
            // Handle the case when permission is not granted
          }
        },
        backgroundColor: Colors.purple,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          side: BorderSide(color: Colors.purple), // Border width and color
        ),
        child: const Icon(
          Icons.mic,
          size: 40,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(children: [
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: skyColor))),
        const StarBackground(),
        SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          _buildDateTimeDisplay(),
          _buildContentForSelectedIndex(),
          if (_isRecorded) _buildRecordedMessage(),
              if (recordingTimeProvider.recordingStartTime != null)
                Text('Recording Started: ${DateFormat('yyyy-MM-dd – kk:mm:ss').format(recordingTimeProvider.recordingStartTime!)}'),
              if (recordingTimeProvider.recordingStopTime != null)
                Text('Recording Stopped: ${DateFormat('yyyy-MM-dd – kk:mm:ss').format(recordingTimeProvider.recordingStopTime!)}'),
            ])),
      ]),
    );
  }

  Widget _buildDateTimeDisplay() => Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Text(_timeString,
              style: const TextStyle(color: Colors.white, fontSize: 52)),
          Text(_period,
              style: const TextStyle(color: Colors.grey, fontSize: 26)),
          _buildAlarmSettingButton(),
          _buildOptionsRow(),
        ]),
      );

  Widget _buildAlarmSettingButton() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GestureDetector(
          onTap: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) => const AlarmBottomSheet()),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white24),
            child: const Padding(
                padding: EdgeInsets.all(10.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.alarm, color: Colors.white, size: 30),
                  SizedBox(width: 15),
                  Text('Set Smart Alarm',
                      style: TextStyle(color: Colors.white, fontSize: 24))
                ])),
          ),
        ),
      );

  Widget _buildOptionsRow() => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              3,
              (index) => TextButton(
                  onPressed: () =>
                      setState(() => selectedButtonIndex = index + 1),
                  child: Text(['Recommendation', 'Favourite', 'Mixes'][index],
                      style: TextStyle(
                          color: selectedButtonIndex == index + 1
                              ? Colors.white
                              : Colors.white38,
                          fontSize: 20))))));

  Widget _buildContentForSelectedIndex() {
    switch (selectedButtonIndex) {
      case 1: // Sounds
      case 2: // Music
      case 3: // Mixes
        return _buildCarouselSlider();
      default:
        return const SizedBox(); // Placeholder for unexpected index values
    }
  }

  Widget _buildCarouselSlider() => Column(children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: CarouselSlider.builder(
              itemCount: soundData.length,
              itemBuilder: (context, index, realIndex) =>
                  _buildCarouselItem(soundData[index], index),
              options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  aspectRatio: 2.0,
                  initialPage: 2)),
        ),
        _buildQuitButton(),
        if (_isRecording)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Tracking...',
              style: TextStyle(
                  fontSize: 12,  color: Colors.white),
            ),
          )
        else
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Not Tracking',
              style: TextStyle(
                  fontSize: 12,
                   color: Colors.white),
            ),
          ),
      ]);

  Widget _buildCarouselItem(Map<String, dynamic> item, int index) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.purple),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item['name'],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 28)),
                    Icon(item['icon'], size: 30, color: Colors.white)
                  ])),
          const Spacer(),
          Consumer<SoundPlayerProvider>(
            builder: (context, soundPlayerProvider, child) =>
                _buildBottomActions(
                    item['filePath'], item['name'], soundPlayerProvider),
          )
        ]));
  }

  Widget _buildBottomActions(String filePath, String soundName,
      SoundPlayerProvider soundPlayerProvider) {
    // Determine if the current sound is playing
    bool isPlaying = soundPlayerProvider.isSoundPlaying(filePath);

    return Container(
        decoration: const BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(
              icon: const Icon(Icons.timer, color: Colors.white, size: 40),
              onPressed: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) =>
                      const TimerDurationScreen())),
          IconButton(
            icon: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 40,
            ),
            onPressed: () =>
                soundPlayerProvider.toggleSound(filePath, soundName ),
          ),

          /// yha per in music ko play and pause krna chahta hu jis k liye play and pause button chiye
          IconButton(
              icon: const Icon(Icons.favorite_border,
                  color: Colors.white, size: 40),
              onPressed: () => showModalBottomSheet(
                  context: context,
                  isScrollControlled: false,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) =>
                      const FavouriteBottomSheet()))
        ]));
  }

  Widget _buildQuitButton() => Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 15),
      child: CustomElevatedButton(
          title: "Quit",
          width: 180,
          onTap: () async => _isRecording
              ? _showStopRecordingBottomSheet()
              : Navigator.of(context).pop()));

  void _showStopRecordingBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration:   BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: skyColor),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Recording Stopped",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                 const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Are you sure you want to quit the recording?",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomElevatedButton(
                      title: "No",
                      onTap: () => Navigator.pop(context),
                    ),
                    CustomElevatedButton(
                      title: "Yes",
                      onTap: () {
                        _stopRecording().then((_) {
                          Navigator.pop(context); // Close the bottom sheet
                          // Navigator.pop(context, true); // Optionally close the screen if needed
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> saveAudioData(List<int> audioData) async {
    // Check and request storage permission
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    // Get the application documents directory
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/my_audio_file.raw';

    // Write the audio data to a file
    final file = File(filePath);
    await file.writeAsBytes(audioData, mode: FileMode.append);

    // Now you have saved the audio data to a file
    // To play this back, you would need to convert it to a proper audio format
  }
}
