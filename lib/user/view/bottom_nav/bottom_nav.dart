import 'package:flutter/material.dart';
import 'package:skillmaestro/user/view/user_home.dart';
import '../../../core/constants.dart';

class UserBottomNavBar extends StatefulWidget {
  const UserBottomNavBar({super.key});

  @override
  State<UserBottomNavBar> createState() => _UserBottomNavBarState();
}

class _UserBottomNavBarState extends State<UserBottomNavBar> {
  int currentIndex = 0;

  List bottomNavScreens = [
    UserHome(),
    //AllCategroryList(),
    //const UserChatScreen(),
    //BookingHistory(),
    // UserProfilePage()
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
        unselectedItemColor: Colors.grey.shade600,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: 'All'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_outlined,
              ),
              label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_online), label: 'Bookings'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'profile'),
        ],
      ),
    );
  }
}
