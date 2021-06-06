import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:school_project/models/models.dart';
import 'package:school_project/view-models/base_view_model.dart';

class ChipRegistrationViewModel extends BaseViewModel {
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  void goBack() {
    navigationService.goBack();
  }

  late TextEditingController? chipNoController;
  late FocusNode? chipNoFocusNode;
  late TextEditingController? nameController;
  late FocusNode? nameFocusNode;
  late TextEditingController? breedController;
  late FocusNode? breedFocusNode;
  late TextEditingController? colorController;
  late FocusNode? colorFocusNode;
  late TextEditingController? conditionsController;
  late FocusNode? conditionsFocusNode;
  late TextEditingController? dobController;
  late FocusNode? dobFocusNode;
  late TextEditingController? implantationDateController;
  late FocusNode? implantationDateFocusNode;
  late TextEditingController? genderController;

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
    chipNoController = null;
    chipNoFocusNode = null;
    nameController = null;
    nameFocusNode = null;
    breedController = null;
    breedFocusNode = null;
    colorController = null;
    colorFocusNode = null;
    conditionsController = null;
    conditionsFocusNode = null;
    dobController = null;
    dobFocusNode = null;
    implantationDateController = null;
    implantationDateFocusNode = null;
    genderController = null;
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
    chipNoError = chipNoController!.text.isEmpty ? 'Enter chip number' : null;
    nameError = nameController!.text.isEmpty ? "Enter animal's name" : null;
    breedError = breedController!.text.isEmpty ? "Enter type" : null;
    colorError = colorController!.text.isEmpty ? "Enter colour" : null;
    implantationDateError = implantationDateController!.text.isEmpty
        ? "Enter microchip's implantation date"
        : null;
    dobError =
        dobController!.text.isEmpty ? "Enter animal's date of birth" : null;
    notifyListeners();

    return chipNoError == null &&
        nameError == null &&
        breedError == null &&
        colorError == null &&
        implantationDateError == null &&
        dobError == null;
  }

  void register(Function showDialog) async {
    try {
      setLoading(true);
      final ref = FirebaseFirestore.instance
          .collection('cows')
          .withConverter<AnimalDetail>(
            fromFirestore: (snapshot, _) =>
                AnimalDetail.fromMap(snapshot.data()!),
            toFirestore: (cow, _) => cow.toMap(),
          );
      await ref.add(AnimalDetail(
        chipNo: chipNoController!.text,
        name: nameController!.text,
        dob: dobController!.text,
        gender: genderController!.text,
        colour: colorController!.text,
        chipImplantationDate: implantationDateController!.text,
        type: breedController!.text,
        conditions: conditionsController!.text,
      ));
      setLoading(false);
      disposeControllers();
      goBack();
      showDialog("MicroChip registered successfully");
    } catch (e) {
      setLoading(false);
      showDialog("MicroChip registration failed", ok: false);
      print(e);
    }
  }
}
