import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/expert/get_jobs_provider.dart';
import '../../core/constants.dart';

Map<String, dynamic> map = {};

class AllBookingTab extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  AllBookingTab({Key? key, required this.map});
  Map<String, dynamic> map = {};
  @override
  Widget build(BuildContext context) {
    //context.read<ExpertAllJobsProvider>().GetMyBookings();
    log("_______________my bookings_____________");
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
            List<dynamic> results = map['result'];
            log('__________________________addresses____________________________$results');

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
                        'Name: ${results[0]['address']['name']}',
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
              /* Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Expert Information'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Username: string'),
                          Text('Email: string'),
                          Text('Mobile: string'),
                          // Add more expert information here
                        ],
                      ),
                    ),
                  ],
                ),
              ), */
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
                          Text('Job Role: ${results[0]['jobId']['job_role']}'),
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
                            'Name: ${results[0]['address']['name']}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'House: ${results[0]['address']['house']}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Street: ${results[0]['address']['street']}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Pincode: ${results[0]['address']['pincode']}',
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
              )
            ]);
          },
        ));
  }
}
