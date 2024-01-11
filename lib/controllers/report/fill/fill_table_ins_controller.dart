import 'package:flutter/material.dart';

class FillTableInsController extends ChangeNotifier {
  int id = 0;
  double quantity = 0.0;
  double newQtt = 0.0;
  String date = "";

  void resetControllers() {
    id = 0;
    quantity = 0.0;
    newQtt = 0.0;
    date = "";
    notifyListeners();
  }

  void setId(int info){
    id = info;
    notifyListeners();
  }

  void setQuantity(double info){
    quantity = info;
    notifyListeners();
  }

  void setNewQtt(double info){
    newQtt = info;
    notifyListeners();
  }

  void setDate(String info){
    date = info;
    notifyListeners();
  }
}
