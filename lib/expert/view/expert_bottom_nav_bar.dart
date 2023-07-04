import 'package:flutter/material.dart';
import 'package:skillmaestro/common/settings/settings_screen.dart';
import 'package:skillmaestro/expert/view/expert_chat.dart';
import 'package:skillmaestro/expert/view/expert_home.dart';
import 'package:skillmaestro/expert/view/expert_payment_screen.dart';
import '../../core/constants.dart';

// ignore: camel_case_types
class expertBottomNavBar extends StatefulWidget {
  const expertBottomNavBar({super.key});

  @override
  State<expertBottomNavBar> createState() => _expertBottomNavBarState();
}

// ignore: camel_case_types
class _expertBottomNavBarState extends State<expertBottomNavBar> {
  int currentIndex = 0;

  List bottomNavScreens = [
    ExpertHomeScreen(),
    ExpertChatScrn(),
    ExpertPaymentScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavScreens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        type: BottomNavigationBarType.shifting,
        elevation: 20.0,
        currentIndex: currentIndex,
        selectedItemColor: mainColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.message_rounded,
              ),
              label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.payment,
              ),
              label: 'Payment'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'settings'),
          /* BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Profile'), */
        ],
      ),
    );
  }
}
