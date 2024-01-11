import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;

class HourPickerController extends ChangeNotifier {
  TimeOfDay hour = TimeOfDay.fromDateTime(tz.TZDateTime.from(DateTime.now().toUtc(), tz.getLocation('America/Sao_Paulo')));

  setHour(TimeOfDay newHour) {
    hour = newHour;
    notifyListeners();
  }

  setDefaultHour() {
    hour = TimeOfDay.fromDateTime(tz.TZDateTime.from(DateTime.now().toUtc(), tz.getLocation('America/Sao_Paulo')));
    notifyListeners();
  }
}