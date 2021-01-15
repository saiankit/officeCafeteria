import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  int categoryIndex = 1;

  changeCategory(int index) {
    categoryIndex = index;
    notifyListeners();
  }
}
