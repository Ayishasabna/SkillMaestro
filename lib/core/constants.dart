import 'package:flutter/material.dart';

var mainColor = Colors.teal[400];
// Color(0xFF02D1AC);
var normalText = const TextStyle(fontSize: 19, fontWeight: FontWeight.bold);
const SAVE_KEY_NAME = 'User logged in';
//const Color(0xFF02D1AC);

var mediumText = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
var headText = const TextStyle(
    fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black);

IconButton notificationBtnIcon(BuildContext context) {
  return IconButton(
    onPressed: () {
      /* Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotificationScreen(),
          )); */
    },
    icon: const Icon(
      Icons.notifications,
      size: 30,
    ),
  );
}
