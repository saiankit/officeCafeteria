import 'package:flutter/material.dart';
import 'package:officecafeteria/models/cartItem.dart';
import 'package:officecafeteria/providers/productCount.dart';

List<CartItem> cartItemList = [];

class CartProvider extends ChangeNotifier {
  int cartItems = 0;
  int totalAmount = 0;
  clearItems() {
    cartItemList = [];
    cartItems = 0;
    notifyListeners();
  }

  addItemsToCart(CartItem cartItem) {
    final index = cartItemList
        .indexWhere((element) => element.product.id == cartItem.product.id);
    if (index == -1) {
      // Item Not Found
      cartItemList.add(cartItem);
      cartItems++;
    } else {
      // Item Found
      cartItemList[index] = cartItem;
    }
    int sum = 0;
    cartItemList.forEach((element) {
      sum = sum + (element.product.price * element.productCount);
    });
    totalAmount = sum;
    notifyListeners();
  }
}
