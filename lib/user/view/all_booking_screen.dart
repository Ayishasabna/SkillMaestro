import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skillmaestro/application/user/get_jobs_provider.dart';
import 'package:skillmaestro/common/widgets/common_widget.dart';
import 'package:skillmaestro/core/constants.dart';
import 'package:skillmaestro/expert/view/expert_bottom_nav_bar.dart';
import 'package:skillmaestro/user/view/payment_description_screen.dart.dart';

import '../../application/common/common_provider.dart';

Map<String, dynamic> map = {};

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
      body: Consumer2<CommonProvider, AlljobsListForUser>(
          builder: (context, value2, value, child) {
        map = value.userBooking;
        List<dynamic> results = map['result'];

        log('_____________ newresults__________________${map['result']}');
        log('_____________ jobrole__________________${results[0]}');
        return results.length == 0 || value.userBooking.isEmpty
            ? const Text("No Booking Available")
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
                            : UserCard(map: results[index])

                        /* Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    16.0), // Adjust the value as needed
                              ),
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //Image.network("${map['image']}"),
                                        Text(
                                          'Job : ${results}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20),
                                        ),
                                        Text(
                                            'Base Rate: ${map['jobId']['base_rate']}'),
                                        Text(
                                            'Additional Rate: ${map['jobId']['ad_rate']}'),
                                        //Text('createdAt:  ${map['jobId']['createdAt']}'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(Icons.location_on),
                                            Column(
                                              children: [
                                                Text(
                                                  'Name: ${map['address']['name']}',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Text(
                                                  'House: ${map['address']['house']}',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Text(
                                                  'Street: ${map['address']['street']}',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Text(
                                                  'Pincode: ${map['address']['pincode']}',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors
                                              .amber // Set the desired color here
                                          ),
                                      onPressed: () {
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
                                      child: const Text("Approve"),
                                    ),
                                  ],
                                ),
                              ),
                            ), */

                        /* Card(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      height: height / 4,
                                      width: width / 1.10,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15)),
                                        /* image: DecorationImage(
                                        image:
                                        /*  NetworkImage(
                                            value.allGigs![index].image) */
                                        ) */
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "hai",
                                            style: const TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star_rounded,
                                                color: Colors.blue,
                                              ),
                                              Text(
                                                '5.0',
                                                style: TextStyle(fontSize: 19),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            'hai',
                                            style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ), */
                        ),
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
    return GestureDetector(
      onTap: () {
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PaymentScreen()));
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
                child: const Text("Payment"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
