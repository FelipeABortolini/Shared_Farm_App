import 'package:flutter/material.dart';

class DeletePhaseController extends ChangeNotifier {
  int phaseId = 0;

  void setPhaseId(int id) {
    phaseId = id;
    notifyListeners();
  }

  void resetPhaseId() {
    phaseId = 0;
    notifyListeners();
  }
}
