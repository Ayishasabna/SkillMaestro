import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/user/view/job_screen.dart';
import '../../application/user/get_jobs_provider.dart';

// ignore: must_be_immutable
class JobServicesScreen extends StatelessWidget {
  List<dynamic> jobList = [];

  JobServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AlljobsListForUser>().fetchAllJobsForUser();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("Services For You"),
          backgroundColor: Colors.teal[400]),
      body: Consumer<AlljobsListForUser>(builder: (context, value, child) {
        //log('------insideconsumer------${value.usersMap}');
        // ignore: prefer_is_empty
        return value.userJobs.length == 0 || value.userJobs.isEmpty
            ? const Text("No Jobs available")
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: .8,
                ),
                itemCount: value.userJobs['result'].length,
                itemBuilder: (context, index) {
                  return UserCard(
                    map: value.userJobs['result'][index],
                    name: value.userJobs['result'][index]['job_role'],
                  );
                });
      }),
    );
  }
}

// ignore: must_be_immutable
class UserCard extends StatelessWidget {
  UserCard({super.key, required this.map, required this.name});
  Map<String, dynamic> map = {};
  String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => JobDetailScreen(
                title: map['job_role'],
                id: map['_id'],
                basicRate: map['base_rate'],
                additionalRate: map['add_rate'])));
      },
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(100.0), // Adjust the value as needed
            ),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network("${map['image']}"),
                ],
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
