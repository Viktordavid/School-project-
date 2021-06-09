import 'package:url_launcher/url_launcher.dart';

import 'base_view_model.dart';

class SupportViewModel extends BaseViewModel {
  void goBack() {
    navigationService.goBack();
  }

  void placeCall([String? url = 'tel:09120982054']) async {
    try {
      if (await canLaunch(url!)) {
        await launch(url);
      } else {
        print('Could not launch $url');
      }
    } catch (e) {
      print(e);
    }
  }
}
