import 'package:flutter/material.dart';

import '../../../../../../controllers/products/add_level_controller.dart';

import '../../../../../../controllers/category_models/inseticidas_controller.dart';
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

class DropDownInseticidasSequence extends StatelessWidget {
  final InseticidasController inseticidas;
  final AddLevelController addLev;
  final ProductsController product;
  final bool edit;
  final bool culture;
  final bool input;

  const DropDownInseticidasSequence({
    super.key,
    required this.inseticidas,
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
        inseticidas.nivel1,
        inseticidas.selectedNivel1,
        inseticidas,
        null,
        true,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel2(
        inseticidas.filteredNivel2,
        inseticidas.selectedNivel2,
        inseticidas,
        inseticidas.selectedNivel1,
        inseticidas.filteredNivel2.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel3(
        inseticidas.filteredNivel3,
        inseticidas.selectedNivel3,
        inseticidas,
        inseticidas.selectedNivel2,
        inseticidas.filteredNivel3.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel4(
        inseticidas.filteredNivel4,
        inseticidas.selectedNivel4,
        inseticidas,
        inseticidas.selectedNivel3,
        inseticidas.filteredNivel4.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel5(
        inseticidas.filteredNivel5,
        inseticidas.selectedNivel5,
        inseticidas,
        inseticidas.selectedNivel4,
        inseticidas.filteredNivel5.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel6(
        inseticidas.filteredNivel6,
        inseticidas.selectedNivel6,
        inseticidas,
        inseticidas.selectedNivel5,
        inseticidas.filteredNivel6.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel7(
        inseticidas.filteredNivel7,
        inseticidas.selectedNivel7,
        inseticidas,
        inseticidas.selectedNivel6,
        inseticidas.filteredNivel7.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel8(
        inseticidas.filteredNivel8,
        inseticidas.selectedNivel8,
        inseticidas,
        inseticidas.selectedNivel7,
        inseticidas.filteredNivel8.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel9(
        inseticidas.filteredNivel9,
        inseticidas.selectedNivel9,
        inseticidas,
        inseticidas.selectedNivel8,
        inseticidas.filteredNivel9.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel10(
        inseticidas.filteredNivel10,
        inseticidas.selectedNivel10,
        inseticidas,
        inseticidas.selectedNivel9,
        inseticidas.filteredNivel10.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
    ]);
  }
}
