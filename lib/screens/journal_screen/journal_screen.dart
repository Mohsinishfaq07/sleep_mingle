import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../common_widgets/star_background.dart';
import '../../utils/colors.dart';
import '../../utils/recording_time_provider.dart';

class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {





  final List<_SalesData> data = [
    _SalesData('Jan', 200),
    _SalesData('Feb', 300),
    _SalesData('Mar', 250),
    _SalesData('Apr', 280),
    _SalesData('May', 320),
    _SalesData('Jun', 440)
  ];

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  void _showCalendar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return StatefulBuilder(
          // Use StatefulBuilder to provide a setState method
          builder: (BuildContext context, StateSetter setModalState) {
            // setModalState will be used to set the state of the modal
            return Container(
              height: MediaQuery.of(context).size.height * 0.6,
              color: Colors.transparent,
              child: Container(
                decoration:   const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.purple,
                      Colors.purpleAccent,
                      Colors.purple,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: TableCalendar(
                  daysOfWeekVisible: true,
                  headerStyle: HeaderStyle(
                    formatButtonShowsNext: false,
                    formatButtonDecoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                    ),
                  ),
                  pageAnimationEnabled: true,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setModalState(() {
                      // Use setModalState instead of setState
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, date, _) {
                      return Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        child: Text(
                          date.day.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                    todayBuilder: (context, date, _) {
                      return Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey), // Red border for today
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          date.day.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                    selectedBuilder: (context, date, _) {
                      return Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors
                                  .white), // Black border for selected day
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          date.day.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  String _formattedDate() {
    var now = DateTime.now();
    var formatter = DateFormat('EEEE, MMMM d');
    return formatter.format(now);
  }

  DateTime?
      _selectedWeekDay; // Add a variable to track the selected day in the week row

  List<DateTime> _getWeekDates() {
    var now = DateTime.now();
    var currentWeekday = now.weekday;
    var startOfWeek = now.subtract(Duration(days: currentWeekday - 1));
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  Widget _buildWeekRow() {
    final weekDates = _getWeekDates();
    final DateTime today = DateTime.now();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: weekDates.map((date) {
          bool isSelected =
              _selectedWeekDay != null && date.day == _selectedWeekDay!.day;
          bool isToday = date.day == today.day &&
              date.month == today.month &&
              date.year == today.year;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedWeekDay = date;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.transparent, // Keep the background transparent
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: isSelected
                      ? Colors.white
                      : isToday
                          ? Colors.grey
                          : Colors
                              .transparent, // White for selected, grey for today, transparent otherwise
                  width: 2,
                ),
              ),
              child: Text(
                DateFormat('d').format(date),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // Inside your JournalScreen class
  Widget _buildSleepPhasesSection() {

    // Get the current time
    final currentTime = DateTime.now();
    // Format the current time as a string
    final formattedTime =
        DateFormat('h:mm a').format(currentTime); // Example format: 9:30 PM

    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white12),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Sleep Phases",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
              child: IntrinsicWidth(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Icon(
                          Icons.play_circle,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                      const Icon(
                        Icons.message_outlined,
                        color: Colors.white,
                        size: 26,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min, // Add this line
                          children: [
                            Text(
                              formattedTime, // Display the formatted current time
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                            const Text(
                              "Talking",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 26,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Half yearly Sleep Analysis'),
                  // Enable legend
                  legend: Legend(isVisible: true),
                  // Enable tooltip
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: <CartesianSeries<_SalesData, String>>[
                    LineSeries<_SalesData, String>(
                        dataSource: data,
                        xValueMapper: (_SalesData sales, _) => sales.year,
                        yValueMapper: (_SalesData sales, _) => sales.sales,
                        name: 'Sales',
                        // Enable data label
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true))
                  ]),
            )

            ///yha per graph lagana h
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
     final recordingTimeProvider = Provider.of<RecordingTimeProvider>(context);
     final timeFormatter = DateFormat('kk:mm:ss');
     String durationText = recordingTimeProvider.formattedDuration;

    String recordingStartTimeText = recordingTimeProvider.recordingStartTime != null
        ? 'Start: ${timeFormatter.format(recordingTimeProvider.recordingStartTime!)}'
        : 'not started';

    String recordingStopTimeText = recordingTimeProvider.recordingStopTime != null
        ? 'Stopped: ${timeFormatter.format(recordingTimeProvider.recordingStopTime!)}'
        : ' not stopped';
    return Scaffold(
      body: Stack(
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

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _formattedDate(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        GestureDetector(
                            onTap: () => _showCalendar(context),
                            child: const Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                              size: 30,
                            )),
                        // for alignment purposes
                      ],
                    ),
                  ),
                  _buildWeekRow(),
                  const SizedBox(height: 14),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white12),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Handle tap
                                },
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.purple,
                                        Colors.purple.shade400
                                      ],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'SLEEP QUALITY',
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 10,
                                          ),
                                        ),
                                        Text(
                                          'Tap to unlock!',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                                     Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Time asleep ",
                                    style: TextStyle(color: Colors.white38),
                                  ),
                                  Text(
                                    " $durationText",
                                    style: const TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    "Time in bed",
                                    style: TextStyle(color: Colors.white38),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.nightlight_round_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        recordingStartTimeText,
                                        style: const TextStyle(color: Colors.white),
                                      ),],
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: [
                                         const Icon(
                                        Icons.sunny,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        recordingStopTimeText,
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Your First  sleep quality is ready!",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),
                  _buildSleepPhasesSection()
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
