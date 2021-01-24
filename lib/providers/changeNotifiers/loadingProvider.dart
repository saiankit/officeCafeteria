import 'package:flutter/material.dart';

class LoadingProvider extends ChangeNotifier {
  bool loginLoading = false;
  bool registrationLoading = false;
  bool orderLoading = false;

  toggleLoginLoading() {
    loginLoading = !loginLoading;
    notifyListeners();
  }

  toggleRegistrationLoading() {
    registrationLoading = !registrationLoading;
    notifyListeners();
  }

  toggleOrderLoading() {
    orderLoading = !orderLoading;
    notifyListeners();
  }
}
