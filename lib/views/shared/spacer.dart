import 'package:flutter/material.dart';

class Spacer extends StatelessWidget {
  final bool? isVertical;
  final double? flex;

  const Spacer({Key? key, this.isVertical: true, this.flex: 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isVertical! ? 5 * flex! : 0,
      width: !isVertical! ? 5 * flex! : 0,
    );
  }
}
