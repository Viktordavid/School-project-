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
        return _getPageRoute(SplashScreenView(), SplashScreenViewRoute);
      case AuthBridgeViewRoute:
        return _getPageRoute(AuthBridgeView(), AuthBridgeViewRoute);
      case LoginViewRoute:
        return _getPageRoute(LoginView(), LoginViewRoute);
      case SignUpViewRoute:
        return _getPageRoute(SignUpView(), SignUpViewRoute);
      case DashboardViewRoute:
        return _getPageRoute(DashboardView(), DashboardViewRoute);
      case ChipRegistrationViewRoute:
        if (settings.arguments != null) {
          AnimalDetail animalDetail = settings.arguments as AnimalDetail;
          return _getPageRoute(
            ChipRegistrationView(detail: animalDetail, isEdit: true),
            ChipRegistrationViewRoute,
            animalDetail,
          );
        }
        return _getPageRoute(ChipRegistrationView(), ChipRegistrationViewRoute);
      case SearchViewRoute:
        return _getPageRoute(SearchView(), SearchViewRoute);
      case SupportViewRoute:
        return _getPageRoute(SupportView(), SupportViewRoute);
      case MicroChipsViewRoute:
        return _getPageRoute(MicroChipsView(), MicroChipsViewRoute);
      case RegistrationHistoryViewRoute:
        return _getPageRoute(
            RegistrationHistoryView(), RegistrationHistoryViewRoute);
      case AnimalDetailsViewRoute:
        AnimalDetail animalDetail = settings.arguments as AnimalDetail;
        return _getPageRoute(AnimalDetailsView(animalDetail: animalDetail),
            AnimalDetailsViewRoute, animalDetail);
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
