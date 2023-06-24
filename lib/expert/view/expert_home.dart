import 'package:flutter/material.dart';
import '../../core/constants.dart';
import 'all_booking_list.dart';
import 'expert_add_shedule.dart';
import 'expert_profile.dart';
import 'expert_skills.dart';

class ExpertHomeScreen extends StatelessWidget {
  final List<JobService> jobServices = [
    JobService(
        name: "Jobs",
        //icon: Icons.book_online,
        assetname:
            "assets/job-hiring-vacancy-team-interview-career-recruiting.jpg",
        pageRoute: const ExpertSkills()),

    JobService(
      name: "Profile",
      //icon: Icons.usb_rounded,
      pageRoute: const ExpertProfile(),
      assetname:
          "assets/delivery-concept-handsome-african-american-delivery-man-crossed-arms-isolated-grey-studio-background-copy-space.jpg",
    ),

    JobService(
      name: "Shedule",
      //icon: Icons.usb_rounded,
      pageRoute: Schedules(),
      assetname: "assets/online-calendar.jpg",
    ),
    JobService(
      name: "My Bookings",
      //icon: Icons.usb_rounded,
      pageRoute: const AllBookingTab(),
      assetname:
          "assets/hotel-booking-reservation-travel-reception-concept.jpg",
    ),
    //JobService(name: "Chat", icon: Icons.business, pageRoute: ChatScreen()),
    //JobService(name: "Job", icon: Icons.camera, pageRoute: JobScreen()),
    // Add more job services as needed
  ];

  ExpertHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
          ],
          backgroundColor:
              Colors.teal[300], // Set your desired background color
          selectedItemColor:
              Colors.white, // Set your desired selected item color
          unselectedItemColor:
              Colors.grey, // Set your desired unselected item color
        ),
        /*  appBar: AppBar(
          title: const Text("Home"),
          backgroundColor: mainColor,
        ), */
        body: SafeArea(
          child: Column(
            children: [
              /* SizedBox(
            height: 10,
          ), */
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      20.0), // Adjust the value as desired
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 1,
                      offset:
                          Offset(0, 3), // changes the position of the shadow
                    ),
                  ],
                ),
                height: 270,
                width: double.maxFinite,
                child: Image.asset(
                  //"assets/17973908.jpg",
                  "assets/hand-touching-mobile-with-applications.jpg",
                  fit: BoxFit.cover,
                ),
                //color: Colors.amber,
              ),
              SizedBox(
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
            Text(jobService.name),
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
