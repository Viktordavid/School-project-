import 'package:firebase_auth/firebase_auth.dart';
import 'package:school_project/view-models/base_view_model.dart';

class SignUpViewModel extends BaseViewModel {
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  void goBack() {
    navigationService.goBack();
  }

  Future<void> register(
      String email, String password, Function showDialog) async {
    try {
      setLoading(true);
      UserCredential _ =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      setLoading(false);
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      if (e.code == 'weak-password') {
        showDialog('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showDialog('An account already exists for that email. Log in instead.');
      } else {
        showDialog(e.message);
      }
    } catch (e) {
      setLoading(false);
      print(e);
    }
  }
}
