import 'package:flutter/material.dart';
import '../common_widgets/custom_elevated_button.dart';
import '../common_widgets/star_background.dart';
import '../utils/colors.dart';

class BedTimeGoalScreen extends StatefulWidget {
  const BedTimeGoalScreen({Key? key}) : super(key: key);

  @override
  State<BedTimeGoalScreen> createState() => _BedTimeGoalScreenState();
}

class _BedTimeGoalScreenState extends State<BedTimeGoalScreen> {
  bool bedtimeEnabled = false;
  TimeOfDay selectedTime = const TimeOfDay(hour: 22, minute: 0);
  List<bool> daysSelected = List.generate(7, (_) => true); // All checked

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _showDaySelection() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return DaySelectionBottomSheet(
          daysSelected: daysSelected,
          onDaySelectionChanged: (updatedDaysSelected) {
            setState(() {
              daysSelected = updatedDaysSelected;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon:
                        const Icon(Icons.close, color: Colors.white, size: 30),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(
                    'Bedtime Goal',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SwitchListTile(
                  title: const Text('Bedtime enabled',
                      style: TextStyle(color: Colors.white)),
                  value: bedtimeEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      bedtimeEnabled = value;
                    });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: Colors.lightBlue,
                ),
                const Text(
                  "An unwinding routine encourages restful sleep. Set a bedtime goal to maintain a consistent bedtime schedule",
                  style: TextStyle(color: Colors.white54),
                ),
                SizedBox(
                  height: 10,
                ),

                const Text(
                  "Time",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),

                ListTile(
                  title: Text(selectedTime.format(context),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  trailing: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white54)),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12.0, horizontal: 40),
                      child: Text(
                        "Set",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () => _selectTime(context),
                ),

                const Text(
                  "Nights",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                ListTile(
                  title: Text( "Sunday",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  trailing: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white54)),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12.0, horizontal: 40),
                      child: Text(
                        "Set",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    _showDaySelection(); // Call the function to show the bottom sheet
                  },
                ),
                // Add the rest of your UI components here
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DaySelectionBottomSheet extends StatefulWidget {
  final List<bool> daysSelected;
  final Function(List<bool>) onDaySelectionChanged;

  const DaySelectionBottomSheet({
    Key? key,
    required this.daysSelected,
    required this.onDaySelectionChanged,
  }) : super(key: key);

  @override
  _DaySelectionBottomSheetState createState() =>
      _DaySelectionBottomSheetState();
}

class _DaySelectionBottomSheetState extends State<DaySelectionBottomSheet> {
  late List<bool> localDaysSelected;

  @override
  void initState() {
    super.initState();
    localDaysSelected = List.from(widget.daysSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: skyColor,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      // height removed to allow for flexible size
      child: DraggableScrollableSheet(
        expand: false,
        builder: (_, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min, // Use as much space as needed
              children: [
                ...List.generate(7, (index) {
                  return CheckboxListTile(
                    title: Text(
                      [
                        'Sunday',
                        'Monday',
                        'Tuesday',
                        'Wednesday',
                        'Thursday',
                        'Friday',
                        'Saturday'
                      ][index],
                      style: const TextStyle(color: Colors.white70),
                    ),
                    value: localDaysSelected[index],
                    onChanged: (bool? value) {
                      setState(() {
                        localDaysSelected[index] = value!;
                      });
                    },
                  );
                }),
                CustomElevatedButton(
                  title: 'Set',
                  onTap: () {
                    widget.onDaySelectionChanged(localDaysSelected);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
