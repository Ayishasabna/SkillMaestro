import 'package:flutter/material.dart';
import 'package:skillmaestro/user/view/user_home.dart';

import '../../common/widgets/button.dart';
import '../../common/widgets/common_widget.dart';
import '../../common/widgets/textfield.dart';

final TextEditingController userNameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController mobileController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();

class ExpertSignUp extends StatefulWidget {
  const ExpertSignUp({super.key});

  @override
  State<ExpertSignUp> createState() => _ExpertSignUpState();
}

class _ExpertSignUpState extends State<ExpertSignUp> {
  /* Future<void> signup() async {
    final String userName = userNameController.text;
    final String email = emailController.text;
    final String mobile = mobileController.text;
    final String password = passwordController.text;
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Sign Up',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
          ),
          //Image.asset('assets/3d-casual-life-window-with-new-users.png'),
          const SizedBox(
            height: 40,
          ),
          widgets().sizedboxHeight10(),
          textfield(
            textFieldName: 'Username',
            controllerName: userNameController,
            context: context,
          ),
          widgets().sizedboxHeight40(),
          textfield(
            textFieldName: 'Email',
            controllerName: emailController,
            context: context,
          ),
          widgets().sizedboxHeight40(),
          textfield(
            textFieldName: 'Mobile',
            controllerName: mobileController,
            context: context,
          ),
          widgets().sizedboxHeight40(),
          textfield(
            textFieldName: 'Password',
            controllerName: passwordController,
            context: context,
          ),
          widgets().sizedboxHeight40(),
          textfield(
            textFieldName: 'Confirm Password',
            controllerName: confirmPasswordController,
            context: context,
          ),
          widgets().sizedboxHeight40(),

          loginSignupButton(
            buttonName: 'Sign Up',
            pageroute: UserHome(),
          )
        ],
      )),
    );
  }
}
