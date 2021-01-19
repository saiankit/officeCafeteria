import 'package:flutter/material.dart';

class ProductCount extends ChangeNotifier {
  int productCount = 1;

  decrementCounter() {
    if (productCount > 1) {
      productCount--;
    }
    notifyListeners();
  }

  updateCounter() {
    productCount++;
    notifyListeners();
  }

  getItemCount() {
    return productCount;
    notifyListeners();
  }
}
