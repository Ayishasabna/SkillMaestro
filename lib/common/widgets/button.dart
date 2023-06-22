import 'package:flutter/material.dart';
import 'package:skillmaestro/core/constants.dart';

// ignore: camel_case_types, must_be_immutable
class onBoradingButton extends StatelessWidget {
  onBoradingButton({
    required this.firstname,
    required this.secondname,
    super.key,
  });
  Widget firstname;
  Widget secondname;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF26A69A)),
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => firstname));
            },
            child: const Text('Skip')),
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF26A69A)),
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => secondname));
            },
            child: const Text('Next'))
      ],
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class loginSignupButton extends StatelessWidget {
  loginSignupButton({
    required this.buttonName,
    required this.pageroute,
    this.functionName,
    super.key,
  });
  String buttonName;
  dynamic pageroute;
  VoidCallback? functionName;
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 50,
      width: 125,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            shadowColor: Colors.black,
            backgroundColor: Colors.teal[400],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: () {
          //functionName?.call();
          functionName;
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => pageroute));
        },
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
