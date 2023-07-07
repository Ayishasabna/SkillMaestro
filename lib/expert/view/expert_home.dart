import 'package:flutter/material.dart';
import 'package:skillmaestro/expert/view/expert_selected_job.dart';
import 'package:skillmaestro/user/view/login.dart';
import 'all_booking_list.dart';
import 'expert_add_shedule.dart';
import 'expert_all_booking.dart';
import 'expert_profile.dart';
import 'expert_skills.dart';

class ExpertHomeScreen extends StatelessWidget {
  final List<JobService> jobServices = [
    JobService(
        name: "My Jobs",
        //icon: Icons.book_online,
        assetname: "assets/project1.png",
        // "assets/job-1.jpg",
        pageRoute: const ExpertSelectedJobs()),
    JobService(
        name: "Profile",
        //icon: Icons.usb_rounded,
        pageRoute: const ExpertProfile(),
        assetname: "assets/business-3d-tech-support-1.png"),
    JobService(
      name: "Shedule",
      //icon: Icons.usb_rounded,
      pageRoute: Schedules(),
      assetname: "assets/shedule.png",
      //"assets/online-calendar.jpg",
    ),
    JobService(
      name: "My Bookings",
      //icon: Icons.usb_rounded,
      pageRoute: ExpertAllBooking(),
      //const AllBookingTab(),
      assetname: "assets/booking3.jpg",
      //"assets/booking1.jpg",
    ),
  ];

  ExpertHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ExpertSkills()));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.amber,
        ),
        floatingActionButtonLocation: _CustomFABLocation(),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PopupMenuButton(
                    icon: const Icon(Icons.menu),
                    onSelected: (value) {
                      if (value == 'logout') {
                        //deleteUserAccesToken();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserLogin(),
                            ),
                            (route) => false);
                        const Text('logout');
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                        value: 'logout',
                        child: Text('Logout'),
                      ),
                    ],
                  ),
                ],
              ),
              /* SizedBox(
                height: 40,
              ), */
              Image.asset(
                "assets/casual-life-3d-man-chatting-on-dating-site.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: .9,
                    crossAxisCount: 2, // Number of columns in the grid
                    crossAxisSpacing: 16.0, // Spacing between columns
                    mainAxisSpacing: 16.0, // Spacing between rows
                  ),
                  itemCount: jobServices.length,
                  itemBuilder: (context, index) {
                    return JobServiceItem(jobService: jobServices[index]);
                  },
                ),
              ),
            ],
          ),
        ));
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
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Add rounded corners
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              jobService.assetname,
              fit: BoxFit.cover,
            ),
            //Icon(jobService.icon),
            const SizedBox(height: 8.0),
            Text(
              jobService.name,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class JobService {
  final String name;
  //final IconData icon;
  final dynamic pageRoute;
  final String assetname;

  JobService(
      {required this.name,
      //required this.icon,
      required this.pageRoute,
      required this.assetname});
}

class _CustomFABLocation extends FloatingActionButtonLocation {
  const _CustomFABLocation();

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = scaffoldGeometry.scaffoldSize.width / 2.5;
    final double fabY =
        scaffoldGeometry.contentTop - kToolbarHeight / 2.0 + 710.0;
    return Offset(fabX, fabY);
  }

  @override
  String toString() => 'FloatingActionButtonLocation.centerDocked';
}
