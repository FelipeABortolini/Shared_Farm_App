import 'package:flutter/material.dart';

class ReportTypeController extends ChangeNotifier {
  bool daily = false;
  bool culture = false;
  bool stock = false;
  bool fill = false;

  void resetControllers() {
    daily = false;
    culture = false;
    stock = false;
    fill = false;
    notifyListeners();
  }

  void setDaily(){
    daily = true;
    culture = false;
    stock = false;
    fill = false;
    notifyListeners();
  }

  void setCulture(){
    daily = false;
    culture = true;
    stock = false;
    fill = false;
    notifyListeners();
  }

  void setStock(){
    daily = false;
    culture = false;
    stock = true;
    fill = false;
    notifyListeners();
  }

  void setFill(){
    daily = false;
    culture = false;
    stock = false;
    fill = true;
    notifyListeners();
  }
}
