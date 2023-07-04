import 'package:flutter/material.dart';
import 'package:skillmaestro/admin/view/cancelled_jobs_list.dart';
import 'package:skillmaestro/admin/view/experts_list.dart';
import 'package:skillmaestro/admin/view/jobs_list.dart';
import 'package:skillmaestro/admin/view/users_list.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';
import 'package:skillmaestro/user/view/login.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      deleteAdminAccesToken();
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
                )
              ],
            ),
            const Text(
              'Admin',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),
              itemCount: 4, // Total number of card types
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                switch (index) {
                  case 0:
                    return buildCard(
                        'Users', UsersList(), context, Colors.green);
                  case 1:
                    return buildCard('Experts', const AllExpertForAdmin(),
                        context, Colors.grey);
                  case 2:
                    return buildCard(
                        'Jobs', const JobsList(), context, Colors.lime);
                  case 3:
                    return buildCard('Cancelled Jobs', const CancelledJobs(),
                        context, Colors.cyan);
                  default:
                    return Container(
                      color: Colors.amberAccent,
                    ); // Placeholder if needed
                }
              },
            ),
            const Text('Number of Workers per Job'),
            const SizedBox(height: 8.0),
            /*  Container(
              height: 50,
              //width: 300,
              color: Colors.grey,
              //width: 50,
              child: buildPieChart(),
            ), */
          ],
        ),
      ),
    );
  }

  Widget buildCard(
      String title, dynamic pageroute, BuildContext context, Color colors) {
    return GestureDetector(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Add rounded corners
        ),
        color: colors,
        // ignore: avoid_unnecessary_containers
        child: Container(
          //height: 100, // Set a fixed height for the card item
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 8.0),
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 8.0),
              //Text('Count: $count'),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => pageroute));
      },
    );
  }
}
