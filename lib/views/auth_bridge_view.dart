import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_project/views/views.dart';

class AuthBridgeView extends StatelessWidget {
  const AuthBridgeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasData && snapshot.data != null) {
            return DashboardView();
          }
          return LoginView();
        });
  }
}
