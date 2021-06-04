import 'package:flutter/material.dart';
import 'package:school_project/view-models/view_models.dart';
import 'package:school_project/views/shared/shared.dart';

class ChipRegistrationView extends StatefulWidget {
  const ChipRegistrationView({Key? key}) : super(key: key);

  @override
  _ChipRegistrationViewState createState() => _ChipRegistrationViewState();
}

class _ChipRegistrationViewState extends State<ChipRegistrationView> {
  @override
  void initState() {
    super.initState();
    context.read<ChipRegistrationViewModel>().initialize();
  }

  Future<Null> _selectDate(
    BuildContext context,
    TextEditingController controller, [
    bool? implantation = false,
  ]) async {
    var chipRegistrationVM = context.read<ChipRegistrationViewModel>();

    DateTime init = implantation!
        ? chipRegistrationVM.initialImplantationDate
        : chipRegistrationVM.initialDob;

    final DateTime? date = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.input,
        context: context,
        initialDate: init,
        firstDate: DateTime(1990),
        lastDate: DateTime.now());

    if (date != null && date != init) {
      implantation
          ? chipRegistrationVM.setImplantationDate(date)
          : chipRegistrationVM.setDob(date);
      controller.text = chipRegistrationVM.normalizeDate(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    var chipRegistrationVM = context.watch<ChipRegistrationViewModel>();
    return ResponsiveWidget(
        resizeToAvoidBottomInset: true,
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
                  "Animal's Details",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).primaryColorLight,
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
                        errorText: chipRegistrationVM.chipNoError,
                        controller: chipRegistrationVM.chipNoController,
                        focusNode: chipRegistrationVM.chipNoFocusNode,
                        labelTextColor: Theme.of(context).buttonColor,
                        labelText: 'MicroChip Number',
                      ),
                      CustomSpacer(flex: 3),
                      CustomTextField(
                        errorText: chipRegistrationVM.nameError,
                        controller: chipRegistrationVM.nameController,
                        focusNode: chipRegistrationVM.nameFocusNode,
                        labelTextColor: Theme.of(context).buttonColor,
                        labelText: 'Name',
                      ),
                      CustomSpacer(flex: 3),
                      CustomDropDown(
                        items: [
                          {'key': 'Male', 'value': 'Male'},
                          {'key': 'Female', 'value': 'Female'},
                        ],
                        controller: chipRegistrationVM.genderController,
                        label: 'Gender',
                      ),
                      CustomSpacer(flex: 3),
                      CustomDropDown(
                        items: [
                          {'key': 'Yes', 'value': 'true'},
                          {'key': 'No', 'value': 'false'},
                        ],
                        controller: chipRegistrationVM.neuteredController,
                        label: 'Neutered',
                      ),
                      CustomSpacer(flex: 3),
                      CustomTextField(
                        onTap: () {
                          _selectDate(
                              context, chipRegistrationVM.dobController);
                        },
                        readOnly: true,
                        errorText: chipRegistrationVM.dobError,
                        controller: chipRegistrationVM.dobController,
                        focusNode: chipRegistrationVM.dobFocusNode,
                        labelTextColor: Theme.of(context).buttonColor,
                        labelText: 'Date of Birth',
                      ),
                      CustomSpacer(flex: 3),
                      CustomTextField(
                        errorText: chipRegistrationVM.specieError,
                        controller: chipRegistrationVM.specieController,
                        focusNode: chipRegistrationVM.specieFocusNode,
                        labelTextColor: Theme.of(context).buttonColor,
                        labelText: 'Specie',
                      ),
                      CustomSpacer(flex: 3),
                      CustomTextField(
                        errorText: chipRegistrationVM.breedError,
                        controller: chipRegistrationVM.breedController,
                        focusNode: chipRegistrationVM.breedFocusNode,
                        labelTextColor: Theme.of(context).buttonColor,
                        labelText: 'Breed',
                      ),
                      CustomSpacer(flex: 3),
                      CustomTextField(
                        errorText: chipRegistrationVM.colorError,
                        controller: chipRegistrationVM.colorController,
                        focusNode: chipRegistrationVM.colorFocusNode,
                        labelTextColor: Theme.of(context).buttonColor,
                        labelText: 'Colour/ Markings',
                      ),
                      CustomSpacer(flex: 3),
                      CustomTextField(
                        controller: chipRegistrationVM.conditionsController,
                        focusNode: chipRegistrationVM.conditionsFocusNode,
                        labelTextColor: Theme.of(context).buttonColor,
                        labelText:
                            'Notable Conditions (i.e medical conditions)',
                      ),
                      CustomSpacer(flex: 3),
                      CustomTextField(
                        onTap: () {
                          _selectDate(
                              context,
                              chipRegistrationVM.implantationDateController,
                              true);
                        },
                        readOnly: true,
                        errorText: chipRegistrationVM.implantationDateError,
                        controller:
                            chipRegistrationVM.implantationDateController,
                        focusNode: chipRegistrationVM.implantationDateFocusNode,
                        labelTextColor: Theme.of(context).buttonColor,
                        labelText: 'MicroChip Implantation Date',
                      ),
                      CustomSpacer(flex: 3),
                    ],
                  ),
                ),
                CustomSpacer(flex: 5),
                Button(
                  text: 'Register Chip',
                  onTap: () {
                    if (chipRegistrationVM.validateTextFields()) {}
                  },
                ),
                CustomSpacer(flex: 3),
              ],
            ),
          );
        });
  }
}
