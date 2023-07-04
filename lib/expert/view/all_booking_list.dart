import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/expert/get_jobs_provider.dart';
import '../../core/constants.dart';

Map<String, dynamic> map = {};

class AllBookingTab extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const AllBookingTab({Key? key});

  @override
  Widget build(BuildContext context) {
    context.read<ExpertAllJobsProvider>().GetMyBookings();
    log("=====================response============${context.read<ExpertAllJobsProvider>().GetMyBookings()}");
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
            log('=============================valu.booking.result===========${value.booking}');
            return ListView(padding: const EdgeInsets.all(16.0), children: [
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ListTile(
                      leading: Icon(Icons.person),
                      title: Text('User Information'),
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
                        children: const [
                          Text('Job Role: string'),
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
                        children: const [
                          Text('Name: string'),
                          Text('House: string'),
                          Text('Street: string'),
                          Text('Pincode: 0'),
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
