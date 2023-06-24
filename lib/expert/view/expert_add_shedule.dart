import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/expert/get_jobs_provider.dart';
import 'package:skillmaestro/common/widgets/textfield.dart';

class Schedules extends StatefulWidget {
  @override
  _SchedulesState createState() => _SchedulesState();
}

TextEditingController dateTimeController = TextEditingController();

class _SchedulesState extends State<Schedules> {
  bool load = false;
  List<dynamic> slot = [];
  List<dynamic> bookedSlot = [];
  //DateTime selectedDate = DateTime(DateTime.july);
  List<DateTime> dates = [];
  DateTime dateTime = DateTime(2022, 12, 24, 5, 30);

  @override
/*   void initState() {
    super.initState();
    final today =
        DateTime.now().toUtc().subtract(Duration(hours: DateTime.now().hour));
    for (int i = 1; i < 11; i++) {
      final date = today.add(Duration(days: i));
      dates.add(date);
    }
  }

  void handleLoad() {
    setState(() {
      load = !load;
    });
  }

  void handleDateSelect(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  List<dynamic> getTimeSlots() {
    final timeSlots = [];
    if (selectedDate != null) {
      for (int i = 10; i < 20; i += 5) {
        final startTime = DateTime(
            selectedDate.year, selectedDate.month, selectedDate.day, i, 0);
        final endTime = DateTime(
            selectedDate.year, selectedDate.month, selectedDate.day, i + 4, 59);
        timeSlots.add({'startTime': startTime, 'endTime': endTime});
      }
    }
    return timeSlots;
  }

  void handleTimeSlotSelect(DateTime startTime) {
    setState(() {
      if (selectTime.contains(startTime)) {
        selectTime.remove(startTime);
      } else {
        selectTime.add(startTime);
      }
    });
  }

  void handleSubmit() {
    if (selectTime.length != 0) {
      expertAddSchedule({'dates': selectTime}).then((res) {
        if (res['data']['status'] == 'success') {
          showAlertSuccess(dispatch, 'Slots Added Successfully');
          setState(() {
            selectTime = [];
          });
          handleLoad();
        } else {
          showAlertError(dispatch, 'Slots not Added');
        }
      }).catchError((error) {
        showAlertError(dispatch, error.message);
      });
    } else {
      showAlertError(dispatch, 'Select Time slots First');
    }
  } */

  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return SafeArea(
      child: Scaffold(
          body: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 6.0,
                    offset: Offset(0.0, 2.0),
                  ),
                ],
              ),
              child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Fix Schedules',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2.0,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Choose Date / Time',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2.0,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Mark Only Available hours',
                        ),
                        SizedBox(height: 16.0),
                        textfield(
                            textFieldName: "${dateTime}",
                            //"Date&Time",
                            controllerName: dateTimeController,
                            context: context),
                        ElevatedButton(
                            onPressed: () async {
                              final date = await pickDate();
                              if (date == null) return;
                              final newDateTime = DateTime(
                                  date.year,
                                  date.month,
                                  date.day,
                                  dateTime.hour,
                                  dateTime.minute);
                              setState(() {
                                dateTime = newDateTime;
                              });
                            },
                            child: Text(
                                '${dateTime.year}/${dateTime.month}/${dateTime.day}')),
                        ElevatedButton(
                            onPressed: () async {
                              final time = await pickTime();
                              if (time == null) return;
                              final newDateTime = DateTime(
                                  dateTime.year,
                                  dateTime.month,
                                  dateTime.day,
                                  time.hour,
                                  time.minute);
                              setState(() {
                                dateTime = newDateTime;
                              });
                            },
                            child: Text('$hours:$minutes')),
                        ElevatedButton(
                            onPressed: () {
                              dates.add(dateTime);
                              context
                                  .read<ExpertAllJobsProvider>()
                                  .AddExpertShedule(dates, context);
                            },
                            child: Text('Add')),
                        ElevatedButton(
                            onPressed: () {
                              /* context
                                  .read<ExpertAllJobsProvider>()
                                  .GetExpertShedule(); */

                              context
                                  .read<ExpertAllJobsProvider>()
                                  .GetExpertShedule()
                                  .then((response) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Slots'),
                                      content: Column(
                                        children: [
                                          Text('Status: ${response['status']}'),
                                          Text(
                                              'Slots: ${response['result']['slots']}'),
                                          Text(
                                              'Booked Slots: ${response['result']['bookedSlots']}'),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Close'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              });
                            },
                            child: Text('Slotes')),
                        ElevatedButton(
                            onPressed: () {}, child: Text('Booked Slotes'))
                      ])))),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));
}
