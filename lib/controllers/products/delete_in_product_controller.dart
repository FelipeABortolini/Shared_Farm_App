import 'package:flutter/material.dart';

class DeleteInProductController extends ChangeNotifier {
  int indexSelected = 0;
  int indexListviewSelected = 0;
  List<Map<String, dynamic>> ins = [];

  void reset() {
    indexSelected = 0;
    ins.clear();
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

  void setIns(List<Map<String, dynamic>> list) {
    ins = list;
    notifyListeners();
  }
}
