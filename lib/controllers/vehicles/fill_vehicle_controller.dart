import 'package:flutter/material.dart';

class FillVehicleController extends ChangeNotifier {
  final quantity = TextEditingController();

  void setQuantity(String i) {
    quantity.text = i;
    notifyListeners();
  }

  void resetQuantity() {
    quantity.text = "";
    notifyListeners();
  }
}