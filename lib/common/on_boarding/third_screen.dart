import 'package:flutter/material.dart';
import 'package:skillmaestro/common/on_boarding/login_screen.dart';
import '../widgets/button.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isLargeScreen =
        screenHeight > 600; // Adjust the threshold for large screens

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height:
                  screenHeight * 0.1, // Adjust the height of the first SizedBox
            ),
            Image.asset(
              'assets/Electrician-PNG-Picture.png',
              height: isLargeScreen
                  ? screenHeight * 0.5
                  : screenHeight * 0.2, // Adjust the image height
            ),
            SizedBox(
              height: screenHeight *
                  0.05, // Adjust the height between image and text
            ),
            Text(
              'The best result and \nyour satisfaction is our \ntop priority',
              style: TextStyle(
                fontSize: isLargeScreen ? 25 : 20, // Adjust the font size
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screenHeight *
                  0.07, // Adjust the height between text and button
            ),
            onBoradingButton(
              firstname: const BoardingLoginScreen(),
              secondname: const BoardingLoginScreen(),
            ),
          ],
        ),
      ),
    );
  }
  
}
