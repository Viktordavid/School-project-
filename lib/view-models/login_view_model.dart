import 'package:school_project/utils/utils.dart';
import 'package:school_project/view-models/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  String? validateEmail(String email) {
    if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email)) {
      return 'Enter a valid email';
    }
  }

  String? validatePassword(String password) {
    if (password.length < 8) return 'Password must be at least 8 characters';
  }

  void navigateToSignUp() {
    navigationService.pushNamed(SignUpViewRoute);
  }

  void navigateToDashboard() {
    navigationService.pushReplacementNamed(DashboardViewRoute);
  }

  void exitApp() {
    navigationService.exitApp();
  }
}
