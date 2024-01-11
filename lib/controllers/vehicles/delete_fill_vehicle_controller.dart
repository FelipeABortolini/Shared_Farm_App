import 'package:flutter/material.dart';

class DeleteFillVehicleController extends ChangeNotifier {
  int indexSelected = 0;
  int indexListviewSelected = 0;
  List<Map<String, dynamic>> fills = [];

  void reset() {
    indexSelected = 0;
    fills.clear();
    notifyListeners();
  }

  void setIndexSelected(int i) {
    indexSelected = i;
    notifyListeners();
  }

  void setIndexListviewSelected(int i) {
    indexListviewSelected = i;
    notifyListeners();
  }

  void setFills(List<Map<String, dynamic>> list) {
    fills = list;
    notifyListeners();
  }
}
