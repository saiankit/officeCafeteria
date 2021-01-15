import 'package:flutter/material.dart';
import 'package:officecafeteria/models/cartItem.dart';

List<CartItem> cartItemList = [];

class CartProvider extends ChangeNotifier {
  int cartItems = 0;

  addItemsToCart(CartItem cartItem) {
    cartItemList.add(cartItem);
    cartItems++;
    notifyListeners();
  }
}
