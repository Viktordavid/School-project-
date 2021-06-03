import 'package:flutter/material.dart';
import 'package:school_project/services/services.dart';
import 'package:school_project/utils/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        appBarTheme: AppBarTheme(
          color: Color(0xff001219),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xfff94144),
          splashColor: Color(0xfff9844a),
        ),
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
