import 'package:flutter/material.dart';

import '../../../../../../controllers/products/add_level_controller.dart';

import '../../../../../../controllers/category_models/fungicidas_controller.dart';
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

class DropDownFungicidasSequence extends StatelessWidget {
  final FungicidasController fungicidas;
  final AddLevelController addLev;
  final ProductsController product;
  final bool edit;
  final bool culture;
  final bool input;

  const DropDownFungicidasSequence({
    super.key,
    required this.fungicidas,
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
        fungicidas.nivel1,
        fungicidas.selectedNivel1,
        fungicidas,
        null,
        true,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel2(
        fungicidas.filteredNivel2,
        fungicidas.selectedNivel2,
        fungicidas,
        fungicidas.selectedNivel1,
        fungicidas.filteredNivel2.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel3(
        fungicidas.filteredNivel3,
        fungicidas.selectedNivel3,
        fungicidas,
        fungicidas.selectedNivel2,
        fungicidas.filteredNivel3.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel4(
        fungicidas.filteredNivel4,
        fungicidas.selectedNivel4,
        fungicidas,
        fungicidas.selectedNivel3,
        fungicidas.filteredNivel4.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel5(
        fungicidas.filteredNivel5,
        fungicidas.selectedNivel5,
        fungicidas,
        fungicidas.selectedNivel4,
        fungicidas.filteredNivel5.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel6(
        fungicidas.filteredNivel6,
        fungicidas.selectedNivel6,
        fungicidas,
        fungicidas.selectedNivel5,
        fungicidas.filteredNivel6.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel7(
        fungicidas.filteredNivel7,
        fungicidas.selectedNivel7,
        fungicidas,
        fungicidas.selectedNivel6,
        fungicidas.filteredNivel7.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel8(
        fungicidas.filteredNivel8,
        fungicidas.selectedNivel8,
        fungicidas,
        fungicidas.selectedNivel7,
        fungicidas.filteredNivel8.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel9(
        fungicidas.filteredNivel9,
        fungicidas.selectedNivel9,
        fungicidas,
        fungicidas.selectedNivel8,
        fungicidas.filteredNivel9.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel10(
        fungicidas.filteredNivel10,
        fungicidas.selectedNivel10,
        fungicidas,
        fungicidas.selectedNivel9,
        fungicidas.filteredNivel10.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
    ]);
  }
}
