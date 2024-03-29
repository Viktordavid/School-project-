import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_project/view-models/view_models.dart';
import 'package:school_project/views/shared/shared.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
    var loginVM = context.watch<LoginViewModel>();
    return ResponsiveWidget(onWillPop: () {
      context.read<LoginViewModel>().exitApp();
    }, builder: (context, size) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            CustomSpacer(flex: 10),
            Container(
              height: 80.h,
              width: 100.w,
              child: Image.asset('assets/images/animal.png',
                  color: Theme.of(context).primaryColorLight),
            ),
            CustomSpacer(flex: 5),
            Text(
              'Welcome to Animal Track',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Theme.of(context).primaryColorLight),
            ),
            CustomSpacer(flex: 1),
            Text(
              'Login to continue',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Theme.of(context).primaryColorLight),
            ),
            CustomSpacer(flex: 5),
            CustomTextField(
              useLightText: true,
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
              useLightText: true,
              controller: _passwordController,
              focusNode: _passwordFocus,
              errorText: _passwordError,
              labelText: 'PASSWORD',
              hintText: 'Enter password',
              inputType: TextInputType.emailAddress,
            ),
            CustomSpacer(flex: 4),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: GestureDetector(
            //     onTap: () {},
            //     child: Text('Forgot password?',
            //       style: Theme.of(context)
            //           .textTheme
            //           .subtitle1!
            //           .copyWith(color: Theme.of(context).primaryColorLight),
            //     ),
            //   ),
            // ),
            CustomSpacer(flex: 6),
            Button(
              loading: loginVM.loading,
              onTap: () {
                if (_emailController.text.isEmpty) {
                  _emailError = 'Enter your email addresss';
                  setState(() {});
                } else if (_passwordController.text.isEmpty) {
                  _passwordError = 'Enter your password';
                  setState(() {});
                } else {
                  loginVM.login(
                    _emailController.text,
                    _passwordController.text,
                    openDialog,
                  );
                }
              },
              text: 'Login',
            ),
            CustomSpacer(flex: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Theme.of(context).primaryColorLight),
                ),
                CustomSpacer(horizontal: true, flex: 1),
                GestureDetector(
                  onTap: () {
                    context.read<LoginViewModel>().navigateToSignUp();
                  },
                  child: Text('Sign up',
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
