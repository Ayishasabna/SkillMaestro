import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/expert/expert_provider.dart';
import 'package:skillmaestro/user/view/user_home.dart';

import '../../common/widgets/button.dart';
import '../../common/widgets/common_widget.dart';
import '../../common/widgets/textfield.dart';
import '../../user/view/validator.dart';

final TextEditingController userNameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController mobileController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();

String? username;
String? email;
String? mobile;
String? password;
String? confrmpasswrd;

class ExpertSignUp extends StatefulWidget {
  const ExpertSignUp({super.key});

  @override
  State<ExpertSignUp> createState() => _ExpertSignUpState();
}

class _ExpertSignUpState extends State<ExpertSignUp> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Form(
            key: formkey,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(Icons.arrow_back)),
                          ],
                        ),
                        const Text(
                          'Expert Sign Up',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        //widgets().sizedboxHeight10(),

                        textfield(
                            textFieldName: 'Username',
                            controllerName: userNameController,
                            fieldname: username,
                            context: context,
                            value: userNameController.text,
                            function: checkUserName(userNameController.text)),
                        const SizedBox(height: 30),
                        textfield(
                          textFieldName: 'Email',
                          controllerName: emailController,
                          fieldname: email,
                          value: emailController.text,
                          function: checkEmail(emailController.text),
                          context: context,
                        ),
                        const SizedBox(height: 30),
                        textfield(
                          textFieldName: 'Mobile',
                          controllerName: mobileController,
                          fieldname: mobile,
                          value: mobileController.text,
                          function: checkNumber(mobileController.text),
                          context: context,
                        ),
                        const SizedBox(height: 30),
                        textfield(
                          textFieldName: 'Password',
                          controllerName: passwordController,
                          fieldname: password,
                          value: passwordController.text,
                          function: checkPass(passwordController.text),
                          context: context,
                        ),
                        const SizedBox(height: 30),
                        textfield(
                          textFieldName: 'Confirm Password',
                          controllerName: confirmPasswordController,
                          fieldname: confrmpasswrd,
                          value: confirmPasswordController.text,
                          function: confirmPassword(
                              confirmPasswordController.text,
                              passwordController.text),
                          context: context,
                        ),
                        const SizedBox(height: 30),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: 50,
                          width: 125,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 5,
                                shadowColor: Colors.black,
                                backgroundColor: const Color(0xFF26A69A),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                signUPExpert(context);
                              }
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        )
                      ]),
                )),
          ),
        ));
  }

  signUPExpert(BuildContext context) {
    username = userNameController.text;
    email = emailController.text;
    mobile = mobileController.text;
    password = passwordController.text;
    //confrmpasswrd = confirmPasswordController.text;

    //UserSignUpApiService().otpsend('+919746048135');

    Provider.of<ExpertProvider>(context, listen: false).signUPNewExpert(
      context: context,
      username: username,
      email: email,
      mobile: mobile,
      password: password,
    );
  }
}
