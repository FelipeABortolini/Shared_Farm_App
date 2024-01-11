import 'package:flutter/material.dart';
import 'package:flv_farm/pages/culture/utils/kgInBag.dart';

import '../controllers/culture/colheita_controller.dart';

class InputReport extends StatelessWidget {
  final TextEditingController controller;
  final String nameField;
  final int? lines;
  final int? length;
  final bool? qtd;
  final ColheitaController? colheita;
  final String? type;

  const InputReport({
    super.key,
    required this.controller,
    required this.nameField,
    this.lines,
    this.length,
    this.qtd,
    this.colheita,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: length != null
          ? ((qtd == null)
              ? TextFormField(
                  controller: controller,
                  maxLines: lines ?? 1,
                  maxLength: length,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: nameField,
                  ),
                  keyboardType: TextInputType.text,
                )
              : TextFormField(
                  onTap: () {
                    if (colheita!.netQuantity.text == "0.0" &&
                        type == "QttLiquida") {
                      colheita!.netQuantity.text = "";
                    } else if (colheita!.moisture.text == "0.0" &&
                        type == "Umidade") {
                      colheita!.moisture.text = "";
                    } else if (colheita!.impurity.text == "0.0" &&
                        type == "Impurezas") {
                      colheita!.impurity.text = "";
                    } else if (colheita!.damaged.text == "0.0" &&
                        type == "Avariados") {
                      colheita!.damaged.text = "";
                    }
                  },
                  onTapOutside: (e) {
                    if (colheita!.netQuantity.text.isEmpty &&
                        type == "QttLiquida") {
                      colheita!.netQuantity.text = "0.0";
                    } else if (colheita!.moisture.text.isEmpty &&
                        type == "Umidade") {
                      colheita!.moisture.text = "0.0";
                    } else if (colheita!.impurity.text.isEmpty &&
                        type == "Impurezas") {
                      colheita!.impurity.text = "0.0";
                    } else if (colheita!.damaged.text.isEmpty &&
                        type == "Avariados") {
                      colheita!.damaged.text = "0.0";
                    }
                  },
                  // onEditingComplete: () {
                  //   if (colheita!.netQuantity.text.isEmpty &&
                  //       type == "QttLiquida") {
                  //     colheita!.netQuantity.text = "0.0";
                  //   } else if (colheita!.moisture.text.isEmpty &&
                  //       type == "Umidade") {
                  //     colheita!.moisture.text = "0.0";
                  //   } else if (colheita!.impurity.text.isEmpty &&
                  //       type == "Impurezas") {
                  //     colheita!.impurity.text = "0.0";
                  //   } else if (colheita!.damaged.text.isEmpty &&
                  //       type == "Avariados") {
                  //     colheita!.damaged.text = "0.0";
                  //   }
                  // },
                  // onSaved: (e) {
                  //   if (colheita!.netQuantity.text.isEmpty &&
                  //       type == "QttLiquida") {
                  //     colheita!.netQuantity.text = "0.0";
                  //   } else if (colheita!.moisture.text.isEmpty &&
                  //       type == "Umidade") {
                  //     colheita!.moisture.text = "0.0";
                  //   } else if (colheita!.impurity.text.isEmpty &&
                  //       type == "Impurezas") {
                  //     colheita!.impurity.text = "0.0";
                  //   } else if (colheita!.damaged.text.isEmpty &&
                  //       type == "Avariados") {
                  //     colheita!.damaged.text = "0.0";
                  //   }
                  // },
                  controller: controller,
                  maxLines: lines ?? 1,
                  maxLength: length,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: nameField,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (c) {
                    if (colheita!.netQuantity.text.isNotEmpty &&
                        colheita!.impurity.text.isNotEmpty &&
                        colheita!.moisture.text.isNotEmpty &&
                        colheita!.damaged.text.isNotEmpty) {
                      try {
                        colheita!.classifiedQttKg =
                            double.parse(colheita!.netQuantity.text) -
                                double.parse(colheita!.impurity.text) -
                                double.parse(colheita!.damaged.text) -
                                double.parse(colheita!.moisture.text);
                        colheita!.classifiedQttBags = double.parse(
                            (colheita!.classifiedQttKg / kgInBag).round().toString());
                        if (double.parse(colheita!.netQuantity.text) > 0 &&
                            colheita!.classifiedQttKg > 0 &&
                            double.parse(colheita!.netQuantity.text) >=
                                colheita!.classifiedQttKg) {
                          colheita!.setDifPerc(double.parse(
                              (((double.parse(colheita!.netQuantity.text) -
                                              colheita!.classifiedQttKg) /
                                          double.parse(
                                              colheita!.netQuantity.text)) *
                                      100)
                                  .toStringAsFixed(2)));
                        } else {
                          colheita!.setDifPerc(0);
                        }
                      } catch (e) {
                        throw Exception(e);
                      }
                    }
                  },
                ))
          : ((qtd == null)
              ? TextFormField(
                  controller: controller,
                  maxLines: lines ?? 1,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: nameField,
                  ),
                  keyboardType: TextInputType.text,
                )
              : TextFormField(
                  controller: controller,
                  maxLines: lines ?? 1,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: nameField,
                  ),
                  keyboardType: TextInputType.number,
                  onTap: () {
                    if (colheita!.netQuantity.text == "0.0" &&
                        type == "QttLiquida") {
                      colheita!.netQuantity.text = "";
                    } else if (colheita!.moisture.text == "0.0" &&
                        type == "Umidade") {
                      colheita!.moisture.text = "";
                    } else if (colheita!.impurity.text == "0.0" &&
                        type == "Impurezas") {
                      colheita!.impurity.text = "";
                    } else if (colheita!.damaged.text == "0.0" &&
                        type == "Avariados") {
                      colheita!.damaged.text = "";
                    }
                  },
                  onTapOutside: (e) {
                    if (colheita!.netQuantity.text.isEmpty &&
                        type == "QttLiquida") {
                      colheita!.netQuantity.text = "0.0";
                    } else if (colheita!.moisture.text.isEmpty &&
                        type == "Umidade") {
                      colheita!.moisture.text = "0.0";
                    } else if (colheita!.impurity.text.isEmpty &&
                        type == "Impurezas") {
                      colheita!.impurity.text = "0.0";
                    } else if (colheita!.damaged.text.isEmpty &&
                        type == "Avariados") {
                      colheita!.damaged.text = "0.0";
                    }
                  },
                  // onEditingComplete: () {
                  //   if (colheita!.netQuantity.text.isEmpty &&
                  //       type == "QttLiquida") {
                  //     colheita!.netQuantity.text = "0.0";
                  //   } else if (colheita!.moisture.text.isEmpty &&
                  //       type == "Umidade") {
                  //     colheita!.moisture.text = "0.0";
                  //   } else if (colheita!.impurity.text.isEmpty &&
                  //       type == "Impurezas") {
                  //     colheita!.impurity.text = "0.0";
                  //   } else if (colheita!.damaged.text.isEmpty &&
                  //       type == "Avariados") {
                  //     colheita!.damaged.text = "0.0";
                  //   }
                  // },
                  // onSaved: (e) {
                  //   if (colheita!.netQuantity.text.isEmpty &&
                  //       type == "QttLiquida") {
                  //     colheita!.netQuantity.text = "0.0";
                  //   } else if (colheita!.moisture.text.isEmpty &&
                  //       type == "Umidade") {
                  //     colheita!.moisture.text = "0.0";
                  //   } else if (colheita!.impurity.text.isEmpty &&
                  //       type == "Impurezas") {
                  //     colheita!.impurity.text = "0.0";
                  //   } else if (colheita!.damaged.text.isEmpty &&
                  //       type == "Avariados") {
                  //     colheita!.damaged.text = "0.0";
                  //   }
                  // },
                  onChanged: (c) {
                    if (colheita!.netQuantity.text.isNotEmpty &&
                        colheita!.impurity.text.isNotEmpty &&
                        colheita!.moisture.text.isNotEmpty &&
                        colheita!.damaged.text.isNotEmpty) {
                      try {
                        colheita!.classifiedQttKg =
                            double.parse(colheita!.netQuantity.text) -
                                double.parse(colheita!.impurity.text) -
                                double.parse(colheita!.damaged.text) -
                                double.parse(colheita!.moisture.text);
                        colheita!.classifiedQttBags = double.parse(
                            (colheita!.classifiedQttKg / kgInBag).round().toString());
                        if (double.parse(colheita!.netQuantity.text) > 0 &&
                            colheita!.classifiedQttKg > 0 &&
                            double.parse(colheita!.netQuantity.text) >=
                                colheita!.classifiedQttKg) {
                          colheita!.setDifPerc(double.parse(
                              (((double.parse(colheita!.netQuantity.text) -
                                              colheita!.classifiedQttKg) /
                                          double.parse(
                                              colheita!.netQuantity.text)) *
                                      100)
                                  .toStringAsFixed(2)));
                        } else {
                          colheita!.setDifPerc(0);
                        }
                      } catch (e) {
                        throw Exception(e);
                      }
                    }
                  },
                )),
    );
  }
}
