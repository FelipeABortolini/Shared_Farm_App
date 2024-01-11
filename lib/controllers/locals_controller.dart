import 'package:flutter/material.dart';

class LocalsController extends ChangeNotifier {
  final name = TextEditingController();
  List<Map<String, dynamic>> locals = [];
  String? selected = "";

  void resetControllers() {
    name.text = "";
    notifyListeners();
  }

  void resetLocals() {
    locals.clear();
    notifyListeners();
  }

  void setLocals(List<Map<String, dynamic>> v) {
    locals = v;
    notifyListeners();
  }

  void setName(String n) {
    name.text = n;
    notifyListeners();
  }

  void setSelected(String? n) {
    selected = n;
    notifyListeners();
  }

  void resetSelected() {
    selected = "";
    notifyListeners();
  }
}
