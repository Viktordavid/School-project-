import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSpacer extends StatelessWidget {
  final bool? isVertical;
  final double? flex;

  const CustomSpacer({Key? key, this.isVertical: true, this.flex: 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isVertical! ? 5.h * flex! : 0,
      width: !isVertical! ? 5.w * flex! : 0,
    );
  }
}
