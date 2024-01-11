import 'package:flutter/material.dart';

class AmountProductsController extends ChangeNotifier {
  int amount = 1;
  int initialAmount = 0;

  void setAmount(int qtd) {
    amount = qtd;
    notifyListeners();
  }

  void setInitialAmount(int qtd) {
    initialAmount = qtd;
    notifyListeners();
  }
}