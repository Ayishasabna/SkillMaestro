import 'package:flutter/material.dart';
import '../../core/constants.dart';
import 'all_booking_list.dart';
import 'expert_profile.dart';

class ExpertHomeScreen extends StatelessWidget {
  final List<JobService> jobServices = [
    JobService(
        name: "Bookings",
        icon: Icons.book_online,
        pageRoute: const AllBookingTab()),
    JobService(
        name: "Profile",
        icon: Icons.usb_rounded,
        pageRoute: const ExpertProfile()),
    //JobService(name: "Chat", icon: Icons.business, pageRoute: ChatScreen()),
    //JobService(name: "Job", icon: Icons.camera, pageRoute: JobScreen()),
    // Add more job services as needed
  ];

  ExpertHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: mainColor,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 16.0, // Spacing between columns
          mainAxisSpacing: 16.0, // Spacing between rows
        ),
        itemCount: jobServices.length,
        itemBuilder: (context, index) {
          return JobServiceItem(jobService: jobServices[index]);
        },
      ),
    );
  }
}

class JobServiceItem extends StatelessWidget {
  final JobService jobService;

  const JobServiceItem({super.key, required this.jobService});

  void navigation(BuildContext context, dynamic pageRoute) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => pageRoute));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigation(context, jobService.pageRoute);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Add rounded corners
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(jobService.icon),
            const SizedBox(height: 8.0),
            Text(jobService.name),
          ],
        ),
      ),
    );
  }
}

class JobService {
  final String name;
  final IconData icon;
  final dynamic pageRoute;

  JobService({required this.name, required this.icon, required this.pageRoute});
}
