import 'package:school_project/view-models/base_view_model.dart';

class AnimalDetailsViewModel extends BaseViewModel {
  void goBack() {
    navigationService.goBack();
  }
}
