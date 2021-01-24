import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier {
  bool cash = false;
  bool creditCard = false;
  bool netBanking = false;
  bool upi = false;

  clearAll() {
    cash = false;
    creditCard = false;
    netBanking = false;
    upi = false;
    notifyListeners();
  }

  selectCash() {
    clearAll();
    cash = true;
    notifyListeners();
  }

  selectCreditCard() {
    clearAll();
    creditCard = true;
    notifyListeners();
  }

  selectNetBanking() {
    clearAll();
    netBanking = true;
    notifyListeners();
  }

  selectUpi() {
    clearAll();
    upi = true;
    notifyListeners();
  }
}
