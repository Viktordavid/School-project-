import 'package:school_project/models/models.dart';
import 'package:school_project/utils/utils.dart';

import 'base_view_model.dart';

class RegistrationHistoryViewModel extends BaseViewModel {
  void goBack() {
    navigationService.goBack();
  }

  String getDescription(AnimalDetail animalDetail) {
    return animalDetail.neutered!
        ? 'Neutered ${animalDetail.gender} ${animalDetail.breed} with MicroChip no ${animalDetail.chipNo}'
        : 'Non-neutered ${animalDetail.gender} ${animalDetail.breed} with MicroChip no ${animalDetail.chipNo}';
  }

  void navigateToDetailsView(dynamic arg) {
    navigationService.pushNamed(AnimalDetailsViewRoute, arg: arg);
  }
}
