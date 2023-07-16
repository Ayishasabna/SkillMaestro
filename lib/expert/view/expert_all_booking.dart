import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skillmaestro/expert/model/expert_add_job_model.dart';
import 'package:skillmaestro/expert/view/all_booking_list.dart';

import '../../application/common/common_provider.dart';
import '../../application/expert/expert_job_detail_provider.dart';
import '../../application/expert/get_jobs_provider.dart';
import '../../common/widgets/common_widget.dart';
import '../model/end_job_model.dart';

Map<String, dynamic> map = {};
TextEditingController endJobbookingIdController = TextEditingController();
TextEditingController endJobhoursController = TextEditingController();
TextEditingController endJobpartsController = TextEditingController();
TextEditingController endJobamountController = TextEditingController();
TextEditingController endJobPriceController = TextEditingController();
TextEditingController endjobpartController = TextEditingController();

class ExpertAllBooking extends StatelessWidget {
  ExpertAllBooking({super.key});
  List<dynamic> results = [];
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
    //List<jobProfile> allJobProfiles = [];
    /* WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AllJobsListForAdmin>(context, listen: false).fetchAllJobs();
    }); */
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
          // ignore: prefer_is_empty
          // return results.length == 0 || value.booking.isEmpty
          //     ? const Text("No Booking Available")
          return value.booking == null || value.booking.isEmpty
              ? CircularProgressIndicator()
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
    log('___________________mappppp________${map}');
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AllBookingTab(
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.location_on),
                      Column(
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
                        // map['_id']
                        Provider.of<ExpertJobProvider>(context, listen: false)
                            .StartJob(map['_id']);
                        Navigator.of(context).pop();
                      },
                      child: Text('start Job')),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.amber // Set the desired color here
                        ),
                    onPressed: () {
                      List<dynamic> dynamicList = map['estimate']['parts'];
                      //List<Map<String, dynamic>> maplist =
                      List<Map<String, dynamic>> mapList =
                          dynamicList.map((item) {
                        return Map<String, dynamic>.from(item);
                      }).toList();

                      log('______mapstringdynamic_____${mapList}');
                      EndJob(context, map['_id'], map['estimate']['hours'],
                          mapList, map['estimate']['amount']);
                      /* sendEstimate(
                          context,
                          results[0]['_id'],
                          results[0]['estimate']['hours'],
                          results[0]['estimate']['parts'],
                          results[0]['jobId']['base_rate']); */
/* 
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Approve Booking'),
                            content: Text(
                                "Are You Sure You Want To Approve ${map['approve']}}"),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel")),
                              ElevatedButton(
                                  onPressed: () {
                                    /* value.approveExpert(
                                          value.allExperts![index]!.id); */

                                    Navigator.pop(context);
                                  },
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.green)),
                                  child: const Text(
                                    "Approve",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          );
                        },
                      ); */
                    },
                    child: const Text("End Job"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
  //String partsText = parts.join(',');
  // try {
  //   Map<String, dynamic> partsMap = jsonDecode(partsText);
  //   String pName = partsMap['pName'];
  //   // Use the extracted pName value as needed
  //   // ...
  // } catch (e) {
  //   // Handle the error
  //   print('Error decoding partsText: $e');
  // }

  //endJobpartsController.text = partsText;
  //Map<String, dynamic> partsMap = jsonDecode(partsText);
  //String pName = partsMap['pName'];

  // log('______________partstext __________${pName}');

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
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: endJobbookingIdController,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  labelText: 'BookingId',
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            TextField(
              controller: endJobhoursController,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  labelText: 'Hours',
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            TextField(
              controller: endJobpartsController,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                  labelText: 'Parts',
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            TextField(
              controller: endJobPriceController,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                labelText: 'Price',
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            TextField(
              controller: endJobamountController,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                labelText: 'Total Amount',
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              log('________newpartsList____________${endJobpartsController.text}');
              log('________newprices____________${endJobPriceController.text}');

              ///List<dynamic> _partsList = endJobpartsController.text;
              String jsonString = endJobpartsController.text;

              //Map<String, dynamic> partsMap = jsonDecode(jsonString[0]);
              //log('_________jsonDecode____________${partsMap}');
              //String pName = partsMap['pName'];
              //log('_______________pName_________');
              //num price = partsMap['price'].toDouble();
              // if (_partsList.isNotEmpty) {
              //   log('_______________pName_________');
              //   Map<String, dynamic> firstPart = _partsList[0];
              //   String pName = firstPart['pName'];
              //   log('pName: $pName');
              // }
              //List<dynamic> partsList = endJobpartsController.text.split(',');

              //num price = num.parse(endJobPriceController.text);

              //log("_____________AmountController__________${price}");
              //log("_____________HoursController__________${hoursController.text}");

              //List<dynamic> partsList = partsController.text;

              //log('_partsList____________$partsList');

              List<Part> partsList = endjobpartController.text
                  .split(',')
                  .map((pName) => Part(
                      pName: endJobpartsController.text,
                      price: int.parse(endJobPriceController.text),
                      id: endJobbookingIdController.text))
                  .toList();
              log('_________ListpartsList____________${partsList[0]}');
              EndJobModel newmodel = EndJobModel(
                  id: endJobbookingIdController.text,
                  hours: num.parse(endJobhoursController.text),
                  parts: partsList,
                  total: num.parse(endJobamountController.text));

              await Provider.of<ExpertJobProvider>(context, listen: false)
                  .EndJob(newmodel);
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
