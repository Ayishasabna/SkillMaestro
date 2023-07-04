import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/expert/get_jobs_provider.dart';
import 'package:skillmaestro/common/widgets/textfield.dart';

// ignore: use_key_in_widget_constructors
class Schedules extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SchedulesState createState() => _SchedulesState();
}

TextEditingController dateTimeController = TextEditingController();

class _SchedulesState extends State<Schedules> {
  bool load = false;
  List<dynamic> slot = [];
  List<dynamic> bookedSlot = [];
  //DateTime selectedDate = DateTime(DateTime.july);
  List<DateTime> dates = [];
  DateTime dateTime = DateTime(2023, 06, 24, 5, 30);

  @override
  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return SafeArea(
      child: Scaffold(
          body: Container(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 6.0,
                    offset: Offset(0.0, 2.0),
                  ),
                ],
              ),
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/online-calendar.jpg"),
                        const SizedBox(height: 20),
                        const SizedBox(height: 20),
                        const Text(
                          'Mark Only Available hours',
                        ),
                        const SizedBox(height: 20.0),
                        textfield(
                            textFieldName: "$dateTime",
                            //"Date&Time",
                            controllerName: dateTimeController,
                            context: context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFF02D1AC))),
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
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFF02D1AC))),
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
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromARGB(255, 202, 209, 2))),
                                onPressed: () {
                                  dates.add(dateTime);
                                  context
                                      .read<ExpertAllJobsProvider>()
                                      .AddExpertShedule(dates, context);
                                  Navigator.of(context).pop();
                                },
                                child: Text('Add Shedule')),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Check Available Slots',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                // decoration: TextDecoration.underline,
                                decorationThickness: 2.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFF02D1AC))),
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
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Slots',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
                                                  ),
                                                ),
                                                SizedBox(height: 8.0),
                                                /*  getslots(response['result']
                                                    ['slots']), */
                                                /*  Text(
                                                  'Status: ${response['status']}',
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ), */
                                                Text(
                                                  //'Slots:',
                                                  ' ${response['result']['slots']}',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                ),
                                                /*  for (var slot
                                                    in response['result']
                                                        ['slots']) ...[
                                                  Text(
                                                    '${slot['date']} - ${slot['time']}',
                                                    style: TextStyle(
                                                        fontSize: 14.0),
                                                  ),
                                                ], */
                                                /* Text(
                                                  'Booked Slots: ${response['result']['bookedSlots']}',
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ), */
                                                SizedBox(height: 16.0),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      'Close',
                                                      style: TextStyle(
                                                          fontSize: 16.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );

                                    /*   showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Slots'),
                                          content: Column(
                                            children: [
                                              Text(
                                                  'Status: ${response['status']}'),
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
                                              child: const Text('Close'),
                                            ),
                                          ],
                                        );
                                      },
                                    ); */
                                  });
                                },
                                child: const Text('Slotes')),
                            const SizedBox(
                              width: 40,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFF02D1AC))),
                                onPressed: () {},
                                child: const Text('Booked Slotes'))
                          ],
                        ),
                      ])))),
    );
  }

  getslots(List<dynamic> slotList) {
    String slots;

    List<dynamic> newslotList = slotList;
    for (var i = 0; i < newslotList.length; i++) {
      slots = newslotList[i];
      Text('kkkkkkkkk$slots');
    }
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
