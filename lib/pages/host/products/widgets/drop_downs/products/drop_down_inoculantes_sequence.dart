import 'package:flutter/material.dart';

import '../../../../../../controllers/products/add_level_controller.dart';

import '../../../../../../controllers/category_models/inoculantes_controller.dart';
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

class DropDownInoculantesSequence extends StatelessWidget {
  final InoculantesController inoculantes;
  final AddLevelController addLev;
  final ProductsController product;
  final bool edit;
  final bool culture;
  final bool input;

  const DropDownInoculantesSequence({
    super.key,
    required this.inoculantes,
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
        inoculantes.nivel1,
        inoculantes.selectedNivel1,
        inoculantes,
        null,
        true,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel2(
        inoculantes.filteredNivel2,
        inoculantes.selectedNivel2,
        inoculantes,
        inoculantes.selectedNivel1,
        inoculantes.filteredNivel2.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel3(
        inoculantes.filteredNivel3,
        inoculantes.selectedNivel3,
        inoculantes,
        inoculantes.selectedNivel2,
        inoculantes.filteredNivel3.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel4(
        inoculantes.filteredNivel4,
        inoculantes.selectedNivel4,
        inoculantes,
        inoculantes.selectedNivel3,
        inoculantes.filteredNivel4.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel5(
        inoculantes.filteredNivel5,
        inoculantes.selectedNivel5,
        inoculantes,
        inoculantes.selectedNivel4,
        inoculantes.filteredNivel5.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel6(
        inoculantes.filteredNivel6,
        inoculantes.selectedNivel6,
        inoculantes,
        inoculantes.selectedNivel5,
        inoculantes.filteredNivel6.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel7(
        inoculantes.filteredNivel7,
        inoculantes.selectedNivel7,
        inoculantes,
        inoculantes.selectedNivel6,
        inoculantes.filteredNivel7.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel8(
        inoculantes.filteredNivel8,
        inoculantes.selectedNivel8,
        inoculantes,
        inoculantes.selectedNivel7,
        inoculantes.filteredNivel8.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel9(
        inoculantes.filteredNivel9,
        inoculantes.selectedNivel9,
        inoculantes,
        inoculantes.selectedNivel8,
        inoculantes.filteredNivel9.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel10(
        inoculantes.filteredNivel10,
        inoculantes.selectedNivel10,
        inoculantes,
        inoculantes.selectedNivel9,
        inoculantes.filteredNivel10.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
    ]);
  }
}
