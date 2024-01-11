import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../controllers/products/products_controller.dart';
import '../../../../controllers/products/seleceted_category_controller.dart';

// ignore: must_be_immutable
class ContainerSelectedInfo extends HookConsumerWidget {
  ContainerSelectedInfo({
    Key? key,
    this.len,
    required this.selectedCategory,
    required this.info,
    required this.product,
    required this.report,
  }) : super(key: key);

  final String info;
  final double? len;
  final ProductsController product;
  final SelectedCategoryController selectedCategory;
  bool report = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        product.resetControllers();
        if (!report) {
          selectedCategory.resetControllers();
          if (info == "ADUBOS") {
            selectedCategory.setAdubos();
          } else if (info == "SEMENTES") {
            selectedCategory.setSementes();
          } else if (info == "INSETICIDAS") {
            selectedCategory.setInseticidas();
          } else if (info == "HERBICIDAS") {
            selectedCategory.setHerbicidas();
          } else if (info == "FUNGICIDAS") {
            selectedCategory.setFungicidas();
          } else if (info == "ADJUVANTES") {
            selectedCategory.setAdjuvantes();
          } else if (info == "INOCULANTES E OUTROS") {
            selectedCategory.setInoculantes();
          } else if (info == "DIESEL") {
            selectedCategory.setDiesel();
          } else if (info == "FERT. FOL.") {
            selectedCategory.setFertilizantesFoliares();
          }
        } else {
          if (info == "ADUBOS") {
            selectedCategory.toggleAdubos();
          } else if (info == "SEMENTES") {
            selectedCategory.toggleSementes();
          } else if (info == "INSETICIDAS") {
            selectedCategory.toggleInseticidas();
          } else if (info == "HERBICIDAS") {
            selectedCategory.toggleHerbicidas();
          } else if (info == "FUNGICIDAS") {
            selectedCategory.toggleFungicidas();
          } else if (info == "ADJUVANTES") {
            selectedCategory.toggleAdjuvantes();
          } else if (info == "INOCULANTES E OUTROS") {
            selectedCategory.toggleInoculantes();
          } else if (info == "DIESEL") {
            selectedCategory.toggleDiesel();
          } else if (info == "FERT. FOL." || info == "FERTILIZANTES FOLIARES") {
            selectedCategory.toggleFertilizantesFoliares();
          }
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        width: len ?? 130,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            info,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
