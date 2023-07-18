import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skillmaestro/expert/view/all_booking_list.dart';
import '../../application/common/common_provider.dart';
import '../../application/expert/expert_job_detail_provider.dart';
import '../../application/expert/get_jobs_provider.dart';
import '../../common/widgets/common_widget.dart';
import '../model/end_job_model.dart';

Map<String, dynamic> map = {};
List<dynamic> dynamicList = [];
List<Map<String, dynamic>> mapList = [{}];
TextEditingController endJobbookingIdController = TextEditingController();
TextEditingController endJobhoursController = TextEditingController();
TextEditingController endJobpartsController = TextEditingController();
TextEditingController endJobamountController = TextEditingController();
TextEditingController endJobPriceController = TextEditingController();
TextEditingController endjobpartController = TextEditingController();

// ignore: must_be_immutable
class ExpertAllBooking extends StatelessWidget {
  ExpertAllBooking({super.key});
  List<dynamic> results = [];
  List<Map<String, dynamic>> mapList = [];
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CommonProvider>(context, listen: false)
          .setShimmerLoading(true);
      Future.delayed(const Duration(milliseconds: 700), () {
        context.read<CommonProvider>().setShimmerLoading(false);
      });
    });
    context.read<ExpertAllJobsProvider>().GetMyBookings();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Your Bookings"),
          backgroundColor: const Color(0xFF02D1AC),
          //backgroundColor: mainColor,
        ),
        body: Consumer2<ExpertAllJobsProvider, CommonProvider>(
            builder: (context, value, value2, child) {
          map = value.booking;
          if (map['result'] != null) {
            results = map['result'];
          }

          // ignore: unnecessary_null_comparison
          return value.booking == null || value.booking.isEmpty
              ? const Center(child: CircularProgressIndicator())
              //const Text("No Booking Available")
              : ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    //return UserCard(map: results[index]);
                    return value2.shimmerLoading
                        ? getRecentShimmer(height, width)
                        : UserCard(map: results[index]);
                  });
        }));
  }

  Shimmer getRecentShimmer(height, width) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Column(
          children: [
            Container(
              height: height / 4,
              width: width / 1.10,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
            ),
            widgets().sizedboxHeight10(),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    height: 15,
                    color: Colors.white,
                  ),
                  widgets().sizedboxHeight10(),
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 15,
                        color: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
            ),
            widgets().sizedboxHeight10(),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 15,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class UserCard extends StatelessWidget {
  UserCard({super.key, required this.map});
  Map<String, dynamic> map = {};

  @override
  Widget build(BuildContext context) {
    String buttonName = map['status'];

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BookingDescriptionTab(
                  map: map,
                )));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(16.0), // Adjust the value as needed
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Image.network("${map['image']}"),
                  Text(
                    'Job : ${map['jobId']['job_role']}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Text('Base Rate: ${map['jobId']['base_rate']}'),
                  Text('Additional Rate: ${map['jobId']['ad_rate']}'),
                  //Text('createdAt:  ${map['jobId']['createdAt']}'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.location_on),
                      Column(
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
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.blue // Set the desired color here
                          ),
                      onPressed: () {
                        if (buttonName == 'pending') {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  content: const Text(
                                    "Are you sure you want to Start the job",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          if (map['estimate']['parts'] ==
                                              null) {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return const AlertDialog(
                                                    content: Text(
                                                      "First, send the estimate from the booking details page, and once the user approves it, you can start your job",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  );
                                                });
                                          }
                                        },
                                        child: const Text('yes')),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('No'))
                                  ],
                                );
                              });
                          Provider.of<ExpertJobProvider>(context, listen: false)
                              .StartJob(map['_id']);
                          Navigator.of(context).pop();
                        }
                        if (buttonName == 'started') {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  content: const Text(
                                    "Are you sure you want to end the job?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          if (map['estimate']['parts']
                                              .isEmpty) {
                                            Navigator.of(context).pop();
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    content: const Text(
                                                      "First, send the estimate from the booking details page, and once the user approves it, you can start your job",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 18),
                                                    ),
                                                  );
                                                });
                                          } else {
                                            dynamicList =
                                                map['estimate']['parts'];
                                            mapList = dynamicList.map((item) {
                                              return Map<String, dynamic>.from(
                                                  item);
                                            }).toList();
                                            EndJob(
                                                context,
                                                map['_id'],
                                                map['estimate']['hours'],
                                                mapList,
                                                map['estimate']['amount']);
                                          }
                                          //Navigator.of(context).pop();
                                        },
                                        child: const Text('yes')),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('No'))
                                  ],
                                );
                              });
                        }
                        if (buttonName == 'cancelled') {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: Text(
                                    "You already cancelled the job",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Colors.red),
                                  ),
                                );
                              });
                        }
                        if (buttonName == 'completed') {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: Text(
                                    "Job Completed...Thank You",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        color: Colors.amber),
                                  ),
                                );
                              });
                        }

                        // map['_id']
                      },
                      child: Text(buttonName)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Future EndJob(
  context,
  String id,
  num hours,
  List<Map<String, dynamic>> parts,
  //List<Map<String, dynamic>> parts,
  num amount,
) async {
  endjobpartController.text = parts.toString();
  endJobbookingIdController.text = id;
  endJobhoursController.text = hours.toString();
  log("_____parts____$parts");
  //num totalAmount = amount + num.parse(PriceController.text);

  endJobamountController.text = amount.toString();
  //endJobpartsController.text = parts.toString();
  endJobpartsController.text = parts[0]['pName'];
  endJobPriceController.text = parts[0]['price'].toString();

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
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: endJobbookingIdController,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  labelText: 'BookingId',
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            TextField(
              controller: endJobhoursController,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  labelText: 'Hours',
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            TextField(
              controller: endJobpartsController,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  labelText: 'Parts',
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            TextField(
              controller: endJobPriceController,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                labelText: 'Price',
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            TextField(
              controller: endJobamountController,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                labelText: 'Total Amount',
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              // ignore: unused_local_variable
              String jsonString = endJobpartsController.text;

              List<Part> partsList = endjobpartController.text
                  .split(',')
                  .map((pName) => Part(
                      pName: endJobpartsController.text,
                      price: int.parse(endJobPriceController.text),
                      id: endJobbookingIdController.text))
                  .toList();

              EndJobModel newmodel = EndJobModel(
                  id: endJobbookingIdController.text,
                  hours: num.parse(endJobhoursController.text),
                  parts: partsList,
                  total: num.parse(endJobamountController.text));

              await Provider.of<ExpertJobProvider>(context, listen: false)
                  .EndJob(newmodel);

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
