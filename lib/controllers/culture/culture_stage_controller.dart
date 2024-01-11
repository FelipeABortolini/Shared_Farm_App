import 'package:flutter/material.dart';

class CultureStageController extends ChangeNotifier {
  String stage = "";

  void setStage(String data) {
    stage = data;
    notifyListeners();
  }
}