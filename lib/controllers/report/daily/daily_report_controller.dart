import 'package:flutter/material.dart';

import 'daily_table_controller.dart';

class DailyReportController extends ChangeNotifier {
  String date = "";
  List<String> locals = [];
  List<DailyTableController> table = [];

  void resetControllers() {
    date = "false";
    locals.clear();
    table.clear();
    notifyListeners();
  }

  void setDate(String info){
    date = info;
    notifyListeners();
  }

  void addLocal(String info){
    locals.add(info);
    notifyListeners();
  }

  void addTableElement(DailyTableController info){
    table.add(info);
    notifyListeners();
  }
}
