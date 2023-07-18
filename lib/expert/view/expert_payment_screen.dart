// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:skillmaestro/common/on_boarding/login_screen.dart';


// ignore: must_be_immutable
class ExpertPaymentScreen extends StatelessWidget {
  ExpertPaymentScreen({super.key});

  dynamic vid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 223, 221),
      bottomNavigationBar: null,
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/3d-casual-life-man-holding-payment-terminal.png'),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const BoardingLoginScreen()));
              },
              child: const Text(('data')))
        ],
      ),
    );
  }
}
