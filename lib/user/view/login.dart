import 'package:flutter/material.dart';
import 'package:skillmaestro/user/view/user_home.dart';
import '../../admin/view/admin_login.dart';
import '../../expert/view/expert_signup.dart';
import 'user_signup.dart';
import '../../common/widgets/button.dart';
import '../../common/widgets/textfield.dart';

class UserLogin extends StatelessWidget {
  const UserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController mobileController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
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
                          builder: (context) => const ExpertSignUp()));
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
              controllerName: mobileController,
              context: context,
            ),
            const SizedBox(
              height: 30,
            ),
            textfield(
              textFieldName: 'Password',
              controllerName: passwordController,
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => UserSignUp()));
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
              pageroute: const UserHome(),
            )
          ],
        ),
      )),
    );
  }
}
