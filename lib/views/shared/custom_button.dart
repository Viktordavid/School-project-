import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  final bool? loading;
  final double? padding;
  final String text;
  final Function onTap;

  const Button({
    Key? key,
    this.padding: 40,
    required this.text,
    required this.onTap,
    this.loading: false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding!.w),
      child: TextButton(
        onPressed: () => onTap(),
        child: loading! ? CircularProgressIndicator() : Text(text),
      ),
    );
  }
}
