import 'package:flutter/material.dart';

class CultureProductController extends ChangeNotifier {
  CultureProductController({
    required this.quantity,
    required this.category,
    required this.code,
    required this.activePrinciple,
    required this.product,
    required this.unity,
  });

  TextEditingController quantity;
  String category;
  String code;
  String unity;
  TextEditingController activePrinciple;
  TextEditingController product;

  void resetControllers() {
    quantity.text = '0';
    category = '';
    code = '';
    activePrinciple.text = '';
    product.text = '';
    unity = '';
  }
}
