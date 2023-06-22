import 'package:flutter/material.dart';
import '../../user/view/login.dart';
import '../widgets/button.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Image.asset('assets/Electrician-PNG-Picture.png'),
          const SizedBox(
            height: 60,
          ),
          const Text(
            'The best result and \nyour satisfaction is our \ntop priority',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 60,
          ),
          onBoradingButton(
            firstname: UserLogin(),
            secondname: UserLogin(),
          ),
        ],
      )),
    );
  }
}
