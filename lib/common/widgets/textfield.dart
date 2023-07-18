import 'package:flutter/material.dart';
//import 'package:skillmaestro/features/presentation/pages/admin/validator.dart';

// ignore: camel_case_types, must_be_immutable
class textfield extends StatelessWidget {
  textfield({
    required this.textFieldName,
    required this.controllerName,
    required this.context,
    this.fieldname,
    this.function,
    this.value,
    this.keyBoradtype,
    this.validator,
    this.fontSizeMultiplier,
    super.key,
  });
  String textFieldName;
  double? fontSizeMultiplier;
  TextEditingController controllerName;
  final String? Function(String?)? validator;
  String? function;
  //Function? function;
  String? fieldname;
  String? value;
  BuildContext context;
  TextInputType? keyBoradtype;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
      child: TextFormField(
        controller: controllerName,
        keyboardType: keyBoradtype,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: textFieldName,
            contentPadding: const EdgeInsets.all(16)),
        onChanged: (value) {
          //print(fieldname);
          fieldname = value;
        },
        // validator: (value) => function ?? (value),
        // ignore: body_might_complete_normally_nullable
        validator: validator,
        style: TextStyle(fontSize: fontSizeMultiplier),

        /* (value) {
          if (value == null || value.isEmpty) {
            return '${textFieldName} is required';
          } else {
            function;
          }
        }, */
      ),
    );
  }
}
