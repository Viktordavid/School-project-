import 'package:flutter/material.dart';
import 'package:school_project/view-models/view_models.dart';
import 'package:school_project/views/shared/shared.dart';

class SupportView extends StatelessWidget {
  const SupportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var supportVM = context.read<SupportViewModel>();
    return ResponsiveWidget(
        appBar: AppBar(
          title: Text('Contact Support'),
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () {
              supportVM.goBack();
            },
          ),
        ),
        builder: (context, size) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            height: size.height,
            width: size.width,
            child: ListView(
              children: [
                CustomSpacer(flex: 10),
                DashboardCard(
                  icon: Icons.phone,
                  title: 'Contact Support',
                  selected: false,
                  onTap: () {
                    supportVM.placeCall();
                  },
                ),
                CustomSpacer(flex: 3),
              ],
            ),
          );
        });
  }
}
