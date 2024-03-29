import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:school_project/models/models.dart';
import 'package:school_project/utils/utils.dart';
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

  void initialize({AnimalDetail detail = defaultAnimalDetails}) {
    chipNoController = TextEditingController(text: detail.chipNo);
    chipNoFocusNode = FocusNode();
    nameController = TextEditingController(text: detail.name);
    nameFocusNode = FocusNode();
    breedController = TextEditingController(text: detail.type);
    breedFocusNode = FocusNode();
    colorController = TextEditingController(text: detail.colour);
    colorFocusNode = FocusNode();
    conditionsController = TextEditingController(text: detail.conditions);
    conditionsFocusNode = FocusNode();
    dobController = TextEditingController(text: detail.dob);
    dobFocusNode = FocusNode();
    implantationDateController =
        TextEditingController(text: detail.chipImplantationDate);
    implantationDateFocusNode = FocusNode();
    genderController = TextEditingController(text: detail.gender);
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

  void update(String id, Function showDialog) async {
    try {
      setLoading(true);
      String? userId = await storageService.read('userId');
      final ref = FirebaseFirestore.instance
          .collection('cows')
          .withConverter<AnimalDetail>(
            fromFirestore: (snapshot, _) =>
                AnimalDetail.fromMap(snapshot.data()!, snapshot.id),
            toFirestore: (cow, _) => cow.toMap(),
          );

      if (userId != null) {
        await ref.doc(id).update(AnimalDetail(
              userId: userId,
              chipNo: chipNoController!.text,
              name: nameController!.text,
              dob: dobController!.text,
              gender: genderController!.text,
              colour: colorController!.text,
              chipImplantationDate: implantationDateController!.text,
              type: breedController!.text,
              conditions: conditionsController!.text,
            ).toMap());

        disposeControllers();
        navigationService.popUntil(MicroChipsViewRoute);
        showDialog("Animal details updated successfully");
      }
      setLoading(false);
    } catch (e) {
      setLoading(false);
      showDialog("Animal details update failed", ok: false);
      print(e);
    }
  }

  void register(Function showDialog) async {
    try {
      setLoading(true);
      String? userId = await storageService.read('userId');
      final ref = FirebaseFirestore.instance
          .collection('cows')
          .withConverter<AnimalDetail>(
            fromFirestore: (snapshot, _) =>
                AnimalDetail.fromMap(snapshot.data()!, snapshot.id),
            toFirestore: (cow, _) => cow.toMap(),
          );

      if (userId != null) {
        await ref.add(AnimalDetail(
          userId: userId,
          chipNo: chipNoController!.text,
          name: nameController!.text,
          dob: dobController!.text,
          gender: genderController!.text,
          colour: colorController!.text,
          chipImplantationDate: implantationDateController!.text,
          type: breedController!.text,
          conditions: conditionsController!.text,
        ));

        disposeControllers();
        goBack();
        showDialog("MicroChip registered successfully");
      }
      setLoading(false);
    } catch (e) {
      setLoading(false);
      showDialog("MicroChip registration failed", ok: false);
      print(e);
    }
  }
}
