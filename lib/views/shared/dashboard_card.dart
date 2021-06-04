import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_project/views/shared/spacer.dart';

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function? onTap;
  final bool selected;

  const DashboardCard(
      {Key? key,
      required this.icon,
      required this.title,
      required this.selected,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          selected: selected,
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          selectedTileColor: Theme.of(context).highlightColor,
          tileColor: Theme.of(context).primaryColorDark,
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Theme.of(context).primaryColorLight,
              ),
              CustomSpacer(horizontal: true),
              VerticalDivider(
                indent: 12.h,
                endIndent: 12.h,
                width: 5.w,
                color: Theme.of(context).primaryColorLight.withOpacity(.4),
              )
            ],
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Theme.of(context).primaryColorLight,
                ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        CustomSpacer()
      ],
    );
  }
}
