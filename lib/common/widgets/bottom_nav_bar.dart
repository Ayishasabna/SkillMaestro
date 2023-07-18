import 'package:flutter/material.dart';
import 'package:skillmaestro/common/settings/settings_screen.dart';
import '../../admin/view/add_jobs.dart';
import '../../admin/view/admin_home.dart';
import '../../core/constants.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int indexColor = 0;
  // ignore: non_constant_identifier_names
  List Screen = [const AdminHome(), const AddJobs(), const SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Screen[indexColor],
        
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
                          indexColor = 1;
                        });
                      },
                      child: Icon(Icons.add_box,
                          size: 30,
                          color: indexColor == 1 ? Colors.amber : Colors.grey)),
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
