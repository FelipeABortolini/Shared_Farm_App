import 'package:flutter/material.dart';

import '../controllers/culture/culture_controller.dart';
import '../controllers/products/products_controller.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String nameField;
  final int? lines;
  final int? length;
  final bool number;
  final CultureController? culture;
  final ProductsController? prod1;
  final ProductsController? prod2;
  final ProductsController? prod3;
  final ProductsController? prod4;
  final ProductsController? prod5;
  final ProductsController? prod6;
  final ProductsController? prod7;
  final ProductsController? prod8;
  final ProductsController? prod9;
  final ProductsController? prod10;
  final ProductsController? prod;
  final bool? newQuantity;

  const Input({
    super.key,
    required this.controller,
    required this.nameField,
    required this.number,
    this.lines,
    this.length,
    this.culture,
    this.prod1,
    this.prod2,
    this.prod3,
    this.prod4,
    this.prod5,
    this.prod6,
    this.prod7,
    this.prod8,
    this.prod9,
    this.prod10,
    this.prod,
    this.newQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: length != null
          ? ((culture != null)
              ? TextFormField(
                  controller: controller,
                  maxLines: lines ?? 1,
                  maxLength: length,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: nameField,
                  ),
                  keyboardType:
                      number ? TextInputType.number : TextInputType.text,
                  onChanged: (c) {
                    if (newQuantity == null) {
                      culture!.setAlqueres(c);
                      try {
                        prod1!.setTotalQuantity(
                            ((double.parse(prod1!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod1!.setRealQuantity(
                            ((double.parse(prod1!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                      try {
                        prod2!.setTotalQuantity(
                            ((double.parse(prod2!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod2!.setRealQuantity(
                            ((double.parse(prod2!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                      try {
                        prod3!.setTotalQuantity(
                            ((double.parse(prod3!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod3!.setRealQuantity(
                            ((double.parse(prod3!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                      try {
                        prod4!.setTotalQuantity(
                            ((double.parse(prod4!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod4!.setRealQuantity(
                            ((double.parse(prod4!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                      try {
                        prod5!.setTotalQuantity(
                            ((double.parse(prod5!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod5!.setRealQuantity(
                            ((double.parse(prod5!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                      try {
                        prod6!.setTotalQuantity(
                            ((double.parse(prod6!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod6!.setRealQuantity(
                            ((double.parse(prod6!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                      try {
                        prod7!.setTotalQuantity(
                            ((double.parse(prod7!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod8!.setRealQuantity(
                            ((double.parse(prod7!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                      try {
                        prod8!.setTotalQuantity(
                            ((double.parse(prod8!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod8!.setRealQuantity(
                            ((double.parse(prod8!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                      try {
                        prod9!.setTotalQuantity(
                            ((double.parse(prod9!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod9!.setRealQuantity(
                            ((double.parse(prod9!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                      try {
                        prod10!.setTotalQuantity(
                            ((double.parse(prod10!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod10!.setRealQuantity(
                            ((double.parse(prod10!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                    } else {
                      try {
                        prod!.setTotalQuantity(
                            ((double.parse(prod!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod!.setRealQuantity(
                            ((double.parse(prod!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                    }
                  })
              : TextFormField(
                  controller: controller,
                  maxLines: lines ?? 1,
                  maxLength: length,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: nameField,
                  ),
                  keyboardType:
                      number ? TextInputType.number : TextInputType.text,
                ))
          : ((culture != null)
              ? TextFormField(
                  controller: controller,
                  maxLines: lines ?? 1,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: nameField,
                  ),
                  keyboardType:
                      number ? TextInputType.number : TextInputType.text,
                  onChanged: (c) {
                    if (newQuantity == null) {
                      culture!.setAlqueres(c);
                      try {
                        prod1!.setTotalQuantity(
                            ((double.parse(prod1!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod1!.setRealQuantity(
                            ((double.parse(prod1!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                      try {
                        prod2!.setTotalQuantity(
                            ((double.parse(prod2!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod2!.setRealQuantity(
                            ((double.parse(prod2!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                      try {
                        prod3!.setTotalQuantity(
                            ((double.parse(prod3!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod3!.setRealQuantity(
                            ((double.parse(prod3!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                      try {
                        prod4!.setTotalQuantity(
                            ((double.parse(prod4!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod4!.setRealQuantity(
                            ((double.parse(prod4!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                      try {
                        prod5!.setTotalQuantity(
                            ((double.parse(prod5!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod5!.setRealQuantity(
                            ((double.parse(prod5!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                      try {
                        prod6!.setTotalQuantity(
                            ((double.parse(prod6!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod6!.setRealQuantity(
                            ((double.parse(prod6!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                      try {
                        prod7!.setTotalQuantity(
                            ((double.parse(prod7!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod8!.setRealQuantity(
                            ((double.parse(prod7!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                      try {
                        prod8!.setTotalQuantity(
                            ((double.parse(prod8!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod8!.setRealQuantity(
                            ((double.parse(prod8!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                      try {
                        prod9!.setTotalQuantity(
                            ((double.parse(prod9!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod9!.setRealQuantity(
                            ((double.parse(prod9!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                      try {
                        prod10!.setTotalQuantity(
                            ((double.parse(prod10!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod10!.setRealQuantity(
                            ((double.parse(prod10!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                    } else {
                      try {
                        prod!.setTotalQuantity(
                            ((double.parse(prod!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                        prod!.setRealQuantity(
                            ((double.parse(prod!.quantity.text)) *
                                    (culture!.alqueresNum))
                                .toStringAsFixed(2));
                      } catch (e) {}
                    }
                  })
              : TextFormField(
                  controller: controller,
                  maxLines: lines ?? 1,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: nameField,
                  ),
                  keyboardType:
                      number ? TextInputType.number : TextInputType.text,
                )),
    );
  }
}
