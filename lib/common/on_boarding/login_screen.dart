import 'package:flutter/material.dart';
import 'package:skillmaestro/common/widgets/button.dart';
import 'package:skillmaestro/expert/view/expert_signin.dart';
import 'package:skillmaestro/user/view/login.dart';
import '../../admin/view/admin_login.dart';

// ignore: must_be_immutable
class BoardingLoginScreen extends StatelessWidget {
  const BoardingLoginScreen({super.key});

  //dynamic vid;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isLargeScreen = width > 600; // Define a threshold for large screens
    final imageWidth = isLargeScreen
        ? width * 0.4
        : width * 0.6; // Adjust image width for large screens
    final imageHeight = isLargeScreen
        ? height * 0.2
        : height * 0.7; // Adjust image height for large screens
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 223, 221),
      bottomNavigationBar: null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PopupMenuButton(
                icon: const Icon(Icons.menu),
                onSelected: (value) {
                  if (value == 'admin') {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AdminLogin()));
                    const Text('admin');
                  }
                },
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                    value: 'admin',
                    child: Text('Admin'),
                  ),
                ],
              ),
            ],
          ),
          Image.asset(
            'assets/3d-casual-life-man-holding-payment-terminal.png',
            width: imageWidth,
            height: imageHeight,
          ),
          SizedBox(
            height: height *
                0.1, // Adjust this value for the space between the image and buttons
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              loginSignupButton(
                  buttonName: 'User ', pageroute: const UserLogin()),
              loginSignupButton(buttonName: 'Expert', pageroute: ExpertLogin()),
            ],
          )
        ],
      ),
    );
  }
}
