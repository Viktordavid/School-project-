import 'package:flutter/material.dart';
import 'package:school_project/views/shared/spacer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomList extends StatelessWidget {
  final String label;
  final String desc;

  const CustomList({Key? key, required this.label, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Theme.of(context).primaryColorLight,
              ),
        ),
        CustomSpacer(flex: 1),
        Container(
          width: width,
          child: Text(
            desc,
            maxLines: 2,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        CustomSpacer(flex: 3),
      ],
    );
  }
}
