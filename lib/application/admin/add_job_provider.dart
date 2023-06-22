import 'dart:io';

import 'package:flutter/material.dart';

import '../../common/widgets/bottom_nav_bar.dart';

class AddJobProvider with ChangeNotifier {
  File? image;
  final job = TextEditingController();
  final bRate = TextEditingController();
  final adRate = TextEditingController();

/*   Future<void> checkAddJob(context) async {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavBar(),
        ),
        (route) => false);
  } */
  //UserLogin().disposeTextFiled();
}
