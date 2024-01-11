
import 'package:flutter/material.dart';

class CultureTypeController extends ChangeNotifier {
  bool soja = true;
  bool milho = false;
  bool trigo = false;
  String result = 'Soja';

  void setSoja() {
    soja = true;
    milho = false;
    trigo = false;
    result = 'Soja';
    notifyListeners();
  }

  void setMilho() {
    soja = false;
    milho = true;
    trigo = false;
    result = 'Milho';
    notifyListeners();
  }

  void setTrigo() {
    soja = false;
    milho = false;
    trigo = true;
    result = 'Trigo';
    notifyListeners();
  }
}
