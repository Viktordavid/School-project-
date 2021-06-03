import 'package:flutter/material.dart';
import 'package:school_project/views/shared/shared.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
      return Form(
          child: Container(
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            Text('AVD MicroChip Services'),
            Text('on the UK PETtrac Database'),
            CustomSpacer(flex: 5),
            CustomTextField(
                controller: _emailController,
                focusNode: _emailFocus,
                labelText: 'EMAIL',
                hintText: 'Enter email',
                inputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                }),
            CustomSpacer(),
            CustomTextField(
                controller: _passwordController,
                focusNode: _passwordFocus,
                labelText: 'PASSWORD',
                hintText: 'Enter password',
                inputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 8) {
                    return 'Password must be 8 characters or more';
                  }
                }),
          ],
        ),
      ));
    });
  }
}
