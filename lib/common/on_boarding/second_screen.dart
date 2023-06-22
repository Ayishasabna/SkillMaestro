import 'package:flutter/material.dart';
import 'package:skillmaestro/user/view/login.dart';
import 'package:skillmaestro/common/on_boarding/third_screen.dart';
import '../widgets/button.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      // ignore: avoid_types_as_parameter_names
      child: LayoutBuilder(builder: (context, constraints) {
        // ignore: unused_local_variable
        final screenWidth = MediaQuery.of(context).size.width;
        return Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Image.asset('assets/second1.png'),
                Image.asset('assets/second2.png')
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "We provide \n  Professional service \n at a friendly price",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 60,
            ),
            onBoradingButton(
              firstname: UserLogin(),
              secondname: const ThirdScreen(),
            )
          ],
        );
      }),
    ));
  }
}
