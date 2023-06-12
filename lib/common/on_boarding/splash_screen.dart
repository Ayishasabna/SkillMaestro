import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:skillmaestro/common/on_boarding/second_screen.dart';
import 'package:skillmaestro/user/view/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      moveToNextPage(context);
    });
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Center(
              child: Image.asset('assets/polar-mechanic.gif'),
            ),
            SizedBox(height: 40),
            Text(
              'Skill \n    Maestro',
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(
              height: 20,
              width: 20,
              /* child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SecondScreen()));
                  },
                  child: SecondScreen()), */
            )
          ],
        ));
  }

  Future<void> moveToNextPage(context) async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterSecureStorage storage = const FlutterSecureStorage();
    final storageTokenData = await storage.read(key: 'user_access_token');
    log(storageTokenData.toString());
    if (storageTokenData != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const SecondScreen(),
          ),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => SecondScreen(),
          ),
          (route) => false);
    }
  }
}
