import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:school_project/models/models.dart';
import 'package:school_project/utils/utils.dart';
import 'package:school_project/view-models/base_view_model.dart';
import 'package:school_project/view-models/search_view_model.dart';

class DashboardViewModel extends BaseViewModel {
  List<AnimalDetail> _animalDetails = [];
  List<AnimalDetail> get animalDetails => _animalDetails;

  ///Sets up a StreamSubscription which can be listened to for new cow documents
  ///added on Firestore
  void getAnimalDetails(SearchViewModel searchVM) {
    try {
      final ref = FirebaseFirestore.instance
          .collection('cows')
          .withConverter<AnimalDetail>(
            fromFirestore: (snapshot, _) =>
                AnimalDetail.fromMap(snapshot.data()!),
            toFirestore: (cow, _) => cow.toMap(),
          );

      ref.snapshots().listen((event) {
        _animalDetails = event.docs.map((e) => e.data()).toList();
        searchVM.initAnimalDetails(_animalDetails);
        notifyListeners();
      });
    } catch (e) {
      print(e);
    }
  }

  void exitApp() {
    navigationService.exitApp();
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  void navigateTo(String route) async {
    try {
      switch (route) {
        case RegistrationHistoryViewRoute:
          navigationService.pushNamed(route);
          break;
        case MicroChipsViewRoute:
          navigationService.pushNamed(route);
          break;
        case LoginViewRoute:
          await logout();
          break;
        default:
          navigationService.pushNamed(route);
      }
    } catch (e) {
      print(e);
    }
  }
}
