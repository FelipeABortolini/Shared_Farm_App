import 'package:flutter/material.dart';

import 'product_culture_report_controller.dart';

class CultureTableController extends ChangeNotifier {
  String phase = "";
  String date = "";
  String hour = "";
  String? user = "";
  List<ProductCultureReportController> prods = [];

  void resetControllers() {
    phase = "";
    date = "";
    hour = "";
    user = "";
    prods.clear();
    notifyListeners();
  }

  void setPhase(String info){
    phase = info;
    notifyListeners();
  }

  void setDate(String info){
    date = info;
    notifyListeners();
  }

  void setHour(String info){
    hour = info;
    notifyListeners();
  }

  void setUser(String? info){
    user = info;
    notifyListeners();
  }

  void addProd(ProductCultureReportController info){
    prods.add(info);
    notifyListeners();
  }
}
