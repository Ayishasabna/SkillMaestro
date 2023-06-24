import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/expert/get_jobs_provider.dart';
import 'package:skillmaestro/expert/model/expert_sign_in_resp_model.dart';
import '../../core/constants.dart';

class AllBookingTab extends StatelessWidget {
  const AllBookingTab({super.key});

  @override
  Widget build(BuildContext context) {
    final response = context.read<ExpertAllJobsProvider>().GetMyBookings();
    log("++++++++++++++++++++++++++respone+++++++++++$response");
    return Scaffold(
        appBar: AppBar(
          title: const Text('Booking Details'),
          backgroundColor: mainColor,
        ),
        body: Consumer<ExpertAllJobsProvider>(
          builder: (context, value, child) {
            Map<String, dynamic> map = value.response['result'];
            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
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
                            Text('Username: ${map['username']}'),
                            Text('Email: user@example.com'),
                            Text('Mobile: string'),
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
                ),
                // Add more card widgets for other details
              ],
            );
          },
        ));
  }
}
