import 'package:flutter/material.dart';

class ProductCultureReportController extends ChangeNotifier {
  int id = 0;
  String product = "";
  String activePrinciple = "";
  double quantity = 0.0;
  double newQtt = 0.0;
  double newLocalQtt = 0.0;
  String unity = "";

  void resetControllers() {
    id = 0;
    product = "";
    activePrinciple = "";
    unity = "";
    quantity = 0.0;
    newQtt = 0.0;
    newLocalQtt = 0.0;
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

  void setUnity(String info){
    unity = info;
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

  void setNewQtt(double info){
    newQtt = info;
    notifyListeners();
  }

  void setNewLocalQtt(double info){
    newLocalQtt = info;
    notifyListeners();
  }
}
