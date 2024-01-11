import 'package:flutter/material.dart';

class FillTableController extends ChangeNotifier {
  int id = 0;
  String product = "";
  String activePrinciple = "";
  double quantity = 0.0;
  double newQtt = 0.0;
  // double newLocalQtt = 0.0;
  String hour = "";
  String date = "";
  String? user = "";
  String local = "";
  String vehicle = "";
  String plate = "";

  void resetControllers() {
    id = 0;
    product = "";
    date = "";
    activePrinciple = "";
    quantity = 0.0;
    newQtt = 0.0;
    // newLocalQtt = 0.0;
    hour = "";
    user = "";
    local = "";
    vehicle = "";
    plate = "";
    notifyListeners();
  }

  void setDate(String info){
    date = info;
    notifyListeners();
  }

  void setVehicle(String info){
    vehicle = info;
    notifyListeners();
  }

  void setPlate(String info){
    plate = info;
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

  void setNewQtt(double info){
    newQtt = info;
    notifyListeners();
  }

  // void setNewLocalQtt(double info){
  //   newLocalQtt = info;
  //   notifyListeners();
  // }

  void setHour(String info){
    hour = info;
    notifyListeners();
  }

  void setUser(String? info){
    user = info;
    notifyListeners();
  }

  void setLocal(String info){
    local = info;
    notifyListeners();
  }
}
