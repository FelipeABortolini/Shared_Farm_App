import 'package:flutter/material.dart';

import '../../../../../../controllers/products/add_level_controller.dart';

import '../../../../../../controllers/category_models/fertilizantes_foliares_controller.dart';
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

class DropDownFertilizantesFoliaresSequence extends StatelessWidget {
  final FertilizantesFoliaresController fertilizantesFoliares;
  final AddLevelController addLev;
  final ProductsController product;
  final bool edit;
  final bool culture;
  final bool input;

  const DropDownFertilizantesFoliaresSequence({
    super.key,
    required this.fertilizantesFoliares,
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
        fertilizantesFoliares.nivel1,
        fertilizantesFoliares.selectedNivel1,
        fertilizantesFoliares,
        null,
        true,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel2(
        fertilizantesFoliares.filteredNivel2,
        fertilizantesFoliares.selectedNivel2,
        fertilizantesFoliares,
        fertilizantesFoliares.selectedNivel1,
        fertilizantesFoliares.filteredNivel2.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel3(
        fertilizantesFoliares.filteredNivel3,
        fertilizantesFoliares.selectedNivel3,
        fertilizantesFoliares,
        fertilizantesFoliares.selectedNivel2,
        fertilizantesFoliares.filteredNivel3.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel4(
        fertilizantesFoliares.filteredNivel4,
        fertilizantesFoliares.selectedNivel4,
        fertilizantesFoliares,
        fertilizantesFoliares.selectedNivel3,
        fertilizantesFoliares.filteredNivel4.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel5(
        fertilizantesFoliares.filteredNivel5,
        fertilizantesFoliares.selectedNivel5,
        fertilizantesFoliares,
        fertilizantesFoliares.selectedNivel4,
        fertilizantesFoliares.filteredNivel5.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel6(
        fertilizantesFoliares.filteredNivel6,
        fertilizantesFoliares.selectedNivel6,
        fertilizantesFoliares,
        fertilizantesFoliares.selectedNivel5,
        fertilizantesFoliares.filteredNivel6.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel7(
        fertilizantesFoliares.filteredNivel7,
        fertilizantesFoliares.selectedNivel7,
        fertilizantesFoliares,
        fertilizantesFoliares.selectedNivel6,
        fertilizantesFoliares.filteredNivel7.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel8(
        fertilizantesFoliares.filteredNivel8,
        fertilizantesFoliares.selectedNivel8,
        fertilizantesFoliares,
        fertilizantesFoliares.selectedNivel7,
        fertilizantesFoliares.filteredNivel8.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel9(
        fertilizantesFoliares.filteredNivel9,
        fertilizantesFoliares.selectedNivel9,
        fertilizantesFoliares,
        fertilizantesFoliares.selectedNivel8,
        fertilizantesFoliares.filteredNivel9.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel10(
        fertilizantesFoliares.filteredNivel10,
        fertilizantesFoliares.selectedNivel10,
        fertilizantesFoliares,
        fertilizantesFoliares.selectedNivel9,
        fertilizantesFoliares.filteredNivel10.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
    ]);
  }
}
