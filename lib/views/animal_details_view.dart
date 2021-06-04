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
        backgroundColor: Theme.of(context).primaryColorLight,
        appBar: AppBar(
          title: Text('Animal Details'),
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () {
              context.read<AnimalDetailsViewModel>().goBack();
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
                CustomList(label: 'Specie', desc: animalDetail.specie),
                CustomList(label: 'Breed', desc: animalDetail.breed),
                CustomList(label: 'Gender', desc: animalDetail.gender),
                CustomList(
                    label: 'Neutered',
                    desc: animalDetail.neutered! ? 'Yes' : 'No'),
                CustomList(
                    label: 'Colour or Markings', desc: animalDetail.colour),
                CustomList(
                    label: 'Notable Conditions', desc: animalDetail.conditions),
              ],
            ),
          );
        });
  }
}
