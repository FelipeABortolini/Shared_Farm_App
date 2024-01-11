
import 'package:flutter/material.dart';

class VehiclesController extends ChangeNotifier {
  final name = TextEditingController();
  final plate = TextEditingController();
  final tank = TextEditingController();
  double prevTank = 0.0;
  String? selected = "";
  List<Map<String, dynamic>> vehicles = [];

  void resetControllers() {
    name.text = "";
    plate.text = "";
    tank.text = "";
    prevTank = 0.0;
    notifyListeners();
  }

  void resetVehicles(){
    vehicles.clear();
    notifyListeners();
  }

  void setVehicles(List<Map<String, dynamic>> v){
    v.insert(0, {"name": "Selecione", "plate": "", "ID": "0", "tank": "0"});
    vehicles = v;
    notifyListeners();
  }

  void setName(String n){
    name.text = n;
    notifyListeners();
  }

  void setPlate(String n){
    plate.text = n;
    notifyListeners();
  }

  void setTank(String n){
    tank.text = n;
    notifyListeners();
  }

  void setPrevTank(double n){
    prevTank = n;
    notifyListeners();
  }

  void setSelected(String? n){
    selected = n;
    notifyListeners();
  }
}
