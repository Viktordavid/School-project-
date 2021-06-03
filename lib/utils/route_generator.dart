import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_project/utils/utils.dart';
import 'package:school_project/views/views.dart';

class RouteGenerator {
  ///Generates routes, extracts and passes navigation arguments.
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreenRoute:
        //TODO: Replace with actual SplashScreen widget
        return _getPageRoute(Container());
      case LoginViewRoute:
        return _getPageRoute(LoginView());
      case SignUpViewRoute:
        return _getPageRoute(SignUpView());
      case DashboardViewRoute:
        return _getPageRoute(DashboardView());
      default:
        return _getPageRoute(_errorPage);
    }
  }

  //Wraps widget with a CupertinoPageRoute and adds route settings
  static CupertinoPageRoute _getPageRoute(
    Widget child, [
    String? routeName,
    dynamic? args,
  ]) =>
      CupertinoPageRoute(
        builder: (context) => child,
        settings: RouteSettings(
          name: routeName,
          arguments: args,
        ),
      );

  ///Error page shown when app attempts navigating to an unknown route
  static Widget _errorPage = Scaffold(
    appBar: AppBar(
        title: Text(
      'Page not found',
      style: TextStyle(color: Colors.red),
    )),
    body: Center(
      child: Text(
        'Error! Page not found',
        style: TextStyle(color: Colors.red),
      ),
    ),
  );
}
