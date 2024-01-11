import 'package:flutter/material.dart';

class SelectPhaseController extends ChangeNotifier {
  String phase = "";

  void setPhase(String info) {
    phase = info;
    notifyListeners();
  }

  void resetPhase() {
    phase = '';
    notifyListeners();
  }
}
