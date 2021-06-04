import 'package:school_project/view-models/base_view_model.dart';

class DashboardViewModel extends BaseViewModel {
  void exitApp() {
    navigationService.exitApp();
  }
}
