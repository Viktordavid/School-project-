import 'package:flutter/material.dart';
import 'package:school_project/services/services.dart';
import 'package:school_project/utils/utils.dart';
import 'package:school_project/views/shared/shared.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 2)).then((value) {
        locator<NavigationService>().pushReplacementNamed(AuthBridgeViewRoute);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
      return Container(
        height: size.height,
        width: size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 80.h,
                  width: 100.w,
                  child: Image.asset('assets/images/animal.png',
                      color: Theme.of(context).primaryColorLight)),
              CustomSpacer(),
              Text(
                'Animal Track',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Theme.of(context).primaryColorLight),
              ),
            ],
          ),
        ),
      );
    });
  }
}
