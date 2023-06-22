/* import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skillmaestro/core/constants.dart';
import 'package:skillmaestro/user/view/job_screen.dart';

import '../controller/fetch_jobs_service.dart';

class JobServicesScreen extends StatelessWidget {
  List<dynamic> jobList = [];
  /* final List<JobService> jobServices = [
    JobService(name: "Service 1", icon: Icons.ac_unit),
    JobService(name: "Service 2", icon: Icons.build),
    JobService(name: "Service 3", icon: Icons.business),
    JobService(name: "Service 4", icon: Icons.camera),
    // Add more job services as needed
  ]; */

  JobServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Job Services"), backgroundColor: Colors.teal[400]),
      body: FutureBuilder<List<dynamic>>(
        future: FetchJobs().fetch7Jobs(),
        // Replace with your API call to fetch jobs
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final jobs = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                  crossAxisSpacing: 16.0, // Spacing between columns
                  mainAxisSpacing: 16.0, // Spacing between rows
                ),
                itemCount: jobs.length,
                //jobs.length,
                itemBuilder: (context, index) {
                  //final jobRole = jobs[index].result[index].jobRole;
                  //return JobServiceItem(jobService: jobs);

                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => JobScreen()));
                      // Handle the tap on the job service item
                      // e.g., navigate to a details screen
                    },
                    child: Card(
                      elevation: 6, // Adjust the elevation as needed
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            100.0), // Adjust the border radius as needed
                      ),
                      // color: Colors.teal[50],
                      //Color.fromRGBO(239, 241, 238, 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.network(jobs[index]['image']),
                          ), // Display the image

                          Text(jobs[index]['job_role']), // Display the job role
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Container(); // Handle empty state
          }
        },
      ),
    );
  }
}

/* class JobServiceItem extends StatelessWidget {
  List jobService;

  JobServiceItem({super.key, required this.jobService});

  @override
  Widget build(BuildContext context) {
    //log('--jobservice----${jobService}');
    return ListView.builder(
      itemCount: jobService.length,
      itemBuilder: (context, index) {
        //JobService service = jobService[index];
        return InkWell(
          onTap: () {
            // Handle the tap on the job service item
            // e.g., navigate to a details screen
          },
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(jobService[index]['image']), // Display the image
                const SizedBox(height: 8.0),
                Text(jobService[index]['job_role']), // Display the job role
              ],
            ),
          ),
        );
      },
    );
  }
 */
/*   @override
  Widget build(BuildContext context) {
    log('--jobservice----${jobService}');
    return InkWell(
      onTap: () {
        // Handle the tap on the job service item
        // e.g., navigate to a details screen
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Icon(jobService),
            const SizedBox(height: 8.0),
            Text(jobService),
          ],
        ),
      ),
    );
  } */


/* class JobService {
  final String job_role;
  final Image image;

  JobService({required this.job_role, required this.image});
} */
 */