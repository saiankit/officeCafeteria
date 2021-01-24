import 'package:flutter/material.dart';
import 'package:officecafeteria/models/serverModels/myOrder.dart';

class OrderProvider extends ChangeNotifier {
  bool isOrder = false;
  MyOrder myOrder;
  toggleOrder() {
    isOrder = true;
    notifyListeners();
  }

  addMyOrder(MyOrder newMyOrder) {
    myOrder = newMyOrder;
    notifyListeners();
  }
}
