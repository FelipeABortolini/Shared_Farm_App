import 'package:flutter/material.dart';

class DailyTableController extends ChangeNotifier {
  int id = 0;
  String product = "";
  String activePrinciple = "";
  String culture = "";
  String phase = "";
  String vehicle = "";
  String plate = "";
  double quantity = 0.0;
  double newQtt = 0.0;
  // double newLocalQtt = 0.0;
  String hour = "";
  String? user = "";
  String local = "";
  String op = "";
  String unity = "";

  void resetControllers() {
    id = 0;
    product = "";
    activePrinciple = "";
    culture = "";
    phase = "";
    vehicle = "";
    plate = "";
    quantity = 0.0;
    newQtt = 0.0;
    // newLocalQtt = 0.0;
    hour = "";
    user = "";
    local = "";
    op = "";
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

  void setCulture(String info){
    culture = info;
    notifyListeners();
  }

  void setPhase(String info){
    phase = info;
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

  void setOp(String info){
    op = info;
    notifyListeners();
  }

  void setUnity(String info){
    unity = info;
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
}
