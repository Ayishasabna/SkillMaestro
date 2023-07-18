
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/common/common_provider.dart';
import 'package:skillmaestro/common/widgets/textfield.dart';
import 'package:skillmaestro/user/view/payment_description_screen.dart.dart';
import '../../application/user/job_detail_provider.dart';
import '../../core/constants.dart';
import '../model/cancel_booking_model.dart';
import '../model/decline_estimation_model.dart';

TextEditingController bookingController = TextEditingController();
TextEditingController textController = TextEditingController();
TextEditingController cancelBookingController = TextEditingController();

// ignore: must_be_immutable
class UserBookingDescription extends StatelessWidget {
  UserBookingDescription({super.key, required this.map});
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
        body: 
            ListView(padding: const EdgeInsets.all(16.0), children: [
          Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.description),
                      
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.amber // Set the desired color here
                      ),
                  onPressed: () async {
                    map['_id'];
                    Provider.of<JobDetailProvider>(context, listen: false)
                        .approveEstimate(map['_id']);
                    /* value.approveExpert(
                                          value.allExperts![index]!.id); */
                    Provider.of<CommonProvider>(context, listen: false)
                        .approveEstimation(context);

                    Navigator.pop(context);
                  },
                  child: const Text('Approve')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.amber // Set the desired color here
                      ),
                  onPressed: () {
                    String id = map['_id'];
                    bookingController.text = id;
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          //title: const Text('Approve / Estimation'),
                          content: const Text(
                            "Please specify the Reason",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),

                          actions: [
                           
                            textfield(
                                textFieldName: "Reason",
                                controllerName: textController,
                                context: context),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      if (textController.text.isNotEmpty) {
                                        DeclineEstimationModel model =
                                            DeclineEstimationModel(
                                                id: map['_id'],
                                                text: textController.text);
                                        Provider.of<JobDetailProvider>(context,
                                                listen: false)
                                            .declineEstimate(model);
                                        Navigator.pop(context);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Please Specify the reason'),
                                          ),
                                        );
                                        // showSnackBar(context,
                                        //     "Please Specify the reason");
                                      }
                                    },
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.red)),
                                    child: const Text("Decline")),
                                const SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.green)),
                                    child: const Text(
                                      "cancel",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                   
                  },
                  child: const Text('Decline')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.amber // Set the desired color here
                      ),
                  onPressed: () {
                    if (map['status'] == 'completed' ||
                        map['status'] == 'closed') {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PaymentScreen(
                                map: map,
                              )));
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              content: Text(
                                "After completing the job, you can proceed with the Payment",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.blue),
                              ),
                            );
                          });
                    }

                   
                  },
                  child: const Text('Pay')),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber // Set the desired color here
                  ),
              onPressed: () {
                String id = map['_id'];
                bookingController.text = id;
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      //title: const Text('Approve / Estimation'),
                      content: const Text(
                        "Please specify the Reason",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),

                      actions: [
                        /*  textfield(
                                    textFieldName: "Booking Id",
                                    controllerName: bookingController,
                                    context: context),
                                SizedBox(
                                  height: 10,
                                ), */
                        textfield(
                            textFieldName: "Reason",
                            controllerName: cancelBookingController,
                            context: context),
                        const SizedBox(
                          height: 10,
                        ),
                        // Text(
                        //   'Are you sure you want to cancel Booking',
                        //   style: TextStyle(
                        //       fontSize: 14, fontWeight: FontWeight.w500),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  if (cancelBookingController.text.isNotEmpty) {
                                    CancelBookingModel model =
                                        CancelBookingModel(
                                            id: map['_id'],
                                            text: cancelBookingController.text);
                                    
                                    Provider.of<JobDetailProvider>(context,
                                            listen: false)
                                        .cancelBooking(model);
                                    cancelBookingController.clear();
                                    Navigator.pop(context);
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const AlertDialog(
                                            content: Text(
                                              "Please Specify the reason.",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                  color: Colors.blue),
                                            ),
                                          );
                                        });
                                    
                                  }
                                },
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.red)),
                                child: const Text(
                                  "Confirm",
                                  style: TextStyle(color: Colors.white),
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.green)),
                                child: const Icon(Icons.close)
                                
                                ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Cancel Booking')),

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
                        style:const TextStyle(
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
