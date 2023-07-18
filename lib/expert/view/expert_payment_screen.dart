// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:skillmaestro/common/on_boarding/login_screen.dart';
import '../../core/constants.dart';

class ExpertPaymentScreen extends StatelessWidget {
  ExpertPaymentScreen({super.key});

  dynamic vid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 223, 221),
      bottomNavigationBar: null,
      /* appBar: AppBar(
        centerTitle: true,
        backgroundColor: mainColor,
        title: Text(
          'Payment',
        ),
      ), */
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/3d-casual-life-man-holding-payment-terminal.png'),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BoardingLoginScreen()));
              },
              child: Text(('data')))
        ],
      ),
    );
  }
}
