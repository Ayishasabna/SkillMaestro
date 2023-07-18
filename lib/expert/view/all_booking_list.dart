import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/expert/model/send_estimate_model.dart';
import '../../application/expert/expert_job_detail_provider.dart';
import '../../core/constants.dart';

TextEditingController bookingController = TextEditingController();
TextEditingController textController = TextEditingController();
TextEditingController cancelBookingController = TextEditingController();
TextEditingController bookingIdController = TextEditingController();
TextEditingController hoursController = TextEditingController();
TextEditingController partsController = TextEditingController();
TextEditingController amountController = TextEditingController();
// ignore: non_constant_identifier_names
TextEditingController PriceController = TextEditingController();

// ignore: must_be_immutable
class BookingDescriptionTab extends StatelessWidget {
  BookingDescriptionTab({super.key, required this.map});
  Map<String, dynamic> map = {};

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
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
                      const Icon(Icons.description),
                      // SizedBox(
                      //   width: 20,
                      // ),
                      Column(
                        children: [
                          Text(
                            '  Job Status: ${map['status']}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Bill Amount: ${map['bill_amount']}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Payment: ${map['payment']['payment_status']}',
                            style: const TextStyle(
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
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'House: ${map['address']['house']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Street: ${map['address']['street']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Pincode: ${map['address']['pincode']}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
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
                            style: const TextStyle(
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
              },
              child: const Text('Send Estimate')),
        ]));
  }
}

// ignore: camel_case_types
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
                const Icon(Icons.work),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Job Role: ${results['jobId']['job_role']}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Basic Rate: ${results['jobId']['base_rate']}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Additional Rate: ${results['jobId']['add_rate']}',
                        style: const TextStyle(
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

Future sendEstimate(
  context,
  String id,
  num hours,
  List<dynamic> parts,
  num amount,
) async {
  bookingIdController.text = id;
  hoursController.text = hours.toString();

  amountController.text = amount.toString();
  //partsController.text = parts.toString();
  // ignore: unused_local_variable
  String partsText = parts.join(',');
  //partsController.text = partsText;
  log('______________partsController.text __________${partsController.text}');

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      //context.read<AddAddressProvider>();
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: const Center(
          child: Text(
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
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                    labelText: 'BookingId',
                    labelStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              TextField(
                controller: hoursController,
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                    labelText: 'Hours',
                    labelStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              TextField(
                controller: partsController,
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                    labelText: 'Parts',
                    labelStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              TextField(
                controller: PriceController,
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  labelText: 'Price',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: TextField(
                  controller: amountController,
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.bold),
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

              List<Part> partsList = partsController.text
                  .split(',')
                  .map((pName) => Part(pName: pName, price: price))
                  .toList();
              
              SendEstimateModel model = SendEstimateModel(
                  bookId: bookingIdController.text,
                  hours: num.parse(hoursController.text),
                  parts: partsList,
                  amount: num.parse(amountController.text));
              await Provider.of<ExpertJobProvider>(context, listen: false)
                  .sendEstimate(model);
              
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            child: const Text('Confirm'),
          ),
        ],
      );
    },
  );
}
