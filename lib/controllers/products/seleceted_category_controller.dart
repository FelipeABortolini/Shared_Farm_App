import 'package:flutter/material.dart';

class SelectedCategoryController extends ChangeNotifier {
  bool adubos = false;
  bool sementes = false;
  bool inseticidas = false;
  bool herbicidas = false;
  bool fungicidas = false;
  bool adjuvantes = false;
  bool inoculantes = false;
  bool diesel = false;
  bool fertilizantesFoliares = false;

  String? categoryString;

  void resetControllers() {
    adubos = false;
    sementes = false;
    inseticidas = false;
    herbicidas = false;
    fungicidas = false;
    adjuvantes = false;
    inoculantes = false;
    diesel = false;
    fertilizantesFoliares = false;
    categoryString = null;
    notifyListeners();
  }

  void allSelected(){
    adubos = true;
    sementes = true;
    inseticidas = true;
    herbicidas = true;
    fungicidas = true;
    adjuvantes = true;
    inoculantes = true;
    diesel = true;
    fertilizantesFoliares = true;
    notifyListeners();
  }

  void allUnselected(){
    adubos = false;
    sementes = false;
    inseticidas = false;
    herbicidas = false;
    fungicidas = false;
    adjuvantes = false;
    inoculantes = false;
    diesel = false;
    fertilizantesFoliares = false;
    notifyListeners();
  }

  void setAdubos() {
    adubos = true;
    setCategoryString("adubo");
    notifyListeners();
  }

  void setSementes() {
    sementes = true;
    setCategoryString("semente");
    notifyListeners();
  }

  void setInseticidas() {
    inseticidas = true;
    setCategoryString("inseticida");
    notifyListeners();
  }

  void setHerbicidas() {
    herbicidas = true;
    setCategoryString("herbicida");
    notifyListeners();
  }

  void setFungicidas() {
    fungicidas = true;
    setCategoryString("fungicida");
    notifyListeners();
  }

  void setAdjuvantes() {
    adjuvantes = true;
    setCategoryString("adjuvante");
    notifyListeners();
  }

  void setInoculantes() {
    inoculantes = true;
    setCategoryString("inoculante");
    notifyListeners();
  }

  void setDiesel() {
    diesel = true;
    setCategoryString("diesel");
    notifyListeners();
  }

  void setFertilizantesFoliares() {
    fertilizantesFoliares = true;
    setCategoryString("fertilizanteFoliar");
    notifyListeners();
  }

  void toggleAdubos() {
    adubos = !adubos;
    notifyListeners();
  }

  void toggleSementes() {
    sementes = !sementes;
    notifyListeners();
  }

  void toggleInseticidas() {
    inseticidas = !inseticidas;
    notifyListeners();
  }

  void toggleHerbicidas() {
    herbicidas = !herbicidas;
    notifyListeners();
  }

  void toggleFungicidas() {
    fungicidas = !fungicidas;
    notifyListeners();
  }

  void toggleAdjuvantes() {
    adjuvantes = !adjuvantes;
    notifyListeners();
  }

  void toggleInoculantes() {
    inoculantes = !inoculantes;
    notifyListeners();
  }

  void toggleDiesel() {
    diesel = !diesel;
    notifyListeners();
  }

  void toggleFertilizantesFoliares() {
    fertilizantesFoliares = !fertilizantesFoliares;
    notifyListeners();
  }

  void setCategoryString(String str) {
    categoryString = str;
    notifyListeners();
  }
}
