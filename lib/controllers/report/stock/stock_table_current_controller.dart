import 'package:flutter/material.dart';

class StockTableCurrentController extends ChangeNotifier {
  int id = 0;
  String product = "";
  String activePrinciple = "";
  double quantity = 0.0;
  String local = "";
  String unity = "";

  void resetControllers() {
    id = 0;
    product = "";
    activePrinciple = "";
    quantity = 0.0;
    local = "";
    unity = "";
    notifyListeners();
  }

  void setId(int info){
    id = info;
    notifyListeners();
  }

  void setProduct(String info){
    product = info;
    notifyListeners();
  }

  void setActivePrinciple(String info){
    activePrinciple = info;
    notifyListeners();
  }

  void setQuantity(double info){
    quantity = info;
    notifyListeners();
  }

  void setLocal(String info){
    local = info;
    notifyListeners();
  }

  void setUnity(String info){
    unity = info;
    notifyListeners();
  }
}
