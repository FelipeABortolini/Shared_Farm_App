import 'package:flutter/material.dart';
import 'package:flv_farm/controllers/products/products_controller.dart';

import '../../../../../../controllers/products/add_level_controller.dart';

import '../../../../../../controllers/category_models/adubos_controller.dart';
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

class DropDownAdubosSequence extends StatelessWidget {
  final AdubosController adubos;
  final AddLevelController addLev;
  final ProductsController product;
  final bool edit;
  final bool culture;
  final bool input;

  const DropDownAdubosSequence({
    super.key,
    required this.adubos,
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
        adubos.nivel1,
        adubos.selectedNivel1,
        adubos,
        null,
        true,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel2(
        adubos.filteredNivel2,
        adubos.selectedNivel2,
        adubos,
        adubos.selectedNivel1,
        adubos.filteredNivel2.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel3(
        adubos.filteredNivel3,
        adubos.selectedNivel3,
        adubos,
        adubos.selectedNivel2,
        adubos.filteredNivel3.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel4(
        adubos.filteredNivel4,
        adubos.selectedNivel4,
        adubos,
        adubos.selectedNivel3,
        adubos.filteredNivel4.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel5(
        adubos.filteredNivel5,
        adubos.selectedNivel5,
        adubos,
        adubos.selectedNivel4,
        adubos.filteredNivel5.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel6(
        adubos.filteredNivel6,
        adubos.selectedNivel6,
        adubos,
        adubos.selectedNivel5,
        adubos.filteredNivel6.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel7(
        adubos.filteredNivel7,
        adubos.selectedNivel7,
        adubos,
        adubos.selectedNivel6,
        adubos.filteredNivel7.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel8(
        adubos.filteredNivel8,
        adubos.selectedNivel8,
        adubos,
        adubos.selectedNivel7,
        adubos.filteredNivel8.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel9(
        adubos.filteredNivel9,
        adubos.selectedNivel9,
        adubos,
        adubos.selectedNivel8,
        adubos.filteredNivel9.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel10(
        adubos.filteredNivel10,
        adubos.selectedNivel10,
        adubos,
        adubos.selectedNivel9,
        adubos.filteredNivel10.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
    ]);
  }
}
