import 'package:flutter/material.dart';

import 'culture_product_controller.dart';

class CultureController extends ChangeNotifier {
  List<CultureProductController> products = [
    CultureProductController(
      activePrinciple: TextEditingController(text: ''),
      category: "",
      code: "",
      product: TextEditingController(text: ''),
      quantity: TextEditingController(text: ''),
      unity: "",
    ),
    CultureProductController(
      activePrinciple: TextEditingController(text: ''),
      category: "",
      code: "",
      product: TextEditingController(text: ''),
      quantity: TextEditingController(text: ''),
      unity: "",
    ),
    CultureProductController(
      activePrinciple: TextEditingController(text: ''),
      category: "",
      code: "",
      product: TextEditingController(text: ''),
      quantity: TextEditingController(text: ''),
      unity: "",
    ),
    CultureProductController(
      activePrinciple: TextEditingController(text: ''),
      category: "",
      code: "",
      product: TextEditingController(text: ''),
      quantity: TextEditingController(text: ''),
      unity: "",
    ),
    CultureProductController(
      activePrinciple: TextEditingController(text: ''),
      category: "",
      code: "",
      product: TextEditingController(text: ''),
      quantity: TextEditingController(text: ''),
      unity: "",
    ),
    CultureProductController(
      activePrinciple: TextEditingController(text: ''),
      category: "",
      code: "",
      product: TextEditingController(text: ''),
      quantity: TextEditingController(text: ''),
      unity: "",
    ),
    CultureProductController(
      activePrinciple: TextEditingController(text: ''),
      category: "",
      code: "",
      product: TextEditingController(text: ''),
      quantity: TextEditingController(text: ''),
      unity: "",
    ),
    CultureProductController(
      activePrinciple: TextEditingController(text: ''),
      category: "",
      code: "",
      product: TextEditingController(text: ''),
      quantity: TextEditingController(text: ''),
      unity: "",
    ),
    CultureProductController(
      activePrinciple: TextEditingController(text: ''),
      category: "",
      code: "",
      product: TextEditingController(text: ''),
      quantity: TextEditingController(text: ''),
      unity: "",
    ),
    CultureProductController(
      activePrinciple: TextEditingController(text: ''),
      category: "",
      code: "",
      product: TextEditingController(text: ''),
      quantity: TextEditingController(text: ''),
      unity: "",
    ),
  ];

  String phase = "";
  String date = "";
  TextEditingController name = TextEditingController(text: '');
  TextEditingController alqueres = TextEditingController(text: '');
  int alqueresNum = 1;
  bool isCulture = false;

  void resetControllers() {
    date = '';
    phase = '';
    name.text = '';
    alqueres.text = '1';
    alqueresNum = 1;
    products.clear();
    for (int i = 0; i < 10; i++) {
      products.add(
        CultureProductController(
          activePrinciple: TextEditingController(text: ''),
          category: "",
          code: "",
          product: TextEditingController(text: ''),
          quantity: TextEditingController(text: ''),
          unity: "",
        ),
      );
    }
    notifyListeners();
  }

  void resetAlqueres(){
    alqueres.text = '1';
    alqueresNum = 1;
    notifyListeners();
  }

  void setIsCulture(){
    isCulture = true;
    notifyListeners();
  }

  void resetIsCulture(){
    isCulture = true;
    notifyListeners();
  }

  void setPhase(String info) {
    phase = info;
    notifyListeners();
  }

  void resetPhase() {
    phase = "";
    notifyListeners();
  }

  void setDate(String info) {
    date = info;
    notifyListeners();
  }

  void resetDate() {
    date = "";
    notifyListeners();
  }

  void setAlqueres(String str) {
    try {
      alqueresNum = int.parse(str);
    } catch (e) {}
    notifyListeners();
  }
}
