import 'package:flutter/material.dart';

import '../../../../../../controllers/products/add_level_controller.dart';

import '../../../../../../controllers/category_models/sementes_controller.dart';
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

class DropDownSementesSequence extends StatelessWidget {
  final SementesController sementes;
  final AddLevelController addLev;
  final ProductsController product;
  final bool edit;
  final bool culture;
  final bool input;

  const DropDownSementesSequence({
    super.key,
    required this.sementes,
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
        sementes.nivel1,
        sementes.selectedNivel1,
        sementes,
        null,
        true,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel2(
        sementes.filteredNivel2,
        sementes.selectedNivel2,
        sementes,
        sementes.selectedNivel1,
        sementes.filteredNivel2.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel3(
        sementes.filteredNivel3,
        sementes.selectedNivel3,
        sementes,
        sementes.selectedNivel2,
        sementes.filteredNivel3.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel4(
        sementes.filteredNivel4,
        sementes.selectedNivel4,
        sementes,
        sementes.selectedNivel3,
        sementes.filteredNivel4.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel5(
        sementes.filteredNivel5,
        sementes.selectedNivel5,
        sementes,
        sementes.selectedNivel4,
        sementes.filteredNivel5.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel6(
        sementes.filteredNivel6,
        sementes.selectedNivel6,
        sementes,
        sementes.selectedNivel5,
        sementes.filteredNivel6.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel7(
        sementes.filteredNivel7,
        sementes.selectedNivel7,
        sementes,
        sementes.selectedNivel6,
        sementes.filteredNivel7.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel8(
        sementes.filteredNivel8,
        sementes.selectedNivel8,
        sementes,
        sementes.selectedNivel7,
        sementes.filteredNivel8.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel9(
        sementes.filteredNivel9,
        sementes.selectedNivel9,
        sementes,
        sementes.selectedNivel8,
        sementes.filteredNivel9.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
      DropDownLevel10(
        sementes.filteredNivel10,
        sementes.selectedNivel10,
        sementes,
        sementes.selectedNivel9,
        sementes.filteredNivel10.isNotEmpty,
        addLev,
        product,
        edit,
        culture,
        input,
      ),
    ]);
  }
}
