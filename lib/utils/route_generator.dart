import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_project/models/models.dart';
import 'package:school_project/utils/utils.dart';
import 'package:school_project/views/views.dart';

class RouteGenerator {
  ///Generates routes, extracts and passes navigation arguments.
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreenViewRoute:
        return _getPageRoute(SplashScreenView());
      case AuthBridgeViewRoute:
        return _getPageRoute(AuthBridgeView());
      case LoginViewRoute:
        return _getPageRoute(LoginView());
      case SignUpViewRoute:
        return _getPageRoute(SignUpView());
      case DashboardViewRoute:
        return _getPageRoute(DashboardView());
      case ChipRegistrationViewRoute:
        return _getPageRoute(ChipRegistrationView());
      case SearchViewRoute:
        return _getPageRoute(SearchView());
      case SupportViewRoute:
        return _getPageRoute(SupportView());
      case MicroChipsViewRoute:
        return _getPageRoute(MicroChipsView());
      case RegistrationHistoryViewRoute:
        return _getPageRoute(RegistrationHistoryView());
      case AnimalDetailsViewRoute:
        AnimalDetail animalDetail = settings.arguments as AnimalDetail;
        return _getPageRoute(AnimalDetailsView(animalDetail: animalDetail));
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
