import 'package:flutter/material.dart';
import 'package:github_users/exports.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String textfieldLabel;
  final String? Function(String?) validator;
  final bool obscureText;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.textfieldLabel,
      required this.validator,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText,
        validator: validator,
        controller: controller,
        style: mulishTextStyle.copyWith(color: kTextFieldTextColor),
        decoration: InputDecoration(
            filled: true,
            fillColor: kTextFieldFillColor,
            hintText: textfieldLabel,
            hintStyle: mulishTextStyle.copyWith(color: kTextFieldTextColor),
            isDense: true,
            border: kTextFormBorder,
            focusedBorder: kTextFormBorder,
            enabledBorder: kTextFormBorder));
  }
}

final kTextFormBorder = OutlineInputBorder(
  borderSide: BorderSide(color: kTextFieldFillColor),
  borderRadius: BorderRadius.circular(8.0),
);
