import 'package:flutter/material.dart';

class AddLevelController extends ChangeNotifier {
  int level = 0;

  void setLevel(int lev) {
    level = lev;
    notifyListeners();
  }

  void resetLevel() {
    level = 0;
    notifyListeners();
  }
}