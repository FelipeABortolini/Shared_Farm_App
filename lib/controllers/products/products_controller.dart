import 'package:flutter/material.dart';

class ProductsController extends ChangeNotifier {
  final name = TextEditingController();
  final category = TextEditingController();
  final code = TextEditingController();
  final quantity = TextEditingController();
  final realQuantity = TextEditingController();
  double prevQuantity = 0.0;
  String totalQuantity = "0.0";
  final unity = TextEditingController();
  final dad = TextEditingController();
  final activePrinciple = TextEditingController();
  final sons = [];

  void setProd(ProductsController p) {
    name.text = p.name.text;
    category.text = p.category.text;
    code.text = p.code.text;
    quantity.text = p.quantity.text;
    realQuantity.text = p.realQuantity.text;
    prevQuantity = p.prevQuantity;
    totalQuantity = p.totalQuantity;
    unity.text = p.unity.text;
    dad.text = p.dad.text;
    activePrinciple.text = p.activePrinciple.text;
    sons.clear();
    for (var son in p.sons) {
      sons.add(son);
    }
    notifyListeners();
  }

  void resetControllers() {
    totalQuantity = "0.0";
    realQuantity.text = "";
    name.text = "";
    category.text = "";
    code.text = "";
    quantity.text = "";
    prevQuantity = 0.0;
    unity.text = "";
    dad.text = "";
    activePrinciple.text = "";
    sons.clear();
    notifyListeners();
  }

  void setName(String n) {
    name.text = n;
    notifyListeners();
  }

  void setCode(String n) {
    code.text = n;
    notifyListeners();
  }

  void setActivePrinciple(String n) {
    activePrinciple.text = n;
    notifyListeners();
  }

  void setQuantity(String n) {
    quantity.text = n;
    notifyListeners();
  }

  void setPrevQuantity(double n) {
    prevQuantity = n;
    notifyListeners();
  }

  void resetPrevQuantity() {
    prevQuantity = 0.0;
    notifyListeners();
  }

  void setUnity(String n) {
    unity.text = n;
    notifyListeners();
  }

  void setCategory(String n) {
    category.text = n;
    notifyListeners();
  }

  void setDad(String n) {
    dad.text = n;
    notifyListeners();
  }

  void setTotalQuantity(String n) {
    totalQuantity = n;
    notifyListeners();
  }

  void setRealQuantity(String n) {
    realQuantity.text = n;
    notifyListeners();
  }
}
