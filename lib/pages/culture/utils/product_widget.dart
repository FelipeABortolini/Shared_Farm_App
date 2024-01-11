import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:universal_io/io.dart';

import '../../../controllers/products/add_level_controller.dart';
import '../../../controllers/culture/amount_products_controller.dart';
import '../../../controllers/category_models/fertilizantes_foliares_controller.dart';
import '../../../controllers/category_models/adjuvantes_controller.dart';
import '../../../controllers/category_models/adubos_controller.dart';
import '../../../controllers/category_models/diesel_controller.dart';
import '../../../controllers/category_models/fungicidas_controller.dart';
import '../../../controllers/category_models/herbicidas_controller.dart';
import '../../../controllers/category_models/inoculantes_controller.dart';
import '../../../controllers/category_models/inseticidas_controller.dart';
import '../../../controllers/category_models/sementes_controller.dart';
import '../../../controllers/culture/culture_controller.dart';
import '../../../controllers/products/products_controller.dart';
import '../../../controllers/products/seleceted_category_controller.dart';
import '../../../providers/providers.dart';
import '../../../shared/input.dart';
import '../../host/products/widgets/drop_downs/products/drop_down_diesel_sequence.dart';
import '../../host/products/widgets/drop_downs/products/drop_down_fertilizantes_foliares_sequence.dart';
import '../../host/products/widgets/drop_downs/products/drop_down_inoculantes_sequence.dart';
import '../../host/products/widgets/container_selected_info.dart';

import '../../host/products/widgets/drop_downs/products/drop_down_adjuvantes_sequence.dart';
import '../../host/products/widgets/drop_downs/products/drop_down_adubos_sequence.dart';
import '../../host/products/widgets/drop_downs/products/drop_down_fungicidas_sequence.dart';
import '../../host/products/widgets/drop_downs/products/drop_down_herbicidas_sequence.dart';
import '../../host/products/widgets/drop_downs/products/drop_down_inseticidas_sequence.dart';
import '../../host/products/widgets/drop_downs/products/drop_down_sementes_sequence.dart';
import 'update_prods_after_exclude.dart';
import 'update_to_recipe.dart';

// ignore: must_be_immutable
class ProductWidget extends HookConsumerWidget {
  ProductWidget({
    super.key,
    required this.prod,
    required this.num,
    required this.product,
    required this.prod1,
    required this.prod2,
    required this.prod3,
    required this.prod4,
    required this.prod5,
    required this.prod6,
    required this.prod7,
    required this.prod8,
    required this.prod9,
    required this.prod10,
    required this.selectedCategory,
    required this.selectedCategory1,
    required this.selectedCategory2,
    required this.selectedCategory3,
    required this.selectedCategory4,
    required this.selectedCategory5,
    required this.selectedCategory6,
    required this.selectedCategory7,
    required this.selectedCategory8,
    required this.selectedCategory9,
    required this.selectedCategory10,
    required this.adubos1,
    required this.adubos2,
    required this.adubos3,
    required this.adubos4,
    required this.adubos5,
    required this.adubos6,
    required this.adubos7,
    required this.adubos8,
    required this.adubos9,
    required this.sementes1,
    required this.sementes2,
    required this.sementes3,
    required this.sementes4,
    required this.sementes5,
    required this.sementes6,
    required this.sementes7,
    required this.sementes8,
    required this.sementes9,
    required this.inseticidas1,
    required this.inseticidas2,
    required this.inseticidas3,
    required this.inseticidas4,
    required this.inseticidas5,
    required this.inseticidas6,
    required this.inseticidas7,
    required this.inseticidas8,
    required this.inseticidas9,
    required this.herbicidas1,
    required this.herbicidas2,
    required this.herbicidas3,
    required this.herbicidas4,
    required this.herbicidas5,
    required this.herbicidas6,
    required this.herbicidas7,
    required this.herbicidas8,
    required this.herbicidas9,
    required this.fungicidas1,
    required this.fungicidas2,
    required this.fungicidas3,
    required this.fungicidas4,
    required this.fungicidas5,
    required this.fungicidas6,
    required this.fungicidas7,
    required this.fungicidas8,
    required this.fungicidas9,
    required this.adjuvantes1,
    required this.adjuvantes2,
    required this.adjuvantes3,
    required this.adjuvantes4,
    required this.adjuvantes5,
    required this.adjuvantes6,
    required this.adjuvantes7,
    required this.adjuvantes8,
    required this.adjuvantes9,
    required this.inoculantes1,
    required this.inoculantes2,
    required this.inoculantes3,
    required this.inoculantes4,
    required this.inoculantes5,
    required this.inoculantes6,
    required this.inoculantes7,
    required this.inoculantes8,
    required this.inoculantes9,
    required this.diesel1,
    required this.diesel2,
    required this.diesel3,
    required this.diesel4,
    required this.diesel5,
    required this.diesel6,
    required this.diesel7,
    required this.diesel8,
    required this.diesel9,
    required this.fertilizantesFoliares1,
    required this.fertilizantesFoliares2,
    required this.fertilizantesFoliares3,
    required this.fertilizantesFoliares4,
    required this.fertilizantesFoliares5,
    required this.fertilizantesFoliares6,
    required this.fertilizantesFoliares7,
    required this.fertilizantesFoliares8,
    required this.fertilizantesFoliares9,
    required this.adubos,
    required this.sementes,
    required this.inseticidas,
    required this.herbicidas,
    required this.fungicidas,
    required this.adjuvantes,
    required this.inoculantes,
    required this.diesel,
    required this.fertilizantesFoliares,
    required this.addLev,
    this.culture,
    this.isCulture,
    this.amount,
    this.recipe,
  });

  String prod;
  int num;
  bool? isCulture;
  ProductsController product;
  ProductsController prod1;
  ProductsController prod2;
  ProductsController prod3;
  ProductsController prod4;
  ProductsController prod5;
  ProductsController prod6;
  ProductsController prod7;
  ProductsController prod8;
  ProductsController prod9;
  ProductsController prod10;
  SelectedCategoryController selectedCategory;
  SelectedCategoryController selectedCategory1;
  SelectedCategoryController selectedCategory2;
  SelectedCategoryController selectedCategory3;
  SelectedCategoryController selectedCategory4;
  SelectedCategoryController selectedCategory5;
  SelectedCategoryController selectedCategory6;
  SelectedCategoryController selectedCategory7;
  SelectedCategoryController selectedCategory8;
  SelectedCategoryController selectedCategory9;
  SelectedCategoryController selectedCategory10;
  AdubosController adubos;
  SementesController sementes;
  InseticidasController inseticidas;
  HerbicidasController herbicidas;
  FungicidasController fungicidas;
  AdjuvantesController adjuvantes;
  InoculantesController inoculantes;
  DieselController diesel;
  FertilizantesFoliaresController fertilizantesFoliares;
  AddLevelController addLev;
  CultureController? culture;
  AmountProductsController? amount;
  bool? recipe;
  AdubosController adubos1;
  AdubosController adubos2;
  AdubosController adubos3;
  AdubosController adubos4;
  AdubosController adubos5;
  AdubosController adubos6;
  AdubosController adubos7;
  AdubosController adubos8;
  AdubosController adubos9;
  SementesController sementes1;
  SementesController sementes2;
  SementesController sementes3;
  SementesController sementes4;
  SementesController sementes5;
  SementesController sementes6;
  SementesController sementes7;
  SementesController sementes8;
  SementesController sementes9;
  InseticidasController inseticidas1;
  InseticidasController inseticidas2;
  InseticidasController inseticidas3;
  InseticidasController inseticidas4;
  InseticidasController inseticidas5;
  InseticidasController inseticidas6;
  InseticidasController inseticidas7;
  InseticidasController inseticidas8;
  InseticidasController inseticidas9;
  HerbicidasController herbicidas1;
  HerbicidasController herbicidas2;
  HerbicidasController herbicidas3;
  HerbicidasController herbicidas4;
  HerbicidasController herbicidas5;
  HerbicidasController herbicidas6;
  HerbicidasController herbicidas7;
  HerbicidasController herbicidas8;
  HerbicidasController herbicidas9;
  FungicidasController fungicidas1;
  FungicidasController fungicidas2;
  FungicidasController fungicidas3;
  FungicidasController fungicidas4;
  FungicidasController fungicidas5;
  FungicidasController fungicidas6;
  FungicidasController fungicidas7;
  FungicidasController fungicidas8;
  FungicidasController fungicidas9;
  AdjuvantesController adjuvantes1;
  AdjuvantesController adjuvantes2;
  AdjuvantesController adjuvantes3;
  AdjuvantesController adjuvantes4;
  AdjuvantesController adjuvantes5;
  AdjuvantesController adjuvantes6;
  AdjuvantesController adjuvantes7;
  AdjuvantesController adjuvantes8;
  AdjuvantesController adjuvantes9;
  InoculantesController inoculantes1;
  InoculantesController inoculantes2;
  InoculantesController inoculantes3;
  InoculantesController inoculantes4;
  InoculantesController inoculantes5;
  InoculantesController inoculantes6;
  InoculantesController inoculantes7;
  InoculantesController inoculantes8;
  InoculantesController inoculantes9;
  DieselController diesel1;
  DieselController diesel2;
  DieselController diesel3;
  DieselController diesel4;
  DieselController diesel5;
  DieselController diesel6;
  DieselController diesel7;
  DieselController diesel8;
  DieselController diesel9;
  FertilizantesFoliaresController fertilizantesFoliares1;
  FertilizantesFoliaresController fertilizantesFoliares2;
  FertilizantesFoliaresController fertilizantesFoliares3;
  FertilizantesFoliaresController fertilizantesFoliares4;
  FertilizantesFoliaresController fertilizantesFoliares5;
  FertilizantesFoliaresController fertilizantesFoliares6;
  FertilizantesFoliaresController fertilizantesFoliares7;
  FertilizantesFoliaresController fertilizantesFoliares8;
  FertilizantesFoliaresController fertilizantesFoliares9;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountProducts = ref.watch(amountProductsProvider);

    return Column(
      children: [
        const Divider(thickness: 2),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              prod,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // (amountProducts.amount == num && amountProducts.amount != 1)
            (amountProducts.amount != 1)
                ? IconButton(
                    splashRadius: 15,
                    color: Colors.red,
                    iconSize: 40,
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () async {
                      if (await confirm(
                        context,
                        title: const Text('Confirmação'),
                        content: Text('Deseja remover o produto $num?'),
                        textOK: const Text('Sim'),
                        textCancel: const Text('Não'),
                      )) {
                        amountProducts.setAmount(amountProducts.amount - 1);
                        selectedCategory.resetControllers();
                        adubos.resetAll();
                        adubos.resetNoSelection();
                        sementes.resetAll();
                        sementes.resetNoSelection();
                        inseticidas.resetAll();
                        inseticidas.resetNoSelection();
                        herbicidas.resetAll();
                        herbicidas.resetNoSelection();
                        fungicidas.resetAll();
                        fungicidas.resetNoSelection();
                        adjuvantes.resetAll();
                        adjuvantes.resetNoSelection();
                        inoculantes.resetAll();
                        inoculantes.resetNoSelection();
                        diesel.resetAll();
                        diesel.resetNoSelection();
                        fertilizantesFoliares.resetAll();
                        fertilizantesFoliares.resetNoSelection();
                        product.resetControllers();
                        updateProdsAfterExclude(
                          num,
                          prod1,
                          prod2,
                          prod3,
                          prod4,
                          prod5,
                          prod6,
                          prod7,
                          prod8,
                          prod9,
                          prod10,
                          selectedCategory1,
                          selectedCategory2,
                          selectedCategory3,
                          selectedCategory4,
                          selectedCategory5,
                          selectedCategory6,
                          selectedCategory7,
                          selectedCategory8,
                          selectedCategory9,
                          selectedCategory10,
                          adubos1,
                          adubos2,
                          adubos3,
                          adubos4,
                          adubos5,
                          adubos6,
                          adubos7,
                          adubos8,
                          adubos9,
                          sementes1,
                          sementes2,
                          sementes3,
                          sementes4,
                          sementes5,
                          sementes6,
                          sementes7,
                          sementes8,
                          sementes9,
                          inseticidas1,
                          inseticidas2,
                          inseticidas3,
                          inseticidas4,
                          inseticidas5,
                          inseticidas6,
                          inseticidas7,
                          inseticidas8,
                          inseticidas9,
                          herbicidas1,
                          herbicidas2,
                          herbicidas3,
                          herbicidas4,
                          herbicidas5,
                          herbicidas6,
                          herbicidas7,
                          herbicidas8,
                          herbicidas9,
                          fungicidas1,
                          fungicidas2,
                          fungicidas3,
                          fungicidas4,
                          fungicidas5,
                          fungicidas6,
                          fungicidas7,
                          fungicidas8,
                          fungicidas9,
                          adjuvantes1,
                          adjuvantes2,
                          adjuvantes3,
                          adjuvantes4,
                          adjuvantes5,
                          adjuvantes6,
                          adjuvantes7,
                          adjuvantes8,
                          adjuvantes9,
                          inoculantes1,
                          inoculantes2,
                          inoculantes3,
                          inoculantes4,
                          inoculantes5,
                          inoculantes6,
                          inoculantes7,
                          inoculantes8,
                          inoculantes9,
                          diesel1,
                          diesel2,
                          diesel3,
                          diesel4,
                          diesel5,
                          diesel6,
                          diesel7,
                          diesel8,
                          diesel9,
                          fertilizantesFoliares1,
                          fertilizantesFoliares2,
                          fertilizantesFoliares3,
                          fertilizantesFoliares4,
                          fertilizantesFoliares5,
                          fertilizantesFoliares6,
                          fertilizantesFoliares7,
                          fertilizantesFoliares8,
                          fertilizantesFoliares9,
                        );
                      }
                    },
                  )
                : const SizedBox(),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedCategory.adubos
                ? Opacity(
                    opacity: 1,
                    child: ContainerSelectedInfo(
                      selectedCategory: selectedCategory,
                      info: "ADUBOS",
                      product: product,
                      report: false,
                    ),
                  )
                : Opacity(
                    opacity: 0.35,
                    child: ContainerSelectedInfo(
                      selectedCategory: selectedCategory,
                      info: "ADUBOS",
                      product: product,
                      report: false,
                    ),
                  ),
            const SizedBox(width: 5),
            selectedCategory.sementes
                ? Opacity(
                    opacity: 1,
                    child: ContainerSelectedInfo(
                      selectedCategory: selectedCategory,
                      info: "SEMENTES",
                      product: product,
                      report: false,
                    ),
                  )
                : Opacity(
                    opacity: 0.35,
                    child: ContainerSelectedInfo(
                      selectedCategory: selectedCategory,
                      info: "SEMENTES",
                      product: product,
                      report: false,
                    ),
                  ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedCategory.inseticidas
                ? Opacity(
                    opacity: 1,
                    child: ContainerSelectedInfo(
                      selectedCategory: selectedCategory,
                      info: "INSETICIDAS",
                      product: product,
                      report: false,
                    ),
                  )
                : Opacity(
                    opacity: 0.35,
                    child: ContainerSelectedInfo(
                      selectedCategory: selectedCategory,
                      info: "INSETICIDAS",
                      product: product,
                      report: false,
                    ),
                  ),
            const SizedBox(width: 5),
            selectedCategory.herbicidas
                ? Opacity(
                    opacity: 1,
                    child: ContainerSelectedInfo(
                      selectedCategory: selectedCategory,
                      info: "HERBICIDAS",
                      product: product,
                      report: false,
                    ),
                  )
                : Opacity(
                    opacity: 0.35,
                    child: ContainerSelectedInfo(
                      selectedCategory: selectedCategory,
                      info: "HERBICIDAS",
                      product: product,
                      report: false,
                    ),
                  ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedCategory.fungicidas
                ? Opacity(
                    opacity: 1,
                    child: ContainerSelectedInfo(
                      selectedCategory: selectedCategory,
                      info: "FUNGICIDAS",
                      product: product,
                      report: false,
                    ),
                  )
                : Opacity(
                    opacity: 0.35,
                    child: ContainerSelectedInfo(
                      selectedCategory: selectedCategory,
                      info: "FUNGICIDAS",
                      product: product,
                      report: false,
                    ),
                  ),
            const SizedBox(width: 5),
            selectedCategory.adjuvantes
                ? Opacity(
                    opacity: 1,
                    child: ContainerSelectedInfo(
                      selectedCategory: selectedCategory,
                      info: "ADJUVANTES",
                      product: product,
                      report: false,
                    ),
                  )
                : Opacity(
                    opacity: 0.35,
                    child: ContainerSelectedInfo(
                      selectedCategory: selectedCategory,
                      info: "ADJUVANTES",
                      product: product,
                      report: false,
                    ),
                  ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedCategory.fertilizantesFoliares
                ? Opacity(
                    opacity: 1,
                    child: ContainerSelectedInfo(
                      selectedCategory: selectedCategory,
                      info: "FERT. FOL.",
                      product: product,
                      report: false,
                    ),
                  )
                : Opacity(
                    opacity: 0.35,
                    child: ContainerSelectedInfo(
                      selectedCategory: selectedCategory,
                      info: "FERT. FOL.",
                      product: product,
                      report: false,
                    ),
                  ),
            const SizedBox(width: 5),
            selectedCategory.diesel
                ? Opacity(
                    opacity: 1,
                    child: ContainerSelectedInfo(
                      selectedCategory: selectedCategory,
                      info: "DIESEL",
                      product: product,
                      report: false,
                    ),
                  )
                : Opacity(
                    opacity: 0.35,
                    child: ContainerSelectedInfo(
                      selectedCategory: selectedCategory,
                      info: "DIESEL",
                      product: product,
                      report: false,
                    ),
                  ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedCategory.inoculantes
                ? Opacity(
                    opacity: 1,
                    child: ContainerSelectedInfo(
                      len: 265,
                      selectedCategory: selectedCategory,
                      info: "INOCULANTES E OUTROS",
                      product: product,
                      report: false,
                    ),
                  )
                : Opacity(
                    opacity: 0.35,
                    child: ContainerSelectedInfo(
                      len: 265,
                      selectedCategory: selectedCategory,
                      info: "INOCULANTES E OUTROS",
                      product: product,
                      report: false,
                    ),
                  ),
          ],
        ),
        const SizedBox(height: 25),
        Visibility(
          visible: selectedCategory.adubos,
          child: DropDownAdubosSequence(
            addLev: addLev,
            adubos: adubos,
            product: product,
            edit: false,
            culture: true,
            input: false,
          ),
        ),
        Visibility(
          visible: selectedCategory.sementes,
          child: DropDownSementesSequence(
            addLev: addLev,
            sementes: sementes,
            product: product,
            edit: false,
            culture: true,
            input: false,
          ),
        ),
        Visibility(
          visible: selectedCategory.inseticidas,
          child: DropDownInseticidasSequence(
            addLev: addLev,
            inseticidas: inseticidas,
            product: product,
            edit: false,
            culture: true,
            input: false,
          ),
        ),
        Visibility(
          visible: selectedCategory.herbicidas,
          child: DropDownHerbicidasSequence(
            addLev: addLev,
            herbicidas: herbicidas,
            product: product,
            edit: false,
            culture: true,
            input: false,
          ),
        ),
        Visibility(
          visible: selectedCategory.fungicidas,
          child: DropDownFungicidasSequence(
            addLev: addLev,
            fungicidas: fungicidas,
            product: product,
            edit: false,
            culture: true,
            input: false,
          ),
        ),
        Visibility(
          visible: selectedCategory.adjuvantes,
          child: DropDownAdjuvantesSequence(
            addLev: addLev,
            adjuvantes: adjuvantes,
            product: product,
            edit: false,
            culture: true,
            input: false,
          ),
        ),
        Visibility(
          visible: selectedCategory.inoculantes,
          child: DropDownInoculantesSequence(
            addLev: addLev,
            inoculantes: inoculantes,
            product: product,
            edit: false,
            culture: true,
            input: false,
          ),
        ),
        Visibility(
          visible: selectedCategory.diesel,
          child: DropDownDieselSequence(
            addLev: addLev,
            diesel: diesel,
            product: product,
            edit: false,
            culture: true,
            input: false,
          ),
        ),
        Visibility(
          visible: selectedCategory.fertilizantesFoliares,
          child: DropDownFertilizantesFoliaresSequence(
            addLev: addLev,
            fertilizantesFoliares: fertilizantesFoliares,
            product: product,
            edit: false,
            culture: true,
            input: false,
          ),
        ),
        const SizedBox(height: 10),
        // Input(
        //   controller: product.name,
        //   nameField: 'Produto',
        //   number: false,
        // ),
        // Input(
        //   controller: product.activePrinciple,
        //   nameField: 'Princípio Ativo',
        //   number: false,
        // ),
        culture != null
            ? (Platform.isAndroid
                ? Input(
                    controller: product.quantity,
                    nameField: 'Quantidade (${product.unity.text}/ALQ)',
                    number: true,
                    culture: culture,
                    newQuantity: true,
                    prod: product,
                  )
                : Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 450),
                    child: Input(
                      controller: product.quantity,
                      nameField: 'Quantidade (${product.unity.text}/ALQ)',
                      number: true,
                      culture: culture,
                      newQuantity: true,
                      prod: product,
                    ),
                  ))
            : (Platform.isAndroid
                ? Input(
                    controller: product.quantity,
                    nameField: 'Quantidade (${product.unity.text}/ALQ)',
                    number: true,
                  )
                : Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 450),
                    child: Input(
                      controller: product.quantity,
                      nameField: 'Quantidade (${product.unity.text}/ALQ)',
                      number: true,
                    ),
                  )),
        (recipe == null)
            ? SizedBox(
                height: 25,
                child: Text(
                  "Quantidade total sugerida: ${product.totalQuantity} ${product.unity.text}",
                  style: const TextStyle(fontSize: 16),
                ),
              )
            : const SizedBox(),
        Visibility(
          visible: isCulture == true,
          child: (Platform.isAndroid
              ? Input(
                  controller: product.realQuantity,
                  nameField: 'Real utilizado (${product.unity.text})',
                  number: true,
                )
              : Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 450),
                  child: Input(
                    controller: product.realQuantity,
                    nameField: 'Real utilizado (${product.unity.text})',
                    number: true,
                  ),
                )),
        ),
        (amount != null)
            ? ((prod == "Produto 1" && amount!.amount == 1) ||
                    (prod == "Produto 2" && amount!.amount == 2) ||
                    (prod == "Produto 3" && amount!.amount == 3) ||
                    (prod == "Produto 4" && amount!.amount == 4) ||
                    (prod == "Produto 5" && amount!.amount == 5) ||
                    (prod == "Produto 6" && amount!.amount == 6) ||
                    (prod == "Produto 7" && amount!.amount == 7) ||
                    (prod == "Produto 8" && amount!.amount == 8) ||
                    (prod == "Produto 9" && amount!.amount == 9))
                ? Center(
                    child: FloatingActionButton(
                        onPressed: () {
                          amountProducts.setAmount(amountProducts.amount + 1);
                        },
                        child: const Icon(
                          Icons.add,
                          size: 30,
                        )),
                  )
                : const SizedBox()
            : (prod != "Produto 10")
                ? Center(
                    child: FloatingActionButton(
                        onPressed: () {
                          amountProducts.setAmount(amountProducts.amount + 1);
                        },
                        child: const Icon(
                          Icons.add,
                          size: 30,
                        )),
                  )
                : const SizedBox(),
        const SizedBox(height: 15),
      ],
    );
  }
}
