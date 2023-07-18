import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skillmaestro/application/user/get_jobs_provider.dart';
import 'package:skillmaestro/common/widgets/common_widget.dart';
import 'package:skillmaestro/core/constants.dart';
import 'package:skillmaestro/expert/view/expert_bottom_nav_bar.dart';
import 'package:skillmaestro/user/view/payment_description_screen.dart.dart';
import 'package:skillmaestro/user/view/user_booking_description.dart';

import '../../application/common/common_provider.dart';

Map<String, dynamic> map = {};
List<dynamic> results = [];

class ViewAllBookingScreen extends StatelessWidget {
  ViewAllBookingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CommonProvider>(context, listen: false)
          .setShimmerLoading(true);
      Future.delayed(const Duration(milliseconds: 700), () {
        context.read<CommonProvider>().setShimmerLoading(false);
      });
    });
    context.read<AlljobsListForUser>().GetUserBookings();
    //context.read<CommonProvider>();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: mainColor,
        centerTitle: true,
        title: const Text(
          'Your Bookings ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer2<AlljobsListForUser, CommonProvider>(
          builder: (context, value, value2, child) {
        //log('_________________map______________$map');

        //log('_____________ newresults__________________${map['result']}');
        //log('_____________ jobrole__________________${results[0]}');
        map = value.userBooking;
        /* if (map['result'] != null) {
          //CircularProgressIndicator();
          results = map['result'];
        } else if (map['result'] == null) {
          CircularProgressIndicator();
        } */

        if (map['result'] != null) {
          results = map['result'];
        }

        return results.length == 0 || results.isEmpty
            ? CircularProgressIndicator()
            //const Text("No Booking Available")
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    child: GestureDetector(
                        onTap: () async {
                          /*    await context
                      .read<SingleGigDetailsProvider>()
                      .getGig(value.allGigs![index].id, context);
                  if (context.mounted) {
                    await Provider.of<ReservedGigs>(context, listen: false)
                        .getreveiws(value.allGigs![index].id);
                  }
                  await Provider.of<ReservedGigs>(context, listen: false)
                      .getreveiws(value.allGigs![index].id);

                  if (context.mounted) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceDescriptionScrn(
                            isBooked: false,
                          ),
                        ));
                  } */
                        },
                        child: value2.shimmerLoading
                            ? getRecentShimmer(height, width)
                            : UserCard(map: results[index])),
                  );
                },
                itemCount: results.length,
              );
      }),
    );
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

class UserCard extends StatelessWidget {
  UserCard({super.key, required this.map});
  Map<String, dynamic> map = {};

  @override
  Widget build(BuildContext context) {
    //List<dynamic> results = map['result'];

    String buttonText = map['status'];

    return GestureDetector(
      onTap: () {
        if (map['status'] == 'completed' ||
            map['status'] == 'pending' ||
            map['status'] == 'closed' ||
            map['status'] == 'started') {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UserBookingDescription(
                    map: map,
                  )));
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(
                    "You have already cancelled your job.",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.blue),
                  ),
                );
              });
        }

        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => expertBottomNavBar(
        //           map: map,
        //         )));
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber // Set the desired color here
                    ),
                onPressed: () {
                  /*  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PaymentScreen())); */
                  /* if (map['isBanned'] == true) {
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
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.green)),
                                child: const Text(
                                  "Approve",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        );
                      },
                    );
                  } */
                },
                child: Text(buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
