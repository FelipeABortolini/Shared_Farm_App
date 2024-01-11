import 'package:flutter/material.dart';

class StockTableOutsController extends ChangeNotifier {
  int id = 0;
  String product = "";
  String activePrinciple = "";
  double quantity = 0.0;
  double newQtt = 0.0;
  // double newLocalQtt = 0.0;
  String date = "";
  String hour = "";
  String local = "";
  String culture = "";
  String phase = "";
  String vehicle = "";
  String plate = "";
  String? user = "";
  String unity = "";

  void resetControllers() {
    id = 0;
    product = "";
    activePrinciple = "";
    quantity = 0.0;
    newQtt = 0.0;
    // newLocalQtt = 0.0;
    date = "";
    hour = "";
    local = "";
    culture = "";
    phase = "";
    vehicle = "";
    plate = "";
    user = "";
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

  void setNewQtt(double info){
    newQtt = info;
    notifyListeners();
  }

  // void setNewLocalQtt(double info){
  //   newLocalQtt = info;
  //   notifyListeners();
  // }

  void setDate(String info){
    date = info;
    notifyListeners();
  }
  
  void setHour(String info){
    hour = info;
    notifyListeners();
  }
  
  void setLocal(String info){
    local = info;
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

  void setUser(String? info){
    user = info;
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
