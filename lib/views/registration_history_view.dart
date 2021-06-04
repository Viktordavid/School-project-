import 'package:flutter/material.dart';
import 'package:school_project/models/models.dart';
import 'package:school_project/view-models/view_models.dart';
import 'package:school_project/views/shared/shared.dart';

class RegistrationHistoryView extends StatelessWidget {
  final List<AnimalDetail> details;
  const RegistrationHistoryView({Key? key, required this.details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: ListView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  itemCount: details.length,
                  itemBuilder: (context, index) {
                    var detail = details[index];
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
