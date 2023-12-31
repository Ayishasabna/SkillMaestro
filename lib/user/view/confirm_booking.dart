import 'package:flutter/material.dart';
import 'package:skillmaestro/common/widgets/common_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bottom_nav/bottom_nav.dart';

class BookingStatus extends StatelessWidget {
  const BookingStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Have any questions? Reach directly to our Customer Support'),
        ],
      ),
      body: Column(
        children: [
          widgets().sizedboxHeight40(),
          const Center(
            child:
                Image(image: AssetImage('assets/59945-success-confetti.gif')),
          ),
          const Text(
            'Thank You',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            'Booking Confirmed!',
            style: GoogleFonts.publicSans(
                fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Your booking has been placed successfully.',
            style: TextStyle(fontSize: 15),
          ),
          widgets().sizedboxHeight20(),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const UserBottomNavBar()),
                  (Route<dynamic> route) => false);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    5), // Set the border radius to 0 to create a square button
              ),
              elevation: 3, // Set the elevation of the button
              backgroundColor: Colors
                  .green.shade400, // Set the background color of the button
            ),
            child: const Text(
              'Back To Home',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
