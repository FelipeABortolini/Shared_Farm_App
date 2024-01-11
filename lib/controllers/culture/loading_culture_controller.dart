import 'package:flutter/material.dart';

class LoadingCultureController extends ChangeNotifier {
  bool isLoading = false;

  void setIsLoading() {
    isLoading = true;
    notifyListeners();
  }

  void resetIsLoading() {
    isLoading = false;
    notifyListeners();
  }
}
