import 'package:flutter/material.dart';

import '../../../../../../controllers/products/add_level_controller.dart';

import '../../../../../../controllers/category_models/diesel_controller.dart';
import '../../../../../../controllers/products/products_controller.dart';
import '../drop_down_level1.dart';
import '../drop_down_level10.dart';
import '../drop_down_level2.dart';
import '../drop_down_level3.dart';
import '../drop_down_level4.dart';
import '../drop_down_level5.dart';
import '../drop_down_level6.dart';
import '../drop_down_level7.dart';
import '../drop_down_level8.dart';
import '../drop_down_level9.dart';

class DropDownDieselSequence extends StatelessWidget {
  final DieselController diesel;
  final AddLevelController addLev;
  final ProductsController product;
  final bool edit;
  final bool culture;
  final bool input;

  const DropDownDieselSequence({
    super.key,
    required this.diesel,
    required this.addLev,
    required this.product,
    required this.edit,
    required this.culture,
    required this.input,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DropDownLevel1(
        diesel.nivel1,
        diesel.selectedNivel1,
        diesel,
        null,
        true,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel2(
        diesel.filteredNivel2,
        diesel.selectedNivel2,
        diesel,
        diesel.selectedNivel1,
        diesel.filteredNivel2.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel3(
        diesel.filteredNivel3,
        diesel.selectedNivel3,
        diesel,
        diesel.selectedNivel2,
        diesel.filteredNivel3.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel4(
        diesel.filteredNivel4,
        diesel.selectedNivel4,
        diesel,
        diesel.selectedNivel3,
        diesel.filteredNivel4.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel5(
        diesel.filteredNivel5,
        diesel.selectedNivel5,
        diesel,
        diesel.selectedNivel4,
        diesel.filteredNivel5.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel6(
        diesel.filteredNivel6,
        diesel.selectedNivel6,
        diesel,
        diesel.selectedNivel5,
        diesel.filteredNivel6.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel7(
        diesel.filteredNivel7,
        diesel.selectedNivel7,
        diesel,
        diesel.selectedNivel6,
        diesel.filteredNivel7.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel8(
        diesel.filteredNivel8,
        diesel.selectedNivel8,
        diesel,
        diesel.selectedNivel7,
        diesel.filteredNivel8.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel9(
        diesel.filteredNivel9,
        diesel.selectedNivel9,
        diesel,
        diesel.selectedNivel8,
        diesel.filteredNivel9.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel10(
        diesel.filteredNivel10,
        diesel.selectedNivel10,
        diesel,
        diesel.selectedNivel9,
        diesel.filteredNivel10.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
    ]);
  }
}
