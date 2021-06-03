import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_project/services/services.dart';
import 'package:school_project/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_project/view-models/view_models.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 630),
      builder: () => MultiProvider(
        providers: AppProvider.providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'School Project',
          theme: ThemeData(
            backgroundColor: Color(0xff277da1),
            highlightColor: Color(0xff43aa8b),
            splashColor: Color(0xff43aa8b),
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            primaryColorDark: Color(0xff03071e),
            primaryColorLight: Color(0xffffffff),
            buttonColor: Color(0xfff94144),
            errorColor: Colors.red,
            appBarTheme: AppBarTheme(
              color: Color(0xff001219),
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.resolveWith(
                  (states) => TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                minimumSize: MaterialStateProperty.resolveWith(
                  (states) => Size(100, 50),
                ),
                shape: MaterialStateProperty.resolveWith(
                  (states) => StadiumBorder(),
                ),
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Color(0xfff94144),
                ),
                foregroundColor: MaterialStateProperty.resolveWith(
                  (states) => Color(0xffffffff),
                ),
                overlayColor: MaterialStateProperty.resolveWith(
                  (states) => Color(0xfff9844a),
                ),
              ),
            ),
          ),
          onGenerateRoute: RouteGenerator.onGenerateRoute,
          navigatorKey: locator<NavigationService>().navigatorKey,
          initialRoute: ChipRegistrationViewRoute,
        ),
      ),
    );
  }
}
