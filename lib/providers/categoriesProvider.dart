import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  int categoryIndex = 1;
  bool isOrderSuccess = false;
  toggleOrderSuccess() {
    isOrderSuccess = true;
    notifyListeners();
  }

  dismissOrderSuccess() {
    isOrderSuccess = false;
    notifyListeners();
  }

  changeCategory(int index) {
    categoryIndex = index;
    notifyListeners();
  }
}
