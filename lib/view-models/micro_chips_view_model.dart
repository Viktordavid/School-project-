import 'package:school_project/utils/utils.dart';
import 'base_view_model.dart';

class MicroChipsViewModel extends BaseViewModel {
  void goBack() {
    navigationService.goBack();
  }

  void navigateToDetailsView(dynamic arg) {
    navigationService.pushNamed(AnimalDetailsViewRoute, arg: arg);
  }
}
