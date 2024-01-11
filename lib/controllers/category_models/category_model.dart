
import 'package:flutter/material.dart';

abstract class CategoryModel extends ChangeNotifier {
  List<Map<String, dynamic>> nivel1 = [];
  List<Map<String, dynamic>> nivel2 = [];
  List<Map<String, dynamic>> nivel3 = [];
  List<Map<String, dynamic>> nivel4 = [];
  List<Map<String, dynamic>> nivel5 = [];
  List<Map<String, dynamic>> nivel6 = [];
  List<Map<String, dynamic>> nivel7 = [];
  List<Map<String, dynamic>> nivel8 = [];
  List<Map<String, dynamic>> nivel9 = [];
  List<Map<String, dynamic>> nivel10 = [];

  String? selectedNivel1;
  String? selectedNivel2;
  String? selectedNivel3;
  String? selectedNivel4;
  String? selectedNivel5;
  String? selectedNivel6;
  String? selectedNivel7;
  String? selectedNivel8;
  String? selectedNivel9;
  String? selectedNivel10;
  String? lastSelected;

  bool noSelection = true;

  List<Map<String, dynamic>> filteredNivel2 = [];
  List<Map<String, dynamic>> filteredNivel3 = [];
  List<Map<String, dynamic>> filteredNivel4 = [];
  List<Map<String, dynamic>> filteredNivel5 = [];
  List<Map<String, dynamic>> filteredNivel6 = [];
  List<Map<String, dynamic>> filteredNivel7 = [];
  List<Map<String, dynamic>> filteredNivel8 = [];
  List<Map<String, dynamic>> filteredNivel9 = [];
  List<Map<String, dynamic>> filteredNivel10 = [];

  void resetNiveisAll() {
    nivel1.clear();
    nivel2.clear();
    nivel3.clear();
    nivel4.clear();
    nivel5.clear();
    nivel6.clear();
    nivel7.clear();
    nivel8.clear();
    nivel9.clear();
    nivel10.clear();
    notifyListeners();
  }

  void resetAll() {
    filteredNivel2.clear();
    filteredNivel3.clear();
    filteredNivel4.clear();
    filteredNivel5.clear();
    filteredNivel6.clear();
    filteredNivel7.clear();
    filteredNivel8.clear();
    filteredNivel9.clear();
    filteredNivel10.clear();
    selectedNivel1 = null;
    selectedNivel2 = null;
    selectedNivel3 = null;
    selectedNivel4 = null;
    selectedNivel5 = null;
    selectedNivel6 = null;
    selectedNivel7 = null;
    selectedNivel8 = null;
    selectedNivel9 = null;
    selectedNivel10 = null;
    lastSelected = null;
    notifyListeners();
  }

  void resetUp2() {
    filteredNivel2.clear();
    filteredNivel3.clear();
    filteredNivel4.clear();
    filteredNivel5.clear();
    filteredNivel6.clear();
    filteredNivel7.clear();
    filteredNivel8.clear();
    filteredNivel9.clear();
    filteredNivel10.clear();
    selectedNivel2 = null;
    selectedNivel3 = null;
    selectedNivel4 = null;
    selectedNivel5 = null;
    selectedNivel6 = null;
    selectedNivel7 = null;
    selectedNivel8 = null;
    selectedNivel9 = null;
    selectedNivel10 = null;
    notifyListeners();
  }

  void resetUp3() {
    filteredNivel3.clear();
    filteredNivel4.clear();
    filteredNivel5.clear();
    filteredNivel6.clear();
    filteredNivel7.clear();
    filteredNivel8.clear();
    filteredNivel9.clear();
    filteredNivel10.clear();
    selectedNivel3 = null;
    selectedNivel4 = null;
    selectedNivel5 = null;
    selectedNivel6 = null;
    selectedNivel7 = null;
    selectedNivel8 = null;
    selectedNivel9 = null;
    selectedNivel10 = null;
    notifyListeners();
  }

  void resetUp4() {
    filteredNivel4.clear();
    filteredNivel5.clear();
    filteredNivel6.clear();
    filteredNivel7.clear();
    filteredNivel8.clear();
    filteredNivel9.clear();
    filteredNivel10.clear();
    selectedNivel4 = null;
    selectedNivel5 = null;
    selectedNivel6 = null;
    selectedNivel7 = null;
    selectedNivel8 = null;
    selectedNivel9 = null;
    selectedNivel10 = null;
    notifyListeners();
  }

  void resetUp5() {
    filteredNivel5.clear();
    filteredNivel6.clear();
    filteredNivel7.clear();
    filteredNivel8.clear();
    filteredNivel9.clear();
    filteredNivel10.clear();
    selectedNivel5 = null;
    selectedNivel6 = null;
    selectedNivel7 = null;
    selectedNivel8 = null;
    selectedNivel9 = null;
    selectedNivel10 = null;
    notifyListeners();
  }

  void resetUp6() {
    filteredNivel6.clear();
    filteredNivel7.clear();
    filteredNivel8.clear();
    filteredNivel9.clear();
    filteredNivel10.clear();
    selectedNivel6 = null;
    selectedNivel7 = null;
    selectedNivel8 = null;
    selectedNivel9 = null;
    selectedNivel10 = null;
    notifyListeners();
  }

  void resetUp7() {
    filteredNivel7.clear();
    filteredNivel8.clear();
    filteredNivel9.clear();
    filteredNivel10.clear();
    selectedNivel7 = null;
    selectedNivel8 = null;
    selectedNivel9 = null;
    selectedNivel10 = null;
    notifyListeners();
  }

  void resetUp8() {
    filteredNivel8.clear();
    filteredNivel9.clear();
    filteredNivel10.clear();
    selectedNivel8 = null;
    selectedNivel9 = null;
    selectedNivel10 = null;
    notifyListeners();
  }

  void resetUp9() {
    filteredNivel9.clear();
    filteredNivel10.clear();
    selectedNivel9 = null;
    selectedNivel10 = null;
    notifyListeners();
  }

  void resetUp10() {
    filteredNivel10.clear();
    selectedNivel10 = null;
    notifyListeners();
  }

  void setSelectedNivel1(String? str){
    selectedNivel1 = str;
    notifyListeners();
  }

  void setSelectedNivel2(String? str){
    selectedNivel2 = str;
    notifyListeners();
  }

  void setSelectedNivel3(String? str){
    selectedNivel3 = str;
    notifyListeners();
  }

  void setSelectedNivel4(String? str){
    selectedNivel4 = str;
    notifyListeners();
  }

  void setSelectedNivel5(String? str){
    selectedNivel5 = str;
    notifyListeners();
  }

  void setSelectedNivel6(String? str){
    selectedNivel6 = str;
    notifyListeners();
  }

  void setSelectedNivel7(String? str){
    selectedNivel7 = str;
    notifyListeners();
  }

  void setSelectedNivel8(String? str){
    selectedNivel8 = str;
    notifyListeners();
  }

  void setSelectedNivel9(String? str){
    selectedNivel9 = str;
    notifyListeners();
  }

  void setSelectedNivel10(String? str){
    selectedNivel10 = str;
    notifyListeners();
  }

  void setLastSelected(String? str){
    lastSelected = str;
    notifyListeners();
  }

  void setNoSelection(){
    noSelection = true;
    notifyListeners();
  }

  void resetNoSelection(){
    noSelection = false;
    notifyListeners();
  }
}