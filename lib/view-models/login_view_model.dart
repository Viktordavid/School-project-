import 'package:firebase_auth/firebase_auth.dart';
import 'package:school_project/utils/utils.dart';
import 'package:school_project/view-models/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  Future<void> login(String email, String password, Function showDialog) async {
    try {
      UserCredential _ = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog('No user found for that email. Sign up instead.');
      } else if (e.code == 'wrong-password') {
        showDialog('Incorrect password');
      } else {
        showDialog(e.message);
      }
    } catch (e) {
      print(e);
    }
  }

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
