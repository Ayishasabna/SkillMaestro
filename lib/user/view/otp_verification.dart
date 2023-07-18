import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../application/common/common_provider.dart';
import '../../application/user/user_provider.dart';

class UserOtpScreen extends StatelessWidget {
  UserOtpScreen({required this.mobile, super.key});
  final String mobile;

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                            const Text('Verification Code',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 121, 216, 206))),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                                'Please enter the OTP number send on your\n                      registered mobile number ',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 81, 81, 81))),
                            const SizedBox(
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
                                          ? const SizedBox(
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
                                            field4.text +
                                            field5.text +
                                            field6.text;
                                        UserProvider().verifyUserOtp(
                                            context, otp, mobile);
                                      }
                                    },
                                    style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(5.0),
                                      fixedSize: MaterialStateProperty.all(
                                        const Size(185, 45),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        const Color.fromARGB(
                                            255, 123, 230, 219),
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'Verify',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 24),
                                    ),
                                  ),
                            const SizedBox(
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
                                        color:
                                            Color.fromARGB(255, 83, 221, 207)),
                                  ),
                                  onPressed: () {
                                    
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
