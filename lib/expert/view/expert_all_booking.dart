import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/expert/view/all_booking_list.dart';

import '../../application/expert/get_jobs_provider.dart';

Map<String, dynamic> map = {};

class ExpertAllBooking extends StatelessWidget {
  const ExpertAllBooking({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    context.read<ExpertAllJobsProvider>().GetMyBookings();
    //List<jobProfile> allJobProfiles = [];
    /* WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AllJobsListForAdmin>(context, listen: false).fetchAllJobs();
    }); */
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Jobs"),
          backgroundColor: const Color(0xFF02D1AC),
          //backgroundColor: mainColor,
        ),
        body: Consumer<ExpertAllJobsProvider>(builder: (context, value, child) {
          map = value.booking;
          List<dynamic> results = map['result'];
          // ignore: prefer_is_empty
          return results.length == 0 || value.booking.isEmpty
              ? const Text("No Booking Available")
              : ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    return UserCard(map: results[index]);
                  });
        }));
  }
}

// ignore: must_be_immutable
class UserCard extends StatelessWidget {
  UserCard({super.key, required this.map});
  Map<String, dynamic> map = {};

  @override
  Widget build(BuildContext context) {
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber // Set the desired color here
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
      ),
    );
  }
}
