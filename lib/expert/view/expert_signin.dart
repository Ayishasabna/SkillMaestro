import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/expert/expert_provider.dart';
import 'package:skillmaestro/expert/view/expert_home.dart';
import 'package:skillmaestro/expert/view/expert_profile.dart';
import 'package:skillmaestro/expert/view/expert_signup.dart';

import '../../common/widgets/button.dart';
import '../../common/widgets/textfield.dart';
import '../../user/view/user_home.dart';

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
              child: Image.asset('assets/ac1.png'),
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
            loginSignupButton(
              buttonName: 'Login',
              functionName: () => signInButtonClicked(context),
              pageroute: ExpertHomeScreen(),
            )
          ],
        ),
      )),
    );
  }

  void signInButtonClicked(BuildContext context) async {
    log('signin clicked');
    final mobile = signinMobileController.text;
    final password = signinPasswordController.text;

    if (mobile.isEmpty || password.isEmpty) {
      return;
    }
    /*  if (mobile == 'smarticoapp23@gmail.com') {
      log('You are Admin');
      // Provider.of<CommonProvider>(context, listen: false).onloading();

      Provider.of<AdminProvider>(context, listen: false)
          .checkAdminSignIn(context, email, password);

      // Provider.of<CommonProvider>(context, listen: false)
          // .offLoading();
    }  */
    else {
      log('You are someone else');
      // Provider.of<CommonProvider>(context, listen: false).onloading();

      Provider.of<ExpertProvider>(context, listen: false)
          .checkExpertSignIn(context, password, mobile);
      // Provider.of<CommonProvider>(context, listen: false)
      //     .offLoading() ;
    }
  }
}
