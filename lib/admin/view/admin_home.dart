import 'package:flutter/material.dart';
//import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:charts_flutter_new/flutter.dart' as charts_flutter_new;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:skillmaestro/admin/view/cancelled_jobs_list.dart';
import 'package:skillmaestro/admin/view/experts_list.dart';
import 'package:skillmaestro/admin/view/jobs_list.dart';
import 'package:skillmaestro/admin/view/users_list.dart';

import 'package:skillmaestro/common/widgets/bottom_nav_bar.dart';
import 'package:skillmaestro/user/view/login.dart';

class AdminHome extends StatelessWidget {
  AdminHome({Key? key}) : super(key: key);

  final List<User> users = [
    User(name: 'User 1', email: 'user1@example.com'),
    User(name: 'User 2', email: 'user2@example.com'),
    User(name: 'User 3', email: 'user3@example.com'),
  ];

  final List<Worker> workers = [
    Worker(name: 'Worker 1', specialization: 'Specialization 1'),
    Worker(name: 'Worker 2', specialization: 'Specialization 2'),
    Worker(name: 'Worker 3', specialization: 'Specialization 3'),
  ];

  final List<Job> jobs = [
    Job(title: 'Job 1', description: 'Description 1', workerCount: 10),
    Job(title: 'Job 2', description: 'Description 2', workerCount: 5),
    Job(title: 'Job 3', description: 'Description 3', workerCount: 7),
  ];

  final List<Job> cancelledJobs = [
    Job(
        title: 'Cancelled Job 1',
        description: 'Cancelled Description 1',
        workerCount: 3),
    Job(
        title: 'Cancelled Job 2',
        description: 'Cancelled Description 2',
        workerCount: 2),
    Job(
        title: 'Cancelled Job 3',
        description: 'Cancelled Description 3',
        workerCount: 1),
  ];

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
                      FlutterSecureStorage storage =
                          const FlutterSecureStorage();
                      storage.delete(key: 'admin_access_token');
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
                        'Users', users.length, const UsersList(), context);
                  case 1:
                    return buildCard(
                        'Workers', workers.length, ExpertList(), context);
                  case 2:
                    return buildCard(
                        'Jobs', jobs.length, const JobsList(), context);
                  case 3:
                    return buildCard('Cancelled Jobs', cancelledJobs.length,
                        const CancelledJobs(), context);
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
      //bottomNavigationBar: BottomNavBar(),
      /* floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
      ), */
      /* bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Color(0xFF02D1AC)),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.amber,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
              BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
            ],
          )), */
    );
  }

  Widget buildPieChart() {
    List<charts_flutter_new.Series<Job, String>> seriesList = [
      charts_flutter_new.Series(
        id: 'Workers',
        data: jobs,
        domainFn: (Job job, _) => job.title,
        measureFn: (Job job, _) => job.workerCount,
        labelAccessorFn: (Job job, _) => '${job.title}: ${job.workerCount}',
      ),
    ];

    return Container(
      height: 300,
      width: 300,
      child: charts_flutter_new.PieChart(
        seriesList,
        animate: true,
        defaultRenderer: charts_flutter_new.ArcRendererConfig(
          arcRendererDecorators: [
            charts_flutter_new.ArcLabelDecorator(
              labelPosition: charts_flutter_new.ArcLabelPosition.inside,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(
      String title, int count, dynamic pageroute, BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Container(
          //height: 100, // Set a fixed height for the card item
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
              SizedBox(height: 8.0),
              Text('Count: $count'),
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

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}

class Worker {
  final String name;
  final String specialization;

  Worker({required this.name, required this.specialization});
}

class Job {
  final String title;
  final String description;
  final int workerCount;

  Job(
      {required this.title,
      required this.description,
      required this.workerCount});
}
