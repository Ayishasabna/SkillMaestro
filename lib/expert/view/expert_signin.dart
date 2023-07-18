import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/expert/expert_provider.dart';
import 'package:skillmaestro/expert/view/expert_signup.dart';
import '../../common/widgets/textfield.dart';

final GlobalKey<FormState> formkey = GlobalKey<FormState>();

class ExpertLogin extends StatelessWidget {
  ExpertLogin({super.key});

  final TextEditingController signinMobileController = TextEditingController();
  final TextEditingController signinPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isLargeScreen = width > 600; // Define a threshold for large screens
    final fontSizeMultiplier =
        isLargeScreen ? 1.5 : 1.0; // Adjust font size for large screens

    return Scaffold(
      body: SafeArea(
          child: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(width * 0.2),
                child: Image.asset('assets/bouncy-gears-and-wrench.gif'
                    //'assets/ac1.png'
                    ),
              ),
              textfield(
                textFieldName: 'Mobile',
                controllerName: signinMobileController,
                fieldname: mobile,
                context: context,
                value: signinMobileController.text,
                keyBoradtype: TextInputType.number,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Phone Number Required';
                  } else if (p0.length > 10 || p0.length < 10) {
                    return 'Enter Valid Phone Number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              textfield(
                textFieldName: 'Password',
                controllerName: signinPasswordController,
                fieldname: password,
                context: context,
                value: signinPasswordController.text,
                keyBoradtype: TextInputType.text,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Password is Required';
                  } else if (p0.length < 8) {
                    return 'Enter 8 digit Password';
                  }
                  return null;
                },
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(
                      fontSize:
                          20 * fontSizeMultiplier, // Apply font size adjustment
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ExpertSignUp()));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 22, color: Colors.amber),
                    ),
                  )
                ],
              ),
              SizedBox(height: height * 0.03),
              // ignore: sized_box_for_whitespace
              Container(
                height: 50 * fontSizeMultiplier, // Apply font size adjustment
                width: 125 * fontSizeMultiplier,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 5,
                        shadowColor: Colors.black,
                        backgroundColor: Colors.teal[400],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        await signInButtonClicked(context);
                      }
                    },
                    child: Text('login',
                        style: TextStyle(
                          fontSize: 20 *
                              fontSizeMultiplier, // Apply font size adjustment
                        ))),
              )
            ],
          ),
        ),
      )),
    );
  }

  Future<void> signInButtonClicked(BuildContext context) async {
    final mobile = signinMobileController.text;
    final password = signinPasswordController.text;
    //final token = await getExpertAccesToken();

    // ignore: use_build_context_synchronously
    Provider.of<ExpertProvider>(context, listen: false)
        .checkExpertSignIn(context, mobile, password);
  }
}
