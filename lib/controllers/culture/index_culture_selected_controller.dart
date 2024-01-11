import 'package:flutter/material.dart';

class IndexCultureSelectedController extends ChangeNotifier {
  int? index;

  void setIndex(int i) {
    index = i;
    notifyListeners();
  }

  void resetIndex() {
    index = null;
    notifyListeners();
  }
}