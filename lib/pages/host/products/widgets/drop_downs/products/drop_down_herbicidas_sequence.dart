import 'package:flutter/material.dart';

import '../../../../../../controllers/products/add_level_controller.dart';

import '../../../../../../controllers/category_models/herbicidas_controller.dart';
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

class DropDownHerbicidasSequence extends StatelessWidget {
  final HerbicidasController herbicidas;
  final AddLevelController addLev;
  final ProductsController product;
  final bool edit;
  final bool culture;
  final bool input;

  const DropDownHerbicidasSequence({
    super.key,
    required this.herbicidas,
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
        herbicidas.nivel1,
        herbicidas.selectedNivel1,
        herbicidas,
        null,
        true,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel2(
        herbicidas.filteredNivel2,
        herbicidas.selectedNivel2,
        herbicidas,
        herbicidas.selectedNivel1,
        herbicidas.filteredNivel2.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel3(
        herbicidas.filteredNivel3,
        herbicidas.selectedNivel3,
        herbicidas,
        herbicidas.selectedNivel2,
        herbicidas.filteredNivel3.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel4(
        herbicidas.filteredNivel4,
        herbicidas.selectedNivel4,
        herbicidas,
        herbicidas.selectedNivel3,
        herbicidas.filteredNivel4.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel5(
        herbicidas.filteredNivel5,
        herbicidas.selectedNivel5,
        herbicidas,
        herbicidas.selectedNivel4,
        herbicidas.filteredNivel5.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel6(
        herbicidas.filteredNivel6,
        herbicidas.selectedNivel6,
        herbicidas,
        herbicidas.selectedNivel5,
        herbicidas.filteredNivel6.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel7(
        herbicidas.filteredNivel7,
        herbicidas.selectedNivel7,
        herbicidas,
        herbicidas.selectedNivel6,
        herbicidas.filteredNivel7.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel8(
        herbicidas.filteredNivel8,
        herbicidas.selectedNivel8,
        herbicidas,
        herbicidas.selectedNivel7,
        herbicidas.filteredNivel8.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel9(
        herbicidas.filteredNivel9,
        herbicidas.selectedNivel9,
        herbicidas,
        herbicidas.selectedNivel8,
        herbicidas.filteredNivel9.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel10(
        herbicidas.filteredNivel10,
        herbicidas.selectedNivel10,
        herbicidas,
        herbicidas.selectedNivel9,
        herbicidas.filteredNivel10.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
    ]);
  }
}
