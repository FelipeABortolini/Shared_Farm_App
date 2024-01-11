import 'package:flutter/material.dart';

import 'colheita_table_controller.dart';
import 'culture_table_controller.dart';

class CultureReportController extends ChangeNotifier {
  String cultureType = "";
  String cultureName = "";
  String local = "";
  String startDate = "";
  String endDate = "";
  String currentPhase = "";
  List<CultureTableController> table = [];
  List<ColheitaTableController> tableColheita = [];
  List<Map<String, dynamic>> allCultures = [];
  List<String> allNamesCultures = [];
  String selectedCulture = "";
  double totalBags = 0.0;
  double totalKg = 0.0;
  double totalBagsNet = 0.0;
  double totalKgNet = 0.0;

  bool open = true;

  void resetControllers() {
    cultureType = "";
    cultureName = "";
    local = "";
    startDate = "";
    endDate = "";
    currentPhase = "";
    selectedCulture = "";
    open = true;
    totalBags = 0.0;
    totalKg = 0.0;
    totalBagsNet = 0.0;
    totalKgNet = 0.0;
    table.clear();
    tableColheita.clear();
    notifyListeners();
  }

  void resetAllNamesCultures() {
    allNamesCultures.clear();
    notifyListeners();
  }

  void resetAllCultures() {
    allCultures.clear();
    notifyListeners();
  }

  void setOpened(bool info) {
    open = info;
    notifyListeners();
  }

  void setCultureType(String info) {
    cultureType = info;
    notifyListeners();
  }

  void setCultureName(String info) {
    cultureName = info;
    notifyListeners();
  }

  void setLocal(String info) {
    local = info;
    notifyListeners();
  }

  void setStartDate(String info) {
    startDate = info;
    notifyListeners();
  }

  void setEndDate(String info) {
    endDate = info;
    notifyListeners();
  }

  void setTotalBags(double info) {
    totalBags = info;
    notifyListeners();
  }

  void setTotalKg(double info) {
    totalKg = info;
    notifyListeners();
  }

  void setTotalBagsNet(double info) {
    totalBagsNet = info;
    notifyListeners();
  }

  void setTotalKgNet(double info) {
    totalKgNet = info;
    notifyListeners();
  }

  void setCurrentPhase(String info) {
    currentPhase = info;
    notifyListeners();
  }

  void setSelectedCulture(String info) {
    selectedCulture = info;
    notifyListeners();
  }

  void setAllCultures(List<Map<String, dynamic>> info) {
    allCultures = info;
    notifyListeners();
  }

  void setAllNamesCultures(List<String> info) {
    allNamesCultures = info;
    notifyListeners();
  }

  void addTableElement(CultureTableController info) {
    table.add(info);
    notifyListeners();
  }

  void addColheitaTableElement(ColheitaTableController info) {
    tableColheita.add(info);
    notifyListeners();
  }
}
