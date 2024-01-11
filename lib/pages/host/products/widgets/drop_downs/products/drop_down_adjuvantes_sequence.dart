import 'package:flutter/material.dart';

import '../../../../../../controllers/products/add_level_controller.dart';

import '../../../../../../controllers/category_models/adjuvantes_controller.dart';
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

class DropDownAdjuvantesSequence extends StatelessWidget {
  final AdjuvantesController adjuvantes;
  final AddLevelController addLev;
  final ProductsController product;
  final bool edit;
  final bool culture;
  final bool input;

  const DropDownAdjuvantesSequence({
    super.key,
    required this.adjuvantes,
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
        adjuvantes.nivel1,
        adjuvantes.selectedNivel1,
        adjuvantes,
        null,
        true,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel2(
        adjuvantes.filteredNivel2,
        adjuvantes.selectedNivel2,
        adjuvantes,
        adjuvantes.selectedNivel1,
        adjuvantes.filteredNivel2.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel3(
        adjuvantes.filteredNivel3,
        adjuvantes.selectedNivel3,
        adjuvantes,
        adjuvantes.selectedNivel2,
        adjuvantes.filteredNivel3.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel4(
        adjuvantes.filteredNivel4,
        adjuvantes.selectedNivel4,
        adjuvantes,
        adjuvantes.selectedNivel3,
        adjuvantes.filteredNivel4.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel5(
        adjuvantes.filteredNivel5,
        adjuvantes.selectedNivel5,
        adjuvantes,
        adjuvantes.selectedNivel4,
        adjuvantes.filteredNivel5.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel6(
        adjuvantes.filteredNivel6,
        adjuvantes.selectedNivel6,
        adjuvantes,
        adjuvantes.selectedNivel5,
        adjuvantes.filteredNivel6.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel7(
        adjuvantes.filteredNivel7,
        adjuvantes.selectedNivel7,
        adjuvantes,
        adjuvantes.selectedNivel6,
        adjuvantes.filteredNivel7.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel8(
        adjuvantes.filteredNivel8,
        adjuvantes.selectedNivel8,
        adjuvantes,
        adjuvantes.selectedNivel7,
        adjuvantes.filteredNivel8.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel9(
        adjuvantes.filteredNivel9,
        adjuvantes.selectedNivel9,
        adjuvantes,
        adjuvantes.selectedNivel8,
        adjuvantes.filteredNivel9.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel10(
        adjuvantes.filteredNivel10,
        adjuvantes.selectedNivel10,
        adjuvantes,
        adjuvantes.selectedNivel9,
        adjuvantes.filteredNivel10.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
    ]);
  }
}
