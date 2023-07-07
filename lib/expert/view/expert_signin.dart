import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/expert/expert_provider.dart';
import 'package:skillmaestro/core/theme/access_token/token.dart';
import 'package:skillmaestro/expert/view/expert_bottom_nav_bar.dart';
import 'package:skillmaestro/expert/view/expert_signup.dart';
import '../../common/widgets/button.dart';
import '../../common/widgets/textfield.dart';

class ExpertLogin extends StatelessWidget {
  ExpertLogin({super.key});

  final TextEditingController signinMobileController = TextEditingController();
  final TextEditingController signinPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(70.0),
              child: Image.asset('assets/bouncy-gears-and-wrench.gif'
                  //'assets/ac1.png'
                  ),
            ),
            textfield(
              textFieldName: 'Mobile',
              controllerName: signinMobileController,
              context: context,
            ),
            const SizedBox(
              height: 30,
            ),
            textfield(
              textFieldName: 'Password',
              controllerName: signinPasswordController,
              context: context,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Not a member?',
                  style: TextStyle(fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ExpertSignUp()));
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 22, color: Colors.amber),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            /* loginSignupButton(
              buttonName: 'Login',
              functionName: () => signInButtonClicked(context),
              pageroute: const expertBottomNavBar(),
            ) */
            Container(
              height: 50,
              width: 125,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shadowColor: Colors.black,
                      backgroundColor: Colors.teal[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () async {
                    await signInButtonClicked(context);
                  },
                  child: Text('login', style: TextStyle(fontSize: 20))),
            )
          ],
        ),
      )),
    );
  }

  Future<void> signInButtonClicked(BuildContext context) async {
    final mobile = signinMobileController.text;
    final password = signinPasswordController.text;

    if (mobile.isEmpty || password.isEmpty) {
      return;
    } else {
      final token = await getExpertAccesToken();
      log('===================token:$token');
      log('=====================mobile:$mobile+++++++++++++++password:$password');

      // ignore: use_build_context_synchronously
      Provider.of<ExpertProvider>(context, listen: false)
          .checkExpertSignIn(context, mobile, password);
    }
  }
}
