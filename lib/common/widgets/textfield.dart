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
    super.key,
  });
  String textFieldName;
  TextEditingController controllerName;
  String? function;
  //Function? function;
  String? fieldname;
  String? value;
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
      child: TextFormField(
        controller: controllerName,
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Username is required';
          } else {
            function;
          }
        },
      ),
    );
  }
}
