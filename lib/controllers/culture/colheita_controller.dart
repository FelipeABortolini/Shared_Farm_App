import 'package:flutter/material.dart';

class ColheitaController extends ChangeNotifier {
  final product = TextEditingController();
  final vehicle = TextEditingController();
  final local = TextEditingController();
  // final grossQuantity = TextEditingController(text: "0.0");
  final netQuantity = TextEditingController(text: "0.0");
  final impurity = TextEditingController(text: "0.0");
  final damaged = TextEditingController(text: "0.0");
  final moisture = TextEditingController(text: "0.0");
  String localEntrega = "";
  double difPerc = 0.0;
  double classifiedQttKg = 0.0;
  double classifiedQttBags = 0.0;

  void resetControllers() {
    product.text = "";
    vehicle.text = "";
    local.text = "";
    // grossQuantity.text = "0.0";
    netQuantity.text = "0.0";
    impurity.text = "0.0";
    damaged.text = "0.0";
    moisture.text = "0.0";
    localEntrega = "";
    difPerc = 0.0;
    classifiedQttKg = 0.0;
    classifiedQttBags = 0.0;
  }

  void setDifPerc(double i){
    difPerc = i;
    notifyListeners();
  }

  void setClassifiedQttKg(double i){
    classifiedQttKg = i;
    notifyListeners();
  }

  void setClassifiedQttBags(double i){
    classifiedQttBags = i;
    notifyListeners();
  }

  void setLocalEntrega(String i){
    localEntrega = i;
    notifyListeners();
  }
}