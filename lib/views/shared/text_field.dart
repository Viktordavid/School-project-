import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String labelText;
  final bool isPassword;
  final FocusNode? focusNode;
  final TextInputType? inputType;
  final Color? labelTextColor;
  final String? errorText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.hintText: '',
    this.errorText,
    this.isPassword: false,
    this.focusNode,
    this.inputType,
    this.labelTextColor,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.inputType,
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  _obscureText = !_obscureText;
                  setState(() {});
                })
            : null,
        hintText: widget.hintText,
        labelText: widget.labelText,
        errorText: widget.errorText,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColorLight),
        ),
        labelStyle: TextStyle(
            color:
                widget.labelTextColor ?? Theme.of(context).primaryColorLight),
        hintStyle: Theme.of(context)
            .textTheme
            .caption!
            .copyWith(color: Theme.of(context).buttonColor),
      ),
    );
  }
}
