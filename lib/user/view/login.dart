import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../admin/view/admin_login.dart';
import '../../application/user/user_provider.dart';
import 'user_signup.dart';
import '../../common/widgets/textfield.dart';

final GlobalKey<FormState> formkey = GlobalKey<FormState>();

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PopupMenuButton(
                      icon: const Icon(Icons.menu),
                      onSelected: (value) {
                        if (value == 'admin') {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AdminLogin(),
                          ));
                        }
                      },
                      itemBuilder: (BuildContext context) => [
                        const PopupMenuItem(
                          value: 'admin',
                          child: Text('Admin'),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(
                      width * 0.2), // Adjust padding based on screen width
                  child: Image.asset(
                    'assets/tools.png',
                    width: isLargeScreen
                        ? width * 0.3
                        : width * 0.6, // Adjust image size for large screens
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
                  //function: checkNumber(signinMobileController.text),
                ),
                SizedBox(height: height * 0.03
                    //height: 30,
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
                  //function: checkPass(signinPasswordController.text),
                ),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        fontSize: 20 *
                            fontSizeMultiplier, // Apply font size adjustment
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const UserSignUp(),
                        ));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 22 *
                              fontSizeMultiplier, // Apply font size adjustment
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20 * fontSizeMultiplier, // Apply font size adjustment
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  height: 50 * fontSizeMultiplier, // Apply font size adjustment
                  width: 125 * fontSizeMultiplier, // Apply font size adjustment
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shadowColor: Colors.black,
                      backgroundColor: Colors.teal[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        await signInButtonClicked(context);
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20 *
                            fontSizeMultiplier, // Apply font size adjustment
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signInButtonClicked(BuildContext context) async {
    log('signin clicked');
    final mobile = signinMobileController.text;
    final password = signinPasswordController.text;

    Provider.of<UserProvider>(context, listen: false)
        .checkUserSignIn(context, mobile, password);
    log('You are someone else');
  }
}
