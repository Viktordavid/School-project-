import 'package:firebase_auth/firebase_auth.dart';
import 'package:school_project/models/models.dart';
import 'package:school_project/utils/utils.dart';
import 'package:school_project/view-models/base_view_model.dart';

class DashboardViewModel extends BaseViewModel {
  void exitApp() {
    navigationService.exitApp();
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  void navigateTo(String route) async {
    try {
      switch (route) {
        case RegistrationHistoryViewRoute:
          navigationService.pushNamed(route, arg: AnimalDetail.animalDetails);
          break;
        case MicroChipsViewRoute:
          navigationService.pushNamed(route, arg: AnimalDetail.animalDetails);
          break;
        case LoginViewRoute:
          await logout();
          break;
        default:
          navigationService.pushNamed(route);
      }
    } catch (e) {
      print(e);
    }
  }
}
