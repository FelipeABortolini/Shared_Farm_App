import 'package:flutter/material.dart';

class RecipeController extends ChangeNotifier {
  Map<String, List<Map<String, dynamic>>> soja = {};
  Map<String, List<Map<String, dynamic>>> milho = {};
  Map<String, List<Map<String, dynamic>>> trigo = {};

  String category = "";
  String code = "";
  String quantity = "";

  bool automatic = true;
  bool yes = true;
  bool no = false;

  void resetControllers() {
    soja.clear();
    milho.clear();
    trigo.clear();

    category = "";
    code = "";
    quantity = "";

    automatic = true;
    notifyListeners();
  }

  void setAll(List<Map<String, List<Map<String, dynamic>>>> a){
    soja = a[0];
    milho = a[1];
    trigo = a[2];
    notifyListeners();
  }

  void setSoja(Map<String, List<Map<String, dynamic>>> a){
    soja = a;
    notifyListeners();
  }

  void setMilho(Map<String, List<Map<String, dynamic>>> a){
    milho = a;
    notifyListeners();
  }

  void setTrigo(Map<String, List<Map<String, dynamic>>> a){
    trigo = a;
    notifyListeners();
  }

  void setCategory(String a){
    category = a;
    notifyListeners();
  }

  void setCode(String a){
    code = a;
    notifyListeners();
  }

  void setQuantity(String a){
    quantity = a;
    notifyListeners();
  }

  void resetAutomatic(){
    automatic = false;
    yes = false;
    no = true;
    notifyListeners();
  }

  void setAutomatic(){
    automatic = true;
    yes = true;
    no = false;
    notifyListeners();
  }
}
