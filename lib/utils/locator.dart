import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:school_project/services/services.dart';

GetIt locator = GetIt.instance;

///Registers dependencies
void setupLocator() async {
  try {
    locator.registerLazySingleton(() => NavigationService());

    await Firebase.initializeApp();
  } catch (e) {
    print(e);
  }
}
