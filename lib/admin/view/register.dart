import 'package:flutter/material.dart';
import 'package:skillmaestro/user/view/validator.dart';
//import 'package:skillmaestro/features/presentation/pages/admin/validator.dart';

/* class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formkey = new GlobalKey<FormState>();

  late String email, password, name, confirmPass;
  int _radioValue = 0;

  void handleRadioValue(int? value) {
    setState(() {
      _radioValue = value!;
      print(_radioValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Form(
          key: formkey,
          //autovalidate: false,
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome to App",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16.0),
                      Text("Get your work done by experience workers"),
                      SizedBox(height: 40.0),
                      TextFormField(
                        //focusNode: "Enter Your full name",
                        onChanged: (value) {
                          name = value;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        // hint: "Enter Your email",
                        onChanged: (value) {
                          email = value;
                        },
                        validator: (value) => checkEmail(value!),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        "User Type",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 12.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text("Client",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Radio(
                                    value: 1,
                                    groupValue: _radioValue,
                                    onChanged: handleRadioValue)
                              ],
                            ),
                            Column(
                              children: [
                                Text("Worker",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Radio(
                                    value: 2,
                                    groupValue: _radioValue,
                                    onChanged: handleRadioValue)
                              ],
                            )
                          ]),
                      TextFormField(
                        //hint: "Enter Password",
                        //obscure: true,
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (value) => checkPass(value!),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        //hint: "Confirm Password",
                        //obscure: true,
                        onChanged: (value) {
                          confirmPass = value;
                        },
                        validator: (value) => confirmPassword(value!, password),
                      ),
                      SizedBox(height: 16.0),
                      // Text("Forgot Password?",
                      //     style: TextStyle(color: Color(0xFF4C63B4))),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                          child: Text('data'),
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              String res;
                              if (_radioValue == 1) {
                                /* res = await Api()
                                .registerCustomer(name, email, password); */
                              } else {
                                /*  res = await Api()
                                .registerEmployee(name, email, password); */
                              }

                              /* if (res == "1") {
                            (msg: "Account Created");
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileScreen()));
                          } else {
                            Fluttertoast.showToast(msg: res);
                          }
                        } else
                          Fluttertoast.showToast(msg: "Match didn't match");
                      },
                      color: Theme.of(context).accentColor,
                      text: "Sign Up"), */
                            }
                          }),
                    ]),
              )),
        ));
  }
}
 */