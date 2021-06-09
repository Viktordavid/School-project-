import 'package:flutter/material.dart';
import 'package:school_project/view-models/view_models.dart';
import 'package:school_project/views/shared/shared.dart';

class RegistrationHistoryView extends StatelessWidget {
  const RegistrationHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dashboardVM = context.watch<DashboardViewModel>();
    return ResponsiveWidget(
        appBar: AppBar(
          title: Text('Registration History'),
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () {
              context.read<RegistrationHistoryViewModel>().goBack();
            },
          ),
        ),
        builder: (context, size) {
          return Container(
              height: size.height,
              width: size.width,
              child: dashboardVM.animalDetails.length == 0
                  ? Center(
                      child: Text(
                      "You have not registered any micro chip",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Theme.of(context).primaryColorLight,
                          ),
                    ))
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      itemCount: dashboardVM.animalDetails.length,
                      itemBuilder: (context, index) {
                        var detail = dashboardVM.animalDetails[index];
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<RegistrationHistoryViewModel>()
                                .navigateToDetailsView(detail);
                          },
                          child: Card(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10.h),
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              width: size.width,
                              child: Text(
                                context
                                    .read<RegistrationHistoryViewModel>()
                                    .getDescription(detail),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                              ),
                            ),
                          ),
                        );
                      }));
        });
  }
}
