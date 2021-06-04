import 'package:flutter/material.dart';
import 'package:school_project/models/models.dart';

import 'base_view_model.dart';

class SearchViewModel extends BaseViewModel {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocus = FocusNode();

  List<AnimalDetail> _details = [];

  List<AnimalDetail> _searchResults = [];
  List<AnimalDetail> get searchResults => _searchResults;

  void initAnimalDetails(List<AnimalDetail> details) {
    _details = details;
    _searchResults = details;
    notifyListeners();
  }

  void search() {
    _searchResults = _details
        .where((e) => e.chipNo.contains(searchController.text.trim()))
        .toList();
    notifyListeners();
  }

  void goBack() {
    navigationService.goBack();
  }
}
