import 'package:flutter/material.dart';
import 'package:school_project/view-models/view_models.dart';
import 'package:school_project/views/shared/shared.dart';

class ChipRegistrationView extends StatefulWidget {
  const ChipRegistrationView({Key? key}) : super(key: key);

  @override
  _ChipRegistrationViewState createState() => _ChipRegistrationViewState();
}

class _ChipRegistrationViewState extends State<ChipRegistrationView> {
  late TextEditingController _chipNoController;
  late FocusNode _chipNoFocusNode;
  late TextEditingController _nameController;
  late FocusNode _nameFocusNode;
  late TextEditingController _specieController;
  late FocusNode _specieFocusNode;
  late TextEditingController _breedController;
  late FocusNode _breedFocusNode;
  late TextEditingController _colorController;
  late FocusNode _colorFocusNode;
  late TextEditingController _conditionsController;
  late FocusNode _conditionsFocusNode;
  late TextEditingController _dobController;
  late FocusNode _dobFocusNode;
  late TextEditingController _implantationDateController;
  late FocusNode _implantationDateFocusNode;
  late TextEditingController _genderController;
  late TextEditingController _neuteredController;

  @override
  void initState() {
    super.initState();
    _chipNoController = TextEditingController();
    _chipNoFocusNode = FocusNode();
    _nameController = TextEditingController();
    _nameFocusNode = FocusNode();
    _specieController = TextEditingController();
    _specieFocusNode = FocusNode();
    _breedController = TextEditingController();
    _breedFocusNode = FocusNode();
    _colorController = TextEditingController();
    _colorFocusNode = FocusNode();
    _conditionsController = TextEditingController();
    _conditionsFocusNode = FocusNode();
    _dobController = TextEditingController();
    _dobFocusNode = FocusNode();
    _implantationDateController = TextEditingController();
    _implantationDateFocusNode = FocusNode();
    _genderController = TextEditingController();
    _neuteredController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _chipNoController.dispose();
    _chipNoFocusNode.dispose();
    _nameController.dispose();
    _nameFocusNode.dispose();
    _specieController.dispose();
    _specieFocusNode.dispose();
    _breedController.dispose();
    _breedFocusNode.dispose();
    _colorController.dispose();
    _colorFocusNode.dispose();
    _conditionsController.dispose();
    _conditionsFocusNode.dispose();
    _dobController.dispose();
    _dobFocusNode.dispose();
    _implantationDateController.dispose();
    _implantationDateFocusNode.dispose();
    _neuteredController.dispose();
    _genderController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
        appBar: AppBar(
          title: Text('Register A MicroChip'),
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            onPressed: () {
              context.read<ChipRegistrationViewModel>().goBack();
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
                CustomSpacer(),
                Text(
                  "Pet's Details",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                CustomSpacer(flex: 3),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  decoration:
                      BoxDecoration(color: Colors.white, border: Border.all()),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _chipNoController,
                        focusNode: _chipNoFocusNode,
                        labelTextColor: Theme.of(context).buttonColor,
                        labelText: 'MicroChip Number',
                      ),
                      CustomSpacer(flex: 3),
                      CustomTextField(
                        controller: _nameController,
                        focusNode: _nameFocusNode,
                        labelTextColor: Theme.of(context).buttonColor,
                        labelText: 'Name',
                      ),
                      CustomSpacer(flex: 3),
                      CustomDropDown(
                        items: [
                          {'key': 'Male', 'value': 'Male'},
                          {'key': 'Female', 'value': 'Female'},
                        ],
                        controller: _genderController,
                        label: 'Gender',
                      ),
                      CustomSpacer(flex: 3),
                      CustomDropDown(
                        items: [
                          {'key': 'True', 'value': 'True'},
                          {'key': 'False', 'value': 'False'},
                        ],
                        controller: _neuteredController,
                        label: 'Neutered',
                      ),
                      CustomSpacer(flex: 3),
                      CustomTextField(
                        controller: _dobController,
                        focusNode: _dobFocusNode,
                        labelTextColor: Theme.of(context).buttonColor,
                        labelText: 'Date of Birth',
                      ),
                      CustomSpacer(flex: 3),
                      CustomTextField(
                        controller: _specieController,
                        focusNode: _specieFocusNode,
                        labelTextColor: Theme.of(context).buttonColor,
                        labelText: 'Specie',
                      ),
                      CustomSpacer(flex: 3),
                      CustomTextField(
                        controller: _breedController,
                        focusNode: _breedFocusNode,
                        labelTextColor: Theme.of(context).buttonColor,
                        labelText: 'Breed',
                      ),
                      CustomSpacer(flex: 3),
                      CustomTextField(
                        controller: _colorController,
                        focusNode: _colorFocusNode,
                        labelTextColor: Theme.of(context).buttonColor,
                        labelText: 'Colour/ Markings',
                      ),
                      CustomSpacer(flex: 3),
                      CustomTextField(
                        controller: _conditionsController,
                        focusNode: _conditionsFocusNode,
                        labelTextColor: Theme.of(context).buttonColor,
                        labelText:
                            'Notable Conditions (i.e medical conditions)',
                      ),
                      CustomSpacer(flex: 3),
                      CustomTextField(
                        controller: _implantationDateController,
                        focusNode: _implantationDateFocusNode,
                        labelTextColor: Theme.of(context).buttonColor,
                        labelText: 'MicroChip Implantation Date',
                      ),
                      CustomSpacer(flex: 3),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
