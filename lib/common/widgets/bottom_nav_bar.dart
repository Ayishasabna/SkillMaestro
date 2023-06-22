import 'package:flutter/material.dart';
//import 'package:skillmaestro/features/presentation/pages/admin/admin_home.dart';
import 'package:skillmaestro/user/view/user_home.dart';

import '../../admin/view/add_jobs.dart';
import '../../admin/view/admin_home.dart';
import '../../core/constants.dart';
//import '../pages/admin/add_jobs.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int indexColor = 0;
  // ignore: non_constant_identifier_names
  List Screen = [AdminHome(), UserHome(), UserHome()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Screen[indexColor],
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const AddJobs()));
          },
          // ignore: sort_child_properties_last
          child: const Icon(Icons.add),
          backgroundColor: mainColor,
          // Colors.amber,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: mainColor
              //Color(0xFF02D1AC)
              ),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Padding(
              padding: const EdgeInsets.only(top: 7.5, bottom: 7.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          indexColor = 0;
                        });
                      },
                      child: Icon(Icons.home,
                          size: 30,
                          color: indexColor == 0 ? Colors.amber : Colors.grey)),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          indexColor = 2;
                        });
                      },
                      child: Icon(
                        Icons.info,
                        size: 30,
                        color: indexColor == 2 ? Colors.amber : Colors.grey,
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
