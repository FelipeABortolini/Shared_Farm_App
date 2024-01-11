import 'package:flutter/material.dart';

class DatePickerMonthController extends ChangeNotifier {
  DateTime date = DateTime.now().toLocal().subtract(const Duration(days: 30));

  setDate(DateTime newDate) {
    date = newDate;
    notifyListeners();
  }

  resetDate() {
    date = DateTime.now().toLocal().subtract(const Duration(days: 30));
    notifyListeners();
  }
}
