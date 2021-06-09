import 'package:flutter/material.dart';
import 'package:school_project/models/models.dart';
import 'package:school_project/view-models/view_models.dart';
import 'package:school_project/views/shared/shared.dart';

class AnimalDetailsView extends StatelessWidget {
  final AnimalDetail animalDetail;
  const AnimalDetailsView({Key? key, required this.animalDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        appBar: AppBar(
          title: Text('Animal Details'),
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () {
              context.read<AnimalDetailsViewModel>().goBack();
            },
          ),
          actions: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Theme.of(context).backgroundColor.withOpacity(.3),
                ),
                shape: MaterialStateProperty.resolveWith(
                  (states) => RoundedRectangleBorder(),
                ),
                minimumSize: MaterialStateProperty.resolveWith(
                  (states) => Size(20.w, 30.h),
                ),
              ),
              child: Text('Update'),
              onPressed: () {
                context
                    .read<AnimalDetailsViewModel>()
                    .navigateToChipRegistration(animalDetail);
              },
            )
          ],
        ),
        builder: (context, size) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            height: size.height,
            width: size.width,
            child: ListView(
              children: [
                CustomSpacer(flex: 3),
                CustomList(label: 'Name', desc: animalDetail.name),
                CustomList(
                  label: 'MicroChip Number',
                  desc: animalDetail.chipNo,
                ),
                CustomList(
                  label: 'MicroChip Implantation Date',
                  desc: animalDetail.chipImplantationDate,
                ),
                CustomList(label: 'Date of Birth', desc: animalDetail.dob),
                CustomList(label: 'Type', desc: animalDetail.type),
                CustomList(label: 'Gender', desc: animalDetail.gender),
                CustomList(
                    label: 'Colour or Markings', desc: animalDetail.colour),
                CustomList(
                    label: 'Notable Conditions', desc: animalDetail.conditions),
                CustomSpacer(flex: 3),
              ],
            ),
          );
        });
  }
}
