import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/expert/get_jobs_provider.dart';
import 'package:skillmaestro/application/user/job_detail_provider.dart';
import 'package:skillmaestro/expert/model/send_estimate_model.dart';
import '../../application/expert/expert_job_detail_provider.dart';
import '../../common/widgets/textfield.dart';
import '../../core/constants.dart';

TextEditingController bookingController = TextEditingController();
TextEditingController textController = TextEditingController();
TextEditingController cancelBookingController = TextEditingController();
TextEditingController bookingIdController = TextEditingController();
TextEditingController hoursController = TextEditingController();
TextEditingController partsController = TextEditingController();
TextEditingController amountController = TextEditingController();
TextEditingController PriceController = TextEditingController();

// ignore: must_be_immutable
class BookingDescriptionTab extends StatelessWidget {
  BookingDescriptionTab({super.key, required this.map});
  Map<String, dynamic> map = {};

  @override
  Widget build(BuildContext context) {
    Widget buttonwidget;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Booking Description'),
          backgroundColor: mainColor,
        ),
        body: ListView(padding: const EdgeInsets.all(16.0), children: [
          Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.description),
                      // SizedBox(
                      //   width: 20,
                      // ),
                      Column(
                        children: [
                          Text(
                            '  Job Status: ${map['status']}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Bill Amount: ${map['bill_amount']}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Payment: ${map['payment']['payment_status']}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          cardwidget(results: map),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Address'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: ${map['address']['name']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'House: ${map['address']['house']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Street: ${map['address']['street']}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Pincode: ${map['address']['pincode']}',
                        style: TextStyle(fontSize: 16),
                      ),

                      //Text('Name: string'),
                      //Text('House: string'),
                      //Text('Street: string'),
                      //Text('Pincode: 0'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber // Set the desired color here
                  ),
              onPressed: () {
                if (map['status'] == 'completed' ||
                    map['status'] == 'closed' ||
                    map['status'] == 'cancelled') {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            "Already ${map['status']} the Job",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.blue),
                          ),
                        );
                      });
                } else if (map['status'] == 'started') {
                  sendEstimate(context, map['_id'], map['estimate']['hours'],
                      map['estimate']['parts'], map['jobId']['base_rate']);
                }

                //log("_____________navigation to payment screen_________$map");
              },
              child: Text('Send Estimate')),

          // Container(
          //   height: 50,
          //   width: 100,
          //   child: Text(results[0]['payment']['invoice']),
          // ),
        ]));
  }
}

class cardwidget extends StatelessWidget {
  const cardwidget({
    super.key,
    required this.results,
  });

  final Map<String, dynamic> results;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.work),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Job Role: ${results['jobId']['job_role']}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Basic Rate: ${results['jobId']['base_rate']}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Additional Rate: ${results['jobId']['add_rate']}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    // Add more job information here
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* Map<String, dynamic> map = {};
TextEditingController bookingIdController = TextEditingController();
TextEditingController hoursController = TextEditingController();
TextEditingController partsController = TextEditingController();
TextEditingController amountController = TextEditingController();
TextEditingController PriceController = TextEditingController();

class AllBookingTab extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  AllBookingTab({Key? key, required this.map});
  Map<String, dynamic> map = {};
  @override
  Widget build(BuildContext context) {
    //context.read<ExpertAllJobsProvider>().GetMyBookings();
    log("_______________Booking Details_____________${map['estimate']['parts']}");
    //final response = context.read<ExpertAllJobsProvider>().GetMyBookings();

    // ignore: unnecessary_null_comparison
    /*    if (response == null) {
      // Handle the case where the response is null
      return Scaffold(
        appBar: AppBar(
          title: const Text('Booking Details'),
          backgroundColor: mainColor,
        ),
        body: const Center(
          child: CircularProgressIndicator(), // Show a progress indicator
        ),
      );
    }

    final result = response;
    // ignore: unnecessary_null_comparison
    if (result == null) {
      // Handle the case where the result is null or doesn't contain the expected data
      return Scaffold(
        appBar: AppBar(
          title: const Text('Booking Details'),
          backgroundColor: mainColor,
        ),
        body: const Center(
          child: Text('No bookings available'), // Show a message
        ),
      );
    } */

    //Map<String, dynamic> map = result;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Booking Details'),
          backgroundColor: mainColor,
        ),
        body: Consumer<ExpertAllJobsProvider>(
          builder: (context, value, child) {
            map = value.booking;
            //List<dynamic> results = map['result'];
            //log('__________________________addresses____________________________$results');

            return ListView(padding: const EdgeInsets.all(16.0), children: [
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                        'User Information',
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        'Name: ${map['address']['name']}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Text('Username: ${map['result']['username']}'),
                          // Text('Email: ${value.booking.result}'),
                          //Text('Mobile: ${map['username']}'),
                          // Add more user information here
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ListTile(
                      leading: Icon(Icons.work),
                      title: Text('Job Information'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Job Role: ${map['jobId']['job_role']}'),
                          // Add more job information here
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('Address'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name: ${map['address']['name']}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'House: ${map['address']['house']}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Street: ${map['address']['street']}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Pincode: ${map['address']['pincode']}',
                            style: TextStyle(fontSize: 16),
                          ),

                          //Text('Name: string'),
                          //Text('House: string'),
                          //Text('Street: string'),
                          //Text('Pincode: 0'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.amber // Set the desired color here
                      ),
                  onPressed: () {
                    //log('_____________sendestimate_________${results[0]['estimate']['parts']}');
                    /* sendEstimate(context, map['_id'], map['estimate']['hours'],
                        map['estimate']['parts'], map['jobId']['base_rate']); */
                  },
                  child: Text('Send Estimate'))
            ]);
          },
        ));
  }
} */

Future sendEstimate(
  context,
  String id,
  num hours,
  List<dynamic> parts,
  num amount,
) async {
  bookingIdController.text = id;
  hoursController.text = hours.toString();

  //num totalAmount = amount + num.parse(PriceController.text);

  amountController.text = amount.toString();
  //partsController.text = parts.toString();
  String partsText = parts.join(',');
  //partsController.text = partsText;
  log('______________partsController.text __________${partsController.text}');
  //String dateTimeString = date.text;
  //DateTime dateTime = DateTime.parse(dateTimeString);

  //String newdate = DateFormat.yMd().format(dateTime);
  //TextEditingController dateController = TextEditingController(text: newdate);
  //log('___________________date_____________${newdate}');
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      //context.read<AddAddressProvider>();
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: Center(
          child: const Text(
            'Details',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: bookingIdController,
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                    labelText: 'BookingId',
                    labelStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              TextField(
                controller: hoursController,
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                    labelText: 'Hours',
                    labelStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              TextField(
                controller: partsController,
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                    labelText: 'Parts',
                    labelStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              TextField(
                controller: PriceController,
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  labelText: 'Price',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: TextField(
                  controller: amountController,
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    labelText: 'Total Amount',
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              //List<dynamic> partsList = partsController.text.split(',');
              int price = int.parse(PriceController.text);

              log("_____________AmountController__________${amountController.text}");
              log("_____________HoursController__________${hoursController.text}");

              //List<dynamic> partsList = partsController.text;

              //log('_partsList____________$partsList');
              List<Part> partsList = partsController.text
                  .split(',')
                  .map((pName) => Part(pName: pName, price: price))
                  .toList();
              log('_send estimatepartsList____________$partsList');
              SendEstimateModel model = SendEstimateModel(
                  bookId: bookingIdController.text,
                  hours: num.parse(hoursController.text),
                  parts: partsList,
                  amount: num.parse(amountController.text));
              await Provider.of<ExpertJobProvider>(context, listen: false)
                  .sendEstimate(model);
              log('_______________afterProvider');
              Navigator.pop(context);
              // final model = BookJobRequestModel(
              //     slots: selectedslot,
              //     address: address1,
              //     date: date.text,
              //     jobId: jobId.text);
              // await Provider.of<UserAddJobProvider>(context, listen: false)
              //     .AddJob(model, context);
              // Navigator.of(context).pop();
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => BookingStatus()));
              //addAddress(context, id);
              // Perform submit action
            },
            child: const Text('Confirm'),
          ),
        ],
      );
    },
  );
}
