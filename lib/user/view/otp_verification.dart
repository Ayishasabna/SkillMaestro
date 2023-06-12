import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:skillmaestro/user/view/user_signup.dart';
import '../../../application/common/common_provider.dart';
import '../../application/user/user_provider.dart';

class UserOtpScreen extends StatelessWidget {
  UserOtpScreen({super.key});
  final mobilenumber = TextEditingController();
  final field1 = TextEditingController();
  final field2 = TextEditingController();
  final field3 = TextEditingController();
  final field4 = TextEditingController();
  final field5 = TextEditingController();
  final field6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*  const SizedBox(
                height: 220,
                child: Center(
                  child: Image(
                    image: AssetImage(
                      'assets/splash/logo3.webp',
                    ),
                    height: 100,
                    width: 220,
                  ),
                ),
              ), */
              Card(
                elevation: 3.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 390,
                      width: 350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            controller: mobilenumber,
                          ),
                          const Text('Verification Code',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 121, 216, 206))),
                          SizedBox(
                            height: 20,
                          ),
                          const Text(
                              'Please enter the OTP number send on your\n                      registered Email Id ',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 81, 81, 81))),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              OtpField(field: field1),
                              OtpField(field: field2),
                              OtpField(field: field3),
                              OtpField(field: field4),
                              OtpField(field: field5),
                              OtpField(field: field6)
                            ],
                          ),
                          Consumer<UserProvider>(
                              builder: (context, value, child) => SizedBox(
                                    child: value.isOtpValidator
                                        ? SizedBox(
                                            height: 20,
                                          )
                                        : const Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Text(
                                                ' 6 Otp Number is Required',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ),
                                  )),
                          context.watch<UserProvider>().isLoadingOtp
                              ? const CircularProgressIndicator()
                              : ElevatedButton(
                                  onPressed: () {
                                    String otpvalidated =
                                        otpFieldValidation(context);
                                    if (otpvalidated == 'false') {
                                      Provider.of<CommonProvider>(context,
                                              listen: false)
                                          .onloading();
                                      var otp = field1.text +
                                          field2.text +
                                          field3.text +
                                          field4.text;
                                      field5.text + field6.text;
                                      UserProvider().verifyUserOtp(
                                          context, otp, mobilenumber.text);
                                    }
                                  },
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(5.0),
                                    fixedSize: MaterialStateProperty.all(
                                      const Size(185, 45),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(255, 123, 230, 219),
                                    ),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'Verify',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 24),
                                  ),
                                ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "  Didn't Recieve the code?",
                                style: TextStyle(fontSize: 18),
                              ),
                              TextButton(
                                child: const Text(
                                  'Resend',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 83, 221, 207)),
                                ),
                                onPressed: () {
                                  // Navigator.push(context,MaterialPageRoute(builder: (context) =>,));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String otpFieldValidation(context) {
    if (field1.text.isEmpty ||
        field2.text.isEmpty ||
        field3.text.isEmpty ||
        field4.text.isEmpty ||
        field5.text.isEmpty ||
        field6.text.isEmpty) {
      Provider.of<UserProvider>(context, listen: false).changeValidatorState();
      return 'true';
    }
    return 'false';
  }
}

// ignore: must_be_immutable
class OtpField extends StatelessWidget {
  OtpField({
    super.key,
    required this.field,
  });

  dynamic field;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 45,
      child: TextField(
        controller: field,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            hintText: '0',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 123, 230, 219)),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(180.0)))),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}





/* import 'package:flutter/material.dart';
import 'package:skillmaestro/user/view/login.dart';

class UserOtpVerification extends StatelessWidget {
  const UserOtpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        const Text(
          "Add your phone number. we'll send you a verification code so we know you're real",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black38,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10)),
                    prefix: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '(+91)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    suffixIcon: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      String otpvalidated = otpFieldValidation(context);





                      
                     /*  Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const UserLogin()
                            ),
                      ); */
                    },
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.yellow),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Send',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ]),
    ));
  }
}
 */