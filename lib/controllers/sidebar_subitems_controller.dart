import 'package:flutter/material.dart';

class SidebarSubitemsController extends ChangeNotifier {
  bool product = false;
  bool vehicle = false;
  bool recipe = false;
  bool report = false;
  bool local = false;

  void setProduct(bool status) {
    product = status;
    notifyListeners();
  }

  void setVehicle(bool status) {
    vehicle = status;
    notifyListeners();
  }

  void setRecipe(bool status) {
    recipe = status;
    notifyListeners();
  }

  void setReport(bool status) {
    report = status;
    notifyListeners();
  }

  void setLocal(bool status) {
    local = status;
    notifyListeners();
  }

  void resetAll(){
    product = false;
    vehicle = false;
    recipe = false;
    report = false;
    local = false;
    notifyListeners();
  }
}
