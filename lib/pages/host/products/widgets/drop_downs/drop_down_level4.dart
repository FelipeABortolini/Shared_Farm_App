import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flv_farm/controllers/products/add_level_controller.dart';
import 'package:universal_io/io.dart';

import '../../../../../controllers/category_models/category_model.dart';
import '../../../../../controllers/products/products_controller.dart';
import '../../utils/filter_sons.dart';

Widget DropDownLevel4(
  List<Map<String, dynamic>> nivel,
  String? selected,
  CategoryModel model,
  String? dadSelected,
  bool visible,
  AddLevelController level,
  ProductsController product,
  bool edit,
  bool culture,
  bool input,
) {
  return Visibility(
    visible: visible,
    child: Padding(
      padding: Platform.isAndroid ? const EdgeInsets.symmetric(horizontal: 10) : const EdgeInsets.symmetric(horizontal: 450),
      child: Column(
        children: [
          const SizedBox(height: 10),
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField2(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              isExpanded: true,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 30,
              buttonHeight: 50,
              buttonPadding: const EdgeInsets.only(left: 20, right: 10),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              hint: const Text(
                'Escolha',
                style: TextStyle(fontSize: 14),
              ),
              items: nivel
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item["code"].toString(),
                      child: Text(
                        "${item["code"].toString()} - ${item["name"].toString()}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  )
                  .toList(),
              value: selected,
              onChanged: (value) {
                level.setLevel(4);
                model.setSelectedNivel4(value);
                model.resetUp5();
                filterSons(model, 5);
                model.setLastSelected(value);
                if (edit) {
                  for (var prod in nivel) {
                    if (prod["code"] == value) {
                      product.setName(prod["name"]);
                      product.setCode(prod["code"]);
                      product.setQuantity(prod["quantity"].toString());
                      product.setUnity(prod["unity"]);
                    }
                  }
                }
                if (culture) {
                  for (var prod in nivel) {
                    if (prod["code"] == value) {
                      product.setCode(prod["code"]);
                      product.setCategory(prod["category"]);
                      product.setUnity(prod["unity"]);
                      product.setPrevQuantity(double.parse(prod["quantity"].toString()));
                      product.setDad(prod["dad"]);
                      product.setName(prod["name"]);
                    }
                  }
                }
                if (input) {
                  for (var prod in nivel) {
                    if (prod["code"] == value) {
                      product.setPrevQuantity(double.parse(prod["quantity"].toString()));
                      product.setDad(prod["dad"]);
                      product.setUnity(prod["unity"]);
                      product.setName(prod["name"]);
                    }
                  }
                }
              },
              buttonWidth: 150,
              itemHeight: 50,
            ),
          ),
        ],
      ),
    ),
  );
}
