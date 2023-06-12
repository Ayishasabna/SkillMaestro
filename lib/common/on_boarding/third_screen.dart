import 'package:flutter/material.dart';
//import '../../widgets/button.dart';
import '../../user/view/login.dart';
import '../widgets/button.dart';
//import '../user/login.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Image.asset('assets/Electrician-PNG-Picture.png'),
          SizedBox(
            height: 60,
          ),
          Text(
            'The best result and \nyour satisfaction is our \ntop priority',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 40,
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
