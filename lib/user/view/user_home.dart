// ignore_for_file: unused_field

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/user/get_jobs_provider.dart';
import 'package:skillmaestro/common/on_boarding/login_screen.dart';
import 'package:skillmaestro/common/settings/settings_screen.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';
import 'package:skillmaestro/user/controller/fetch_jobs_service.dart';
import 'package:skillmaestro/user/view/all_services.dart';
import 'package:skillmaestro/user/view/job_screen.dart';

import 'login.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int _currentIndex = 0;
  // ignore: prefer_final_fields
  /* List<Widget> _pages = [
    const UserHome(),
    const UserHome(),
    const SettingsScreen(),
  ]; */

  List<dynamic> jobList = [];

  List<dynamic> jobRoles = [];

  List<String> images = [];

  // ignore: unused_element
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    getUserAccesToken();
    FetchJobs().getJobDetail('cleaning');
    context.read<AlljobsListForUser>().fetchAllJobsForUser();

    return Scaffold(
      body: SafeArea(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PopupMenuButton(
                  icon: const Icon(Icons.menu),
                  onSelected: (value) {
                    if (value == 'logout') {
                      deleteUserAccesToken();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BoardingLoginScreen(),
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
            //widgets().sizedboxHeight10(),
            // ignore: sized_box_for_whitespace
            Container(
              height: 330,
              width: double.maxFinite,
              // color: Colors.white,
              child: Stack(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              Image.asset(
                                'assets/plumber1.png',
                                fit: BoxFit.contain,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    top: 220,
                    child: Image.asset(
                      'assets/home.png',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /* const SizedBox(
                    width: 10,
                  ), */
                  const Text(
                    'Services',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  /* SizedBox(
                    width: 100,
                  ), */
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => JobServicesScreen()));
                    },
                    child: const Text("More",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Consumer<AlljobsListForUser>(builder: (context, value, child) {
              //log('------insideconsumer------${value.usersMap}');
              // ignore: prefer_is_empty
              return value.userJobs.length == 0 || value.userJobs.isEmpty
                  ? const Text("No Users available")
                  : Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            //childAspectRatio: 1.0,
                          ),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return UserCard(
                                map: value.userJobs['result'][index]);
                          }),
                    );
            }),
          ],
        ),
      ),
    );
  }

  Future<void> fetchJobsAndNavigateToJobServices(
      BuildContext context, jobList) async {
    jobRoles = jobList.map((item) => item['job_role'] as String).toList();
    log("-----------------jonbrolellpppppp----------${jobRoles}");

    images = jobList.map((item) => item['image'] as String).toList();
  }
}

class UserCard extends StatelessWidget {
  UserCard({super.key, required this.map});
  Map<String, dynamic> map = {};

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("_________________jobdetail review seen map__________${map}");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => JobDetailScreen(
                title: map['job_role'],
                id: map['_id'],
                basicRate: map['base_rate'],
                additionalRate: map['add_rate'])));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(100.0), // Adjust the value as needed
        ),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network("${map['image']}"),
              /* Text(
                '${map['job_role']}',
                // style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ), */
              // Text('Base Rate: ${map['base_rate']}'),
              //Text('Additional Rate: ${map['ad_rate']}'),
              //Text('createdAt:  ${map['createdAt']}'),
            ],
          ),
        ),
      ),
    );
  }
}
