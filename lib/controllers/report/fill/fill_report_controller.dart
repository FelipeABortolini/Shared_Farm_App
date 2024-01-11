import 'package:flutter/material.dart';

import 'fill_table_controller.dart';
import 'fill_table_ins_controller.dart';

class FillReportController extends ChangeNotifier {
  List<String> locals = [];
  List<FillTableController> table = [];
  List<FillTableInsController> tableIns = [];
  double dieselSantaTerezinha = 0;
  double dieselReal = 0;
  double dieselSaoJoao = 0;
  double dieselSaoJorge = 0;
  double dieselCruzeiro = 0;
  double dieselCampinho = 0;
  double dieselCentral = 0;
  double qtt = 0;

  void resetControllers() {
    locals.clear();
    table.clear();
    tableIns.clear();
    dieselSantaTerezinha = 0;
    dieselReal = 0;
    dieselSaoJoao = 0;
    dieselSaoJorge = 0;
    dieselCruzeiro = 0;
    dieselCampinho = 0;
    dieselCentral = 0;
    qtt = 0;
    notifyListeners();
  }

  void setQtt(double i) {
    qtt = i;
    notifyListeners();
  }

  void setDieselSantaTerezinha(double i) {
    dieselSantaTerezinha = i;
    notifyListeners();
  }

  void setDieselReal(double i) {
    dieselReal = i;
    notifyListeners();
  }

  void setDieselSaoJoao(double i) {
    dieselSaoJoao = i;
    notifyListeners();
  }

  void setDieselSaoJorge(double i) {
    dieselSaoJorge = i;
    notifyListeners();
  }

  void setDieselCruzeiro(double i) {
    dieselCruzeiro = i;
    notifyListeners();
  }

  void setDieselCampinho(double i) {
    dieselCampinho = i;
    notifyListeners();
  }

  void setDieselCentral(double i) {
    dieselCentral = i;
    notifyListeners();
  }

  void addLocal(String info) {
    locals.add(info);
    notifyListeners();
  }

  void addTableElement(FillTableController info) {
    table.add(info);
    notifyListeners();
  }

  void addTableInsElement(FillTableInsController info) {
    tableIns.add(info);
    notifyListeners();
  }
}
