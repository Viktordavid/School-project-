import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_project/view-models/view_models.dart';
import 'package:school_project/views/shared/shared.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  late FocusNode _emailFocus;
  late FocusNode _passwordFocus;
  String? _emailError;
  String? _passwordError;

  @override
  void initState() {
    super.initState();
    var loginViewModel = context.read<LoginViewModel>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocus = FocusNode();
    _passwordFocus = FocusNode();

    _emailController.addListener(() {
      if (_emailController.text.isNotEmpty) {
        _emailError = loginViewModel.validateEmail(_emailController.text);
        setState(() {});
      }
    });
    _passwordController.addListener(() {
      if (_passwordController.text.isNotEmpty) {
        _passwordError =
            loginViewModel.validatePassword(_passwordController.text);
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
  }

  Future<void> openDialog(String desc) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(desc),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var signUpVM = context.watch<SignUpViewModel>();
    return ResponsiveWidget(builder: (context, size) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            CustomSpacer(flex: 15),
            FlutterLogo(size: 50),
            CustomSpacer(flex: 5),
            Text(
              'AVD MicroChip Services',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            CustomSpacer(flex: 1),
            Text(
              'on the UK PETtrac Database',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            CustomSpacer(flex: 5),
            CustomTextField(
              controller: _emailController,
              focusNode: _emailFocus,
              errorText: _emailError,
              labelText: 'EMAIL',
              hintText: 'Enter email',
              inputType: TextInputType.emailAddress,
            ),
            CustomSpacer(),
            CustomTextField(
              isPassword: true,
              controller: _passwordController,
              focusNode: _passwordFocus,
              errorText: _passwordError,
              labelText: 'PASSWORD',
              hintText: 'Enter password',
              inputType: TextInputType.emailAddress,
            ),
            CustomSpacer(flex: 6),
            Button(
              loading: signUpVM.loading,
              onTap: () {
                if (_emailController.text.isEmpty) {
                  _emailError = 'Enter your email addresss';
                  setState(() {});
                } else if (_passwordController.text.isEmpty) {
                  _passwordError = 'Enter your email addresss';
                  setState(() {});
                } else if (_emailError == null && _passwordError == null) {
                  signUpVM.register(
                    _emailController.text,
                    _passwordController.text,
                    openDialog,
                  );
                }
              },
              text: 'Sign Up',
            ),
            CustomSpacer(flex: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                    style: Theme.of(context).textTheme.subtitle1),
                CustomSpacer(horizontal: true, flex: 1),
                GestureDetector(
                  onTap: () {
                    context.read<SignUpViewModel>().goBack();
                  },
                  child: Text('Login',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Theme.of(context).buttonColor)),
                ),
              ],
            ),
            CustomSpacer(flex: 3),
          ],
        ),
      );
    });
  }
}
