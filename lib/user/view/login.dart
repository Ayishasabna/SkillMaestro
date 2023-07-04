import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/expert/view/expert_signin.dart';
import 'package:skillmaestro/user/view/bottom_nav/bottom_nav.dart';
import '../../admin/view/admin_login.dart';
import '../../application/user/user_provider.dart';
import 'user_signup.dart';
import '../../common/widgets/button.dart';
import '../../common/widgets/textfield.dart';

class UserLogin extends StatelessWidget {
  UserLogin({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PopupMenuButton(
                  icon: const Icon(Icons.menu),
                  onSelected: (value) {
                    if (value == 'admin') {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AdminLogin()));
                      const Text('admin');
                    } else if (value == 'expert') {
                      const Text('expert');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ExpertLogin()));
                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(
                      value: 'admin',
                      child: Text('Admin'),
                    ),
                    const PopupMenuItem(
                      value: 'expert',
                      child: Text('Expert'),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(70.0),
              child: Image.asset('assets/tools.png'),
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
                        builder: (context) => const UserSignUp()));
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
              pageroute: const UserBottomNavBar(),
            ) */
            ElevatedButton(
                onPressed: () async {
                  await signInButtonClicked(context);
                },
                child: Text('Login'))
          ],
        ),
      )),
    );
  }

  Future signInButtonClicked(BuildContext context) async {
    log('signin clicked');
    final mobile = signinMobileController.text;
    final password = signinPasswordController.text;

    if (mobile.isEmpty || password.isEmpty) {
      return;
    } else {
      //Provider.of<CommonProvider>(context, listen: false).onloading();

      Provider.of<UserProvider>(context, listen: false)
          .checkUserSignIn(context, mobile, password);
      log('You are someone else');
      //log('===============================mobile==password=====$mobile=====$password');
      // Provider.of<CommonProvider>(context, listen: false)
      //     .offLoading() ;
    }
  }
}
