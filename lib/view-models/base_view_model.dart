import 'package:flutter/material.dart';
import 'package:school_project/services/services.dart';
import 'package:school_project/utils/utils.dart';

///Base view model with shared dependencies injected.
///All view models must extends this class.
class BaseViewModel extends ChangeNotifier {
  late NavigationService navigationService;

  BaseViewModel({NavigationService? navigationService}) {
    this.navigationService = navigationService ?? locator<NavigationService>();
  }
}
