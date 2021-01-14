import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  int cartItems = 0;
  addItemsToCart() {
    cartItems++;
    notifyListeners();
  }
}
