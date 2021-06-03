import 'package:flutter/material.dart';
import 'package:school_project/views/shared/shared.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
      return Container(
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            Text('AVD MicroChip Services'),
            Text('on the UK PETtrac Database'),
          ],
        ),
      );
    });
  }
}
