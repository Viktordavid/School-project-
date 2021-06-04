import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:school_project/view-models/view_models.dart';

class AppProvider {
  //The providers for dependency injection and state management will be added here
  //as the app will use MultiProvider
  static final providers = <SingleChildWidget>[
    ChangeNotifierProvider(create: (_) => LoginViewModel()),
    ChangeNotifierProvider(create: (_) => SignUpViewModel()),
    ChangeNotifierProvider(create: (_) => ChipRegistrationViewModel()),
    ChangeNotifierProvider(create: (_) => DashboardViewModel()),
    ChangeNotifierProvider(create: (_) => AnimalDetailsViewModel()),
    ChangeNotifierProvider(create: (_) => MicroChipsViewModel()),
    ChangeNotifierProvider(create: (_) => RegistrationHistoryViewModel()),
    ChangeNotifierProvider(create: (_) => SearchViewModel()),
  ];
}
