
import 'package:flutter/material.dart';

class CultureYearController extends ChangeNotifier {
  bool lastCurrent = true;
  bool current = false;
  bool currentNext = false;
  bool next = false;
  String result = '';
  int currentYear = DateTime.now().year;

  void setLastCurrent() {
    lastCurrent = true;
    current = false;
    currentNext = false;
    next = false;
    result = '${currentYear-1}/$currentYear';
    notifyListeners();
  }

  void setCurrent() {
    lastCurrent = false;
    current = true;
    currentNext = false;
    next = false;
    result = '$currentYear';
    notifyListeners();
  }

  void setCurrentNext() {
    lastCurrent = false;
    current = false;
    currentNext = true;
    next = false;
    result = '$currentYear/${currentYear+1}';
    notifyListeners();
  }

  void setNext() {
    lastCurrent = false;
    current = false;
    currentNext = false;
    next = true;
    result = '${currentYear+1}';
    notifyListeners();
  }
 
}
