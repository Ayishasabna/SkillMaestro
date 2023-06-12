import 'package:flutter/material.dart';
import 'package:skillmaestro/common/widgets/common_widget.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(Icons.menu),
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
            children: const [
              SizedBox(
                width: 20,
              ),
              Text(
                'Services',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      )),
      bottomNavigationBar: Theme(
          data:
              Theme.of(context).copyWith(canvasColor: const Color(0xFF02D1AC)),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
              BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
            ],
          )),
    );
  }
}
