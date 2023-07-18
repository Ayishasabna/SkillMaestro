import 'package:flutter/material.dart';
import 'package:skillmaestro/common/on_boarding/login_screen.dart';
import 'package:skillmaestro/common/on_boarding/third_screen.dart';
import '../widgets/button.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // ignore: avoid_types_as_parameter_names
        child: LayoutBuilder(builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;
          final isLargeScreen =
              screenWidth > 600; // Adjust the threshold for large screens

          return Column(
            children: [
              SizedBox(
                height: screenHeight *
                    0.1, // Adjust the height of the first SizedBox
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    isLargeScreen ? 'assets/second1.png' : 'assets/second2.png',
                    width: isLargeScreen
                        ? screenWidth * 0.2
                        : screenWidth * 0.8, // Adjust the image width
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight *
                    0.00, // Adjust the height of the second SizedBox
              ),
              Text(
                "We provide \n    Professional service \n          at a friendly price",
                style: TextStyle(
                  fontSize: isLargeScreen ? 30 : 25, // Adjust the font size
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: screenHeight *
                    0.05, // Adjust the height of the third SizedBox
              ),
              onBoradingButton(
                firstname: const BoardingLoginScreen(),
                secondname: const ThirdScreen(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
