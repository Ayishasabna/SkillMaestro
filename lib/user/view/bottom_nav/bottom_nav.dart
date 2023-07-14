import 'package:flutter/material.dart';
import 'package:skillmaestro/user/view/user_home.dart';
import '../../../common/settings/settings_screen.dart';
import '../../../core/constants.dart';
import '../all_booking_screen.dart';
import '../chat/message_screen.dart';

class UserBottomNavBar extends StatefulWidget {
  const UserBottomNavBar({super.key});

  @override
  State<UserBottomNavBar> createState() => _UserBottomNavBarState();
}

class _UserBottomNavBarState extends State<UserBottomNavBar> {
  int currentIndex = 0;

  List bottomNavScreens = [
    UserHome(),
    MessageScreen(),
    ViewAllBookingScreen(),
    SettingsScreen()
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
