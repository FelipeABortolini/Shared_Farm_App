import 'package:flutter/material.dart';

import 'stock_table_current_controller.dart';
import 'stock_table_ins_controller.dart';
import 'stock_table_outs_controller.dart';

class StockReportController extends ChangeNotifier {
  
  List<String> categories = [];
  List<String> locals = [];
  List<StockTableInsController> tableIns = [];
  List<StockTableOutsController> tableOuts = [];
  List<StockTableCurrentController> tableLocalsCurrents = [];
  List<StockTableCurrentController> tableAllCurrents = [];

  void resetControllers() {
    categories.clear();
    locals.clear();
    tableIns.clear();
    tableOuts.clear();
    tableLocalsCurrents.clear();
    tableAllCurrents.clear();
    notifyListeners();
  }

  void addCategory(String info){
    categories.add(info);
    notifyListeners();
  }

  void addLocal(String info){
    locals.add(info);
    notifyListeners();
  }

  void addTableInsElement(StockTableInsController info){
    tableIns.add(info);
    notifyListeners();
  }

  void addTableOutsElement(StockTableOutsController info){
    tableOuts.add(info);
    notifyListeners();
  }

  void addTableLocalCurrentElement(StockTableCurrentController info){
    tableLocalsCurrents.add(info);
    notifyListeners();
  }

  void addTableAllCurrentElement(StockTableCurrentController info){
    tableAllCurrents.add(info);
    notifyListeners();
  }
}
