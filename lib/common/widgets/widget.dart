import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldName extends StatelessWidget {
  TextFieldName({super.key, required this.value});
  String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            value,
            //style: normalText,
          ),
        ],
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    this.validator,
    this.suffixIcon,
    this.maxLines,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.enableSuggestions,
    this.autocorrect,
    this.obscureText,
    this.onTap,
  });
  final int? maxLines;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? labelText;
  final bool? enableSuggestions;
  final bool? autocorrect;
  final void Function()? onTap;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      enableSuggestions: enableSuggestions ?? true,
      autocorrect: autocorrect ?? true,
      maxLines: maxLines,
      keyboardType: keyboardType,
      controller: controller,
      style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
      validator: validator,
      onTap: onTap,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 123, 230, 219))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 123, 230, 219))),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 111, 111, 111),
        ),
      ),
    );
  }
}
