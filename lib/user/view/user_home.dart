import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/user/get_jobs_provider.dart';
import 'package:skillmaestro/common/widgets/common_widget.dart';
import 'package:skillmaestro/core/constants.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';
import 'package:skillmaestro/user/controller/fetch_jobs_service.dart';
import 'package:skillmaestro/user/model/get_jobs_model.dart';
import 'package:skillmaestro/user/view/all_services.dart';
import 'package:skillmaestro/user/view/job_screen.dart';

import 'login.dart';

class UserHome extends StatelessWidget {
  UserHome({super.key});

  List<dynamic> jobList = [];
  List<dynamic> jobRoles = [];
  List<String> images = [];

  @override
  Widget build(BuildContext context) {
    getUserAccesToken();
    context.read<AlljobsListForUser>().fetchAllJobsForUser();
    /* WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      jobList = await FetchJobs().fetch7Jobs();
      log("-------widgetbinding-----$jobList");
    }); */
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            widgets().sizedboxHeight10(),
            // ignore: sized_box_for_whitespace
            Container(
              height: 400,
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
                    top: 185,
                    child: Image.asset(
                      'assets/Rectangle 19 (1).png',
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    //fetchJobsAndNavigateToJobServices(context, jobList);
                    /*  Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => JobServicesScreen())); */
                  },
                  child: const Text(
                    'Services',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),

            Consumer<AlljobsListForUser>(builder: (context, value, child) {
              //log('------insideconsumer------${value.usersMap}');
              return value.userJobs.length == 0 || value.userJobs.isEmpty
                  ? const Text("No Users available")
                  : Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            //childAspectRatio: 1.0,
                          ),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return UserCard(
                                map: value.userJobs['result'][index]);
                          }),
                    );
            }),

/* 
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: FetchJobs().fetch7Jobs(),
                // Replace with your API call to fetch jobs
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    log("-----------------");
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    log("------------snapshot.data--userhome-----${snapshot.data}");
                    final jobs = snapshot.data!;
                    log("-------jobs.snapshot-----${jobs.length}");
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        //childAspectRatio: 1.0,
                      ),
                      itemCount: 3,
                      //jobs.length,
                      itemBuilder: (context, index) {
                        //final jobRole = jobs[index].result[index].jobRole;

                        return GridTile(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 35,
                              child: Image.network(
                                jobs[index]['image'],
                              ),
                            ),

                            //const Icon(Icons.work),
                            //title: Text(jobs[index]['job_role']),
                            subtitle: Text(jobs[index]['job_role']),
                            onTap: () {
                              // Handle job tile tap
                            },
                          ),
                        );
                      },
                    );
                  } else {
                    return Container(); // Handle empty state
                  }
                },
              ),
            ), */
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0), // Adjust the border radius as needed
          topRight: Radius.circular(50.0), // Adjust the border radius as needed
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
          ],
          backgroundColor: mainColor, // Set your desired background color
          selectedItemColor:
              Colors.white, // Set your desired selected item color
          unselectedItemColor:
              Colors.grey, // Set your desired unselected item color
        ),
      ),
      /* bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: mainColor
              //const Color(0xFF02D1AC)
              ),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
              BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
            ],
          )), */
    );
  }

  Future<void> fetchJobsAndNavigateToJobServices(
      BuildContext context, jobList) async {
    jobRoles = jobList.map((item) => item['job_role'] as String).toList();
    log("-----------------jonbrolellpppppp----------${jobRoles}");

    images = jobList.map((item) => item['image'] as String).toList();
    /*  List<GetJobModel> jobList = await FetchJobs().fetch7Jobs();
    log("-------joblistuserhome--------------$jobList"); */
    //await fetch7Jobs();
  }
}

class CutCornersBorder extends ShapeBorder {
  const CutCornersBorder();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    const double curveRadius = 30.0; // Adjust the curve radius as needed

    final path = Path();
    path.lineTo(rect.left + curveRadius, rect.top);
    path.lineTo(rect.right - curveRadius, rect.top);
    path.lineTo(rect.right, rect.top + curveRadius);
    path.lineTo(rect.right, rect.bottom);
    path.lineTo(rect.left, rect.bottom);
    path.lineTo(rect.left, rect.top + curveRadius);
    path.close();

    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}

class UserCard extends StatelessWidget {
  UserCard({super.key, required this.map});
  Map<String, dynamic> map = {};

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => JobDetailScreen(title: map['job_role'])));
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
              Text(
                'Title:${map['job_role']}',
                // style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
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
