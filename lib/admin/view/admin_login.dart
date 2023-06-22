import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/application/admin/admin_provider.dart';
import 'package:skillmaestro/common/widgets/common_widget.dart';
import 'package:skillmaestro/common/widgets/textfield.dart';

TextEditingController emailController = TextEditingController();
TextEditingController adminPasswordController = TextEditingController();

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/3d-fluency-worker.png'),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Admin',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            widgets().sizedboxHeight40(),
            textfield(
              textFieldName: 'Email',
              controllerName: emailController,
              context: context,
            ),
            widgets().sizedboxHeight40(),
            textfield(
              textFieldName: 'Password',
              controllerName: adminPasswordController,
              context: context,
            ),
            widgets().sizedboxHeight40(),
            //loginSignupButton(buttonName: 'Login', pageroute: AdminHome())
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
                  Provider.of<AdminProvider>(context, listen: false)
                      .checkAdminSignIn(context, emailController.text,
                          adminPasswordController.text);
                },
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
