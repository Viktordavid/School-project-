import 'package:flutter/material.dart';
import 'package:school_project/view-models/base_view_model.dart';

class ChipRegistrationViewModel extends BaseViewModel {
  void goBack() {
    navigationService.goBack();
  }

  late TextEditingController chipNoController;
  late FocusNode chipNoFocusNode;
  late TextEditingController nameController;
  late FocusNode nameFocusNode;
  late TextEditingController breedController;
  late FocusNode breedFocusNode;
  late TextEditingController colorController;
  late FocusNode colorFocusNode;
  late TextEditingController conditionsController;
  late FocusNode conditionsFocusNode;
  late TextEditingController dobController;
  late FocusNode dobFocusNode;
  late TextEditingController implantationDateController;
  late FocusNode implantationDateFocusNode;
  late TextEditingController genderController;

  void initialize() {
    chipNoController = TextEditingController();
    chipNoFocusNode = FocusNode();
    nameController = TextEditingController();
    nameFocusNode = FocusNode();
    breedController = TextEditingController();
    breedFocusNode = FocusNode();
    colorController = TextEditingController();
    colorFocusNode = FocusNode();
    conditionsController = TextEditingController();
    conditionsFocusNode = FocusNode();
    dobController = TextEditingController();
    dobFocusNode = FocusNode();
    implantationDateController = TextEditingController();
    implantationDateFocusNode = FocusNode();
    genderController = TextEditingController();
  }

  void disposeControllers() {
    chipNoController.dispose();
    chipNoFocusNode.dispose();
    nameController.dispose();
    nameFocusNode.dispose();
    breedController.dispose();
    breedFocusNode.dispose();
    colorController.dispose();
    colorFocusNode.dispose();
    conditionsController.dispose();
    conditionsFocusNode.dispose();
    dobController.dispose();
    dobFocusNode.dispose();
    implantationDateController.dispose();
    implantationDateFocusNode.dispose();
    genderController.dispose();
  }

  String? chipNoError;
  String? nameError;
  String? breedError;
  String? colorError;
  String? dobError;
  String? implantationDateError;

  DateTime _initialDob = DateTime.now();
  DateTime get initialDob => _initialDob;
  DateTime _initialImplantationDate = DateTime.now();
  DateTime get initialImplantationDate => _initialImplantationDate;

  void setDob(DateTime date) {
    _initialDob = date;
    notifyListeners();
  }

  void setImplantationDate(DateTime date) {
    _initialImplantationDate = date;
    notifyListeners();
  }

  String normalizeDate(DateTime date) =>
      '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';

  bool validateTextFields() {
    chipNoError = chipNoController.text.isEmpty ? 'Enter chip number' : null;
    nameError = nameController.text.isEmpty ? "Enter animal's name" : null;
    breedError = breedController.text.isEmpty ? "Enter type" : null;
    colorError = colorController.text.isEmpty ? "Enter colour" : null;
    implantationDateError = implantationDateController.text.isEmpty
        ? "Enter microchip's implantation date"
        : null;
    dobError =
        dobController.text.isEmpty ? "Enter animal's date of birth" : null;
    notifyListeners();

    return chipNoError == null &&
        nameError == null &&
        breedError == null &&
        colorError == null &&
        implantationDateError == null &&
        dobError == null;
  }
}
