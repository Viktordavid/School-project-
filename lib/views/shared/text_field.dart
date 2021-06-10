import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String labelText;
  final bool isPassword;
  final FocusNode? focusNode;
  final TextInputType? inputType;
  final Color? labelTextColor;
  final String? errorText;
  final bool readOnly;
  final bool useLightText;
  final Function? onTap;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.hintText = '',
    this.errorText,
    this.isPassword = false,
    this.readOnly = false,
    this.useLightText = false,
    this.focusNode,
    this.inputType,
    this.labelTextColor,
    this.onTap,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: widget.useLightText
          ? Theme.of(context).primaryColorLight
          : Theme.of(context).primaryColorDark,
      style: TextStyle(
        color: widget.useLightText
            ? Theme.of(context).primaryColorLight
            : Theme.of(context).primaryColorDark,
      ),
      readOnly: widget.readOnly,
      keyboardType: widget.inputType,
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: widget.isPassword ? _obscureText : false,
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
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
        enabledBorder: widget.labelTextColor != null
            ? UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).backgroundColor),
              )
            : null,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: widget.labelTextColor == null
                  ? Theme.of(context).primaryColorLight
                  : Theme.of(context).backgroundColor),
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
