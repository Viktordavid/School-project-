import 'package:flutter/material.dart';
import 'package:school_project/models/models.dart';
import 'package:school_project/view-models/view_models.dart';
import 'package:school_project/views/shared/shared.dart';

class MicroChipsView extends StatelessWidget {
  final List<AnimalDetail> details;
  const MicroChipsView({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        backgroundColor: Theme.of(context).primaryColorLight,
        appBar: AppBar(
          title: Text('My MicroChips'),
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () {
              context.read<MicroChipsViewModel>().goBack();
            },
          ),
        ),
        builder: (context, size) {
          return Container(
            height: size.height,
            width: size.width,
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                itemCount: details.length,
                itemBuilder: (context, index) {
                  var animalDetail = details[index];
                  return ListTile(
                    leading: Container(
                      height: 30.h,
                      width: 50.h,
                      child: Image.asset('assets/images/chip.png'),
                    ),
                    title: Text(animalDetail.chipNo),
                    onTap: () {
                      context
                          .read<MicroChipsViewModel>()
                          .navigateToDetailsView(animalDetail);
                    },
                  );
                }),
          );
        });
  }
}
