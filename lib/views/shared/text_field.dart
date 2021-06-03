import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String labelText;
  final bool isPassword;
  final Function(String)? validator;
  final FocusNode? focusNode;
  final TextInputType? inputType;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.hintText: '',
    this.isPassword: false,
    this.validator,
    this.focusNode,
    this.inputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      focusNode: focusNode,
      validator: (text) {
        if (validator != null) {
          validator!(text!);
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: TextStyle(color: Theme.of(context).buttonColor),
      ),
    );
  }
}
