import 'package:flutter/material.dart';

class FullHistoryController extends ChangeNotifier {
  bool value = false;

  void resetControllers() {
    value = false;
    notifyListeners();
  }

  void toggleValue() {
    value = !value;
    notifyListeners();
  }
}
