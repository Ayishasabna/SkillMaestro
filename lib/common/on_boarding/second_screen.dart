import 'package:flutter/material.dart';
//import 'package:skillmaestro/features/presentation/pages/on_boarding/third_screen.dart';
import 'package:skillmaestro/user/view/login.dart';
import 'package:skillmaestro/common/on_boarding/third_screen.dart';

import '../widgets/button.dart';
//import '../../widgets/button.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image.asset('assets/second1.png'),
              Image.asset('assets/second2.png')
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "We provide \n  Professional service \n at a friendly price",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          onBoradingButton(
            firstname: UserLogin(),
            secondname: ThirdScreen(),
          )
        ],
      ),
    ));
  }
}
