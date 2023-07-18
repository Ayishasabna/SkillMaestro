import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skillmaestro/common/on_boarding/login_screen.dart';
import 'package:skillmaestro/common/on_boarding/second_screen.dart';
import '../../core/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/polar-mechanic.gif'),
            const SizedBox(height: 40),
            const Text(
              'Skill \n    Maestro',
              style: TextStyle(fontSize: 50),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
  /* Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Center(
              child: Image.asset('assets/polar-mechanic.gif'),
            ),
            const SizedBox(height: 40),
            const Text(
              'Skill \n    Maestro',
              style: TextStyle(fontSize: 50),
            ),
            const SizedBox(
              height: 20,
              width: 20,
            )
          ],
        ));
  } */

  Future<void> gotoLogin() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) => const SecondScreen()),
    );
  }

  Future<void> checkUserLoggedIn() async {
    final sharedpref = await SharedPreferences.getInstance();

    final userLoggedIn = sharedpref.getBool(SAVE_KEY_NAME);
    if (userLoggedIn == null || userLoggedIn == false) {
      gotoLogin();
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx1) => const BoardingLoginScreen()));
    }
  }
}
