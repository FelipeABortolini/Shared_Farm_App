import 'package:flutter/material.dart';

class DatePickerController extends ChangeNotifier {
  DateTime date = DateTime.now().toLocal();

  setDate(DateTime newDate) {
    date = newDate;
    notifyListeners();
  }

  resetDate() {
    date = DateTime.now().toLocal();
    notifyListeners();
  }
}
