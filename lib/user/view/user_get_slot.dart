import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../application/common/common_provider.dart';
import '../../application/user/user_provider.dart';
import 'package:intl/intl.dart';

String? selectedValue;
List<String> dropdownItems = [];

class UserGetSlot extends StatefulWidget {
  UserGetSlot({super.key});

  @override
  State<UserGetSlot> createState() => _UserGetSlotState();
}

class _UserGetSlotState extends State<UserGetSlot> {
  //final String id;
  final field1 = TextEditingController();
  List result = [];

  void initState() {
    super.initState();
    // Call the API and populate the dropdownItems list
    getSlotsFromAPI();
  }

  void getSlotsFromAPI() {
    // Assume you have an API call to fetch the slots
    List<DateTime> result = []; // Replace with your API call

    // Convert the DateTime list to formatted strings and populate the dropdownItems list
    result.forEach((dateTime) {
      String formattedDateTime =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
      dropdownItems.add(formattedDateTime);
    });
  }

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
                            const Text('Available Slotes',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 121, 216, 206))),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                                'Please Select the available slotes\n              registered by Experts ',
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
                                        /* Provider.of<CommonProvider>(context,
                                                listen: false)
                                            .onloading();
                                        var otp = field1.text +
                                            field2.text +
                                            field3.text +
                                            field4.text +
                                            field5.text +
                                            field6.text;
                                        UserProvider().verifyUserOtp(
                                            context, otp, mobile); */
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
      ),
    );
  }

  String otpFieldValidation(context) {
    if (field1.text.isEmpty) {
      Provider.of<UserProvider>(context, listen: false).changeValidatorState();
      return 'true';
    }
    return 'false';
  }
}

// ignore: must_be_immutable
class OtpField extends StatefulWidget {
  OtpField({
    super.key,
    required this.field,
  });

  dynamic field;

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 350,
      child: Stack(
        children: [
          TextField(
            controller: widget.field,
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
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 123, 230, 219)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(180.0)),
              ),
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.centerRight,
                child: DropdownButton<String>(
                  value: selectedValue,
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                  },
                  items: dropdownItems.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                )),
          ),
        ],
      ),
    );
  }
}
