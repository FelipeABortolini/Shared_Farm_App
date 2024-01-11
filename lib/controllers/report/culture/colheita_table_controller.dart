import 'package:flutter/material.dart';

import 'product_culture_report_controller.dart';

class ColheitaTableController extends ChangeNotifier {
  // String grossQuantity = "";
  double classifiedQttKg = 0;
  double classifiedQttBags = 0;
  String netQuantityKg = "";
  String netQuantityBags = "";
  String impurity = "";
  String damaged = "";
  String moisture = "";
  String vehicle = "";
  String plate = "";
  double difPerc = 0;
  String localDelivery = "";
  String date = "";
  String hour = "";
  String? user = "";
  int id = 0;

  void resetControllers() {
    // grossQuantity = "";
    classifiedQttKg = 0;
    classifiedQttBags = 0;
    id = 0;
    netQuantityKg = "";
    netQuantityBags = "";
    impurity = "";
    damaged = "";
    moisture = "";
    vehicle = "";
    plate = "";
    difPerc = 0;
    localDelivery = "";
    date = "";
    hour = "";
    user = "";
    notifyListeners();
  }

  void setId(int info) {
    id = info;
    notifyListeners();
  }

  // void setGrossQuantity(String info) {
  //   grossQuantity = info;
  //   notifyListeners();
  // }

  void setClassifiedQttKg(double info) {
    classifiedQttKg = info;
    notifyListeners();
  }

  void setClassifiedQttBags(double info) {
    classifiedQttBags = info;
    notifyListeners();
  }

  void setLocalDelivery(String info) {
    localDelivery = info;
    notifyListeners();
  }

  void setNetQuantityKg(String info) {
    netQuantityKg = info;
    notifyListeners();
  }

  void setNetQuantityBags(String info) {
    netQuantityBags = info;
    notifyListeners();
  }

  void setImpurity(String info) {
    impurity = info;
    notifyListeners();
  }

  void setDamaged(String info) {
    damaged = info;
    notifyListeners();
  }

  void setMoisture(String info) {
    moisture = info;
    notifyListeners();
  }

  void setVehicle(String info) {
    vehicle = info;
    notifyListeners();
  }

  void setPlate(String info) {
    plate = info;
    notifyListeners();
  }

  void setDate(String info) {
    date = info;
    notifyListeners();
  }

  void setHour(String info) {
    hour = info;
    notifyListeners();
  }

  void setUser(String? info) {
    user = info;
    notifyListeners();
  }

  void setDifPerc(double info) {
    difPerc = info;
    notifyListeners();
  }
}
