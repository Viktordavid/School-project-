import 'package:school_project/models/models.dart';
import 'package:school_project/utils/utils.dart';
import 'package:school_project/view-models/base_view_model.dart';

class AnimalDetailsViewModel extends BaseViewModel {
  void goBack() {
    navigationService.goBack();
  }

  void navigateToChipRegistration(AnimalDetail animalDetail) {
    navigationService.pushNamed(ChipRegistrationViewRoute, arg: animalDetail);
  }
}
