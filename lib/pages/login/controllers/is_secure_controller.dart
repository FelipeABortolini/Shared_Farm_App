import 'package:flutter/material.dart';

class IsSecureController extends ChangeNotifier {
  bool isSecure = true;
  
  void toggleIsSecure() {
    isSecure = !isSecure;
    notifyListeners();
  }
}