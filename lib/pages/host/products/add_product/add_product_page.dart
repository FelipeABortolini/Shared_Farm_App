import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:universal_io/io.dart';

import '../../../../db/products/add_products/add_products.dart';
import '../../../../db/products/add_products/get_dad_infos.dart';
import '../../../../db/products/add_products/get_last_id_level.dart';
import '../../../../db/products/utils/get_levels.dart';
import '../../../../db/products/utils/get_number_product.dart';
import '../../../../db/products/update_dad/update_dad.dart';
import '../../../../providers/providers.dart';
import '../../../../shared/alert.dart';
import '../../../../shared/get_products.dart';
import '../../../../shared/input.dart';
import '../../../../styles/app_text_style.dart';
import '../../../login/utils/auth_check.dart';
import '../../../login/utils/sync_categories_for_cultures.dart';
import '../widgets/container_selected_info.dart';
import '../widgets/drop_downs/products/drop_down_adjuvantes_sequence.dart';
import '../widgets/drop_downs/products/drop_down_adubos_sequence.dart';
import '../widgets/drop_downs/products/drop_down_diesel_sequence.dart';
import '../widgets/drop_downs/products/drop_down_fertilizantes_foliares_sequence.dart';
import '../widgets/drop_downs/products/drop_down_fungicidas_sequence.dart';
import '../widgets/drop_downs/products/drop_down_herbicidas_sequence.dart';
import '../widgets/drop_downs/products/drop_down_inoculantes_sequence.dart';
import '../widgets/drop_downs/products/drop_down_inseticidas_sequence.dart';
import '../widgets/drop_downs/products/drop_down_sementes_sequence.dart';

// ignore: must_be_immutable
class AddProductPage extends HookConsumerWidget {
  AddProductPage({super.key});

  String dadCode = "";
  Map<String, dynamic>? dadInfo = {};
  AlertWidget alert = AlertWidget();

  final sync = SyncCategoriesForCulture();

  void getAll(
    adubos,
    sementes,
    inseticidas,
    herbicidas,
    fungicidas,
    adjuvantes,
    inoculantes,
    diesel,
    fertilizantesFoliares,
  ) async {
    await getProducts(adubos, "adubo");
    await getProducts(sementes, "semente");
    await getProducts(inseticidas, "inseticida");
    await getProducts(herbicidas, "herbicida");
    await getProducts(fungicidas, "fungicida");
    await getProducts(adjuvantes, "adjuvante");
    await getProducts(inoculantes, "inoculante");
    await getProducts(diesel, "diesel");
    await getProducts(fertilizantesFoliares, "fertilizanteFoliar");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider);
    final adubos = ref.watch(adubosProvider);
    final sementes = ref.watch(sementesProvider);
    final inseticidas = ref.watch(inseticidasProvider);
    final herbicidas = ref.watch(herbicidasProvider);
    final fungicidas = ref.watch(fungicidasProvider);
    final adjuvantes = ref.watch(adjuvantesProvider);
    final inoculantes = ref.watch(inoculantesProvider);
    final diesel = ref.watch(dieselProvider);
    final fertilizantesFoliares = ref.watch(fertilizantesFoliaresProvider);
    final addLev = ref.watch(addLevelProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final loading = ref.watch(loadingCultureProvider);

    final addProd = AddProducts();
    final getLastIDLevels = GetLastIdLevels();
    final upDad = UpdateDad();
    final numberProduct = GetNumberProduct();
    final dadInfos = GetDadInfos();
    final getLevels = GetLevels();

    List<Map<String, dynamic>> prodsLevel;
    bool repeated = false;

    void resetControlls() {
      addLev.resetLevel();
      adubos.setNoSelection();
      adubos.resetAll();
      sementes.setNoSelection();
      sementes.resetAll();
      inseticidas.setNoSelection();
      inseticidas.resetAll();
      herbicidas.setNoSelection();
      herbicidas.resetAll();
      fungicidas.setNoSelection();
      fungicidas.resetAll();
      adjuvantes.setNoSelection();
      adjuvantes.resetAll();
      inoculantes.resetAll();
      inoculantes.setNoSelection();
      diesel.resetAll();
      diesel.setNoSelection();
      fertilizantesFoliares.resetAll();
      fertilizantesFoliares.setNoSelection();
      product.resetControllers();
      selectedCategory.resetControllers();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Produto"),
        leading: IconButton(
          onPressed: () {
            resetControlls();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: (() async {
          if (await confirm(
            context,
            title: const Text('Confirmação'),
            content: const Text('Deseja atualizar a tela?'),
            textOK: const Text('Sim'),
            textCancel: const Text('Não'),
          )) {
            resetControlls();
          }
        }),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
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
                          culture: false,
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
                          culture: false,
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
                          culture: false,
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
                          culture: false,
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
                          culture: false,
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
                          culture: false,
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
                          culture: false,
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
                          culture: false,
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
                          culture: false,
                          input: false,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Platform.isAndroid
                          ? Input(
                              controller: product.name,
                              nameField: 'Nome',
                              number: false,
                            )
                          : Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 450),
                              child: Input(
                                controller: product.name,
                                nameField: 'Nome',
                                number: false,
                              ),
                            ),
                      Platform.isAndroid
                          ? Input(
                              controller: product.code,
                              nameField: 'Código',
                              number: false,
                            )
                          : Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 450),
                              child: Input(
                                controller: product.code,
                                nameField: 'Código',
                                number: false,
                              ),
                            ),
                      Platform.isAndroid
                          ? Input(
                              controller: product.unity,
                              nameField: 'Unidade de Medida',
                              number: false,
                            )
                          : Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 450),
                              child: Input(
                                controller: product.unity,
                                nameField: 'Unidade de Medida',
                                number: false,
                              ),
                            ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () async {
                          if (!loading.isLoading) {
                            loading.setIsLoading();
                            if (product.name.text == "") {
                              loading.resetIsLoading();
                              await alert.alert(
                                  context,
                                  "O campo nome deve ser preenchido.",
                                  "ATENÇÃO!",
                                  AlertType.info);
                            } else if (product.code.text == "") {
                              loading.resetIsLoading();
                              await alert.alert(
                                  context,
                                  "O campo código deve ser preenchido.",
                                  "ATENÇÃO!",
                                  AlertType.info);
                            } else if (product.unity.text == "") {
                              loading.resetIsLoading();
                              await alert.alert(
                                  context,
                                  "O campo unidade de medida deve ser preenchido.",
                                  "ATENÇÃO!",
                                  AlertType.info);
                            } else if (selectedCategory.categoryString ==
                                null) {
                              loading.resetIsLoading();
                              await alert.alert(
                                  context,
                                  "Selecione uma categoria.",
                                  "ATENÇÃO!",
                                  AlertType.info);
                            } else {
                              repeated = false;
                              prodsLevel = await getLevels.getLevel(
                                  selectedCategory.categoryString!,
                                  addLev.level + 1);
                              for (Map<String, dynamic> prod in prodsLevel) {
                                if (product.code.text == prod["code"]) {
                                  repeated = true;
                                }
                              }
                              if (!repeated) {
                                try {
                                  // EM QUAL NÍVEL SERÁ INSERIDO
                                  // setLevelAdubo(addLev, adubos);
                                  addLev.setLevel(addLev.level + 1);

                                  // INFOS DO PAI
                                  if (addLev.level == 10) {
                                    if (selectedCategory.adubos) {
                                      dadCode = adubos.selectedNivel9!;
                                    } else if (selectedCategory.sementes) {
                                      dadCode = sementes.selectedNivel9!;
                                    } else if (selectedCategory.inseticidas) {
                                      dadCode = inseticidas.selectedNivel9!;
                                    } else if (selectedCategory.herbicidas) {
                                      dadCode = herbicidas.selectedNivel9!;
                                    } else if (selectedCategory.fungicidas) {
                                      dadCode = fungicidas.selectedNivel9!;
                                    } else if (selectedCategory.adjuvantes) {
                                      dadCode = adjuvantes.selectedNivel9!;
                                    } else if (selectedCategory.inoculantes) {
                                      dadCode = inoculantes.selectedNivel9!;
                                    } else if (selectedCategory.diesel) {
                                      dadCode = diesel.selectedNivel9!;
                                    } else if (selectedCategory
                                        .fertilizantesFoliares) {
                                      dadCode =
                                          fertilizantesFoliares.selectedNivel9!;
                                    }
                                  } else if (addLev.level == 9) {
                                    if (selectedCategory.adubos) {
                                      dadCode = adubos.selectedNivel8!;
                                    } else if (selectedCategory.sementes) {
                                      dadCode = sementes.selectedNivel8!;
                                    } else if (selectedCategory.inseticidas) {
                                      dadCode = inseticidas.selectedNivel8!;
                                    } else if (selectedCategory.herbicidas) {
                                      dadCode = herbicidas.selectedNivel8!;
                                    } else if (selectedCategory.fungicidas) {
                                      dadCode = fungicidas.selectedNivel8!;
                                    } else if (selectedCategory.adjuvantes) {
                                      dadCode = adjuvantes.selectedNivel8!;
                                    } else if (selectedCategory.inoculantes) {
                                      dadCode = inoculantes.selectedNivel8!;
                                    } else if (selectedCategory.diesel) {
                                      dadCode = diesel.selectedNivel8!;
                                    } else if (selectedCategory
                                        .fertilizantesFoliares) {
                                      dadCode =
                                          fertilizantesFoliares.selectedNivel8!;
                                    }
                                  } else if (addLev.level == 8) {
                                    if (selectedCategory.adubos) {
                                      dadCode = adubos.selectedNivel7!;
                                    } else if (selectedCategory.sementes) {
                                      dadCode = sementes.selectedNivel7!;
                                    } else if (selectedCategory.inseticidas) {
                                      dadCode = inseticidas.selectedNivel7!;
                                    } else if (selectedCategory.herbicidas) {
                                      dadCode = herbicidas.selectedNivel7!;
                                    } else if (selectedCategory.fungicidas) {
                                      dadCode = fungicidas.selectedNivel7!;
                                    } else if (selectedCategory.adjuvantes) {
                                      dadCode = adjuvantes.selectedNivel7!;
                                    } else if (selectedCategory.inoculantes) {
                                      dadCode = inoculantes.selectedNivel7!;
                                    } else if (selectedCategory.diesel) {
                                      dadCode = diesel.selectedNivel7!;
                                    } else if (selectedCategory
                                        .fertilizantesFoliares) {
                                      dadCode =
                                          fertilizantesFoliares.selectedNivel7!;
                                    }
                                  } else if (addLev.level == 7) {
                                    if (selectedCategory.adubos) {
                                      dadCode = adubos.selectedNivel6!;
                                    } else if (selectedCategory.sementes) {
                                      dadCode = sementes.selectedNivel6!;
                                    } else if (selectedCategory.inseticidas) {
                                      dadCode = inseticidas.selectedNivel6!;
                                    } else if (selectedCategory.herbicidas) {
                                      dadCode = herbicidas.selectedNivel6!;
                                    } else if (selectedCategory.fungicidas) {
                                      dadCode = fungicidas.selectedNivel6!;
                                    } else if (selectedCategory.adjuvantes) {
                                      dadCode = adjuvantes.selectedNivel6!;
                                    } else if (selectedCategory.inoculantes) {
                                      dadCode = inoculantes.selectedNivel6!;
                                    } else if (selectedCategory.diesel) {
                                      dadCode = diesel.selectedNivel6!;
                                    } else if (selectedCategory
                                        .fertilizantesFoliares) {
                                      dadCode =
                                          fertilizantesFoliares.selectedNivel6!;
                                    }
                                  } else if (addLev.level == 6) {
                                    if (selectedCategory.adubos) {
                                      dadCode = adubos.selectedNivel5!;
                                    } else if (selectedCategory.sementes) {
                                      dadCode = sementes.selectedNivel5!;
                                    } else if (selectedCategory.inseticidas) {
                                      dadCode = inseticidas.selectedNivel5!;
                                    } else if (selectedCategory.herbicidas) {
                                      dadCode = herbicidas.selectedNivel5!;
                                    } else if (selectedCategory.fungicidas) {
                                      dadCode = fungicidas.selectedNivel5!;
                                    } else if (selectedCategory.adjuvantes) {
                                      dadCode = adjuvantes.selectedNivel5!;
                                    } else if (selectedCategory.inoculantes) {
                                      dadCode = inoculantes.selectedNivel5!;
                                    } else if (selectedCategory.diesel) {
                                      dadCode = diesel.selectedNivel5!;
                                    } else if (selectedCategory
                                        .fertilizantesFoliares) {
                                      dadCode =
                                          fertilizantesFoliares.selectedNivel5!;
                                    }
                                  } else if (addLev.level == 5) {
                                    if (selectedCategory.adubos) {
                                      dadCode = adubos.selectedNivel4!;
                                    } else if (selectedCategory.sementes) {
                                      dadCode = sementes.selectedNivel4!;
                                    } else if (selectedCategory.inseticidas) {
                                      dadCode = inseticidas.selectedNivel4!;
                                    } else if (selectedCategory.herbicidas) {
                                      dadCode = herbicidas.selectedNivel4!;
                                    } else if (selectedCategory.fungicidas) {
                                      dadCode = fungicidas.selectedNivel4!;
                                    } else if (selectedCategory.adjuvantes) {
                                      dadCode = adjuvantes.selectedNivel4!;
                                    } else if (selectedCategory.inoculantes) {
                                      dadCode = inoculantes.selectedNivel4!;
                                    } else if (selectedCategory.diesel) {
                                      dadCode = diesel.selectedNivel4!;
                                    } else if (selectedCategory
                                        .fertilizantesFoliares) {
                                      dadCode =
                                          fertilizantesFoliares.selectedNivel4!;
                                    }
                                  } else if (addLev.level == 4) {
                                    if (selectedCategory.adubos) {
                                      dadCode = adubos.selectedNivel3!;
                                    } else if (selectedCategory.sementes) {
                                      dadCode = sementes.selectedNivel3!;
                                    } else if (selectedCategory.inseticidas) {
                                      dadCode = inseticidas.selectedNivel3!;
                                    } else if (selectedCategory.herbicidas) {
                                      dadCode = herbicidas.selectedNivel3!;
                                    } else if (selectedCategory.fungicidas) {
                                      dadCode = fungicidas.selectedNivel3!;
                                    } else if (selectedCategory.adjuvantes) {
                                      dadCode = adjuvantes.selectedNivel3!;
                                    } else if (selectedCategory.inoculantes) {
                                      dadCode = inoculantes.selectedNivel3!;
                                    } else if (selectedCategory.diesel) {
                                      dadCode = diesel.selectedNivel3!;
                                    } else if (selectedCategory
                                        .fertilizantesFoliares) {
                                      dadCode =
                                          fertilizantesFoliares.selectedNivel3!;
                                    }
                                  } else if (addLev.level == 3) {
                                    if (selectedCategory.adubos) {
                                      dadCode = adubos.selectedNivel2!;
                                    } else if (selectedCategory.sementes) {
                                      dadCode = sementes.selectedNivel2!;
                                    } else if (selectedCategory.inseticidas) {
                                      dadCode = inseticidas.selectedNivel2!;
                                    } else if (selectedCategory.herbicidas) {
                                      dadCode = herbicidas.selectedNivel2!;
                                    } else if (selectedCategory.fungicidas) {
                                      dadCode = fungicidas.selectedNivel2!;
                                    } else if (selectedCategory.adjuvantes) {
                                      dadCode = adjuvantes.selectedNivel2!;
                                    } else if (selectedCategory.inoculantes) {
                                      dadCode = inoculantes.selectedNivel2!;
                                    } else if (selectedCategory.diesel) {
                                      dadCode = diesel.selectedNivel2!;
                                    } else if (selectedCategory
                                        .fertilizantesFoliares) {
                                      dadCode =
                                          fertilizantesFoliares.selectedNivel2!;
                                    }
                                  } else if (addLev.level == 2) {
                                    if (selectedCategory.adubos) {
                                      dadCode = adubos.selectedNivel1!;
                                    } else if (selectedCategory.sementes) {
                                      dadCode = sementes.selectedNivel1!;
                                    } else if (selectedCategory.inseticidas) {
                                      dadCode = inseticidas.selectedNivel1!;
                                    } else if (selectedCategory.herbicidas) {
                                      dadCode = herbicidas.selectedNivel1!;
                                    } else if (selectedCategory.fungicidas) {
                                      dadCode = fungicidas.selectedNivel1!;
                                    } else if (selectedCategory.adjuvantes) {
                                      dadCode = adjuvantes.selectedNivel1!;
                                    } else if (selectedCategory.inoculantes) {
                                      dadCode = inoculantes.selectedNivel1!;
                                    } else if (selectedCategory.diesel) {
                                      dadCode = diesel.selectedNivel1!;
                                    } else if (selectedCategory
                                        .fertilizantesFoliares) {
                                      dadCode =
                                          fertilizantesFoliares.selectedNivel1!;
                                    }
                                  }

                                  // QUANTOS PRODUTOS TEM NO NÍVEL
                                  int lenLevel = await getLastIDLevels.get(
                                      selectedCategory.categoryString,
                                      addLev.level);
                                  int newProductID = lenLevel + 1;

                                  int? numDad = await numberProduct.get(
                                      selectedCategory.categoryString,
                                      dadCode,
                                      addLev.level - 1);

                                  numDad != null
                                      ? dadInfo = await dadInfos.get(
                                          selectedCategory.categoryString,
                                          addLev.level - 1,
                                          numDad)
                                      : ();

                                  if (dadInfo == null) {
                                    addProd.addProduct(
                                      selectedCategory.categoryString,
                                      {
                                        "name": product.name.text.toUpperCase(),
                                        "category":
                                            selectedCategory.categoryString,
                                        "code": product.code.text,
                                        "quantity": 0,
                                        "unity":
                                            product.unity.text.toUpperCase(),
                                        "dad": "",
                                        "sons": [],
                                        "ID": newProductID,
                                        "santaTerezinha": 0,
                                        "real": 0,
                                        "saoJoao": 0,
                                        "saoJorge": 0,
                                        "cruzeiro": 0,
                                        "campinho": 0,
                                      },
                                      addLev.level,
                                      newProductID,
                                    );
                                  } else {
                                    addProd.addProduct(
                                      selectedCategory.categoryString,
                                      {
                                        "name": product.name.text.toUpperCase(),
                                        "category":
                                            selectedCategory.categoryString,
                                        "code": product.code.text,
                                        "quantity": 0,
                                        "unity":
                                            product.unity.text.toUpperCase(),
                                        "dad": dadInfo!["code"],
                                        "sons": [],
                                        "ID": newProductID,
                                        "santaTerezinha": 0,
                                        "real": 0,
                                        "saoJoao": 0,
                                        "saoJorge": 0,
                                        "cruzeiro": 0,
                                        "campinho": 0,
                                      },
                                      addLev.level,
                                      newProductID,
                                    );

                                    // CADASTRA O NOS FILHOS DO PAI
                                    if (addLev.level != 1) {
                                      dadInfo!["sons"].add(product.code.text);
                                      upDad.updateDad(
                                        selectedCategory.categoryString,
                                        numDad!,
                                        dadInfo!["sons"],
                                        addLev.level - 1,
                                      );
                                    }
                                  }
                                  resetControlls();
                                  loading.resetIsLoading();
                                  // ignore: use_build_context_synchronously
                                  await alert.alert(
                                      context,
                                      "Produto cadastrado com sucesso.",
                                      "SUCESSO!",
                                      AlertType.success);
                                  
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AuthCheck(first: false),
                                    ),
                                  );
                                } catch (e) {
                                  loading.resetIsLoading();
                                  // ignore: use_build_context_synchronously
                                  await alert.alert(
                                      context,
                                      "Erro ao cadastrar produto.",
                                      "ERRO!",
                                      AlertType.error);
                                }
                              } else {
                                loading.resetIsLoading();
                                // ignore: use_build_context_synchronously
                                await alert.alert(
                                    context,
                                    "Código já cadastrado em outro produto do mesmo nível.",
                                    "ERRO!",
                                    AlertType.error);
                              }
                            }
                          }
                        },
                        child: Platform.isAndroid
                            ? Container(
                                height: 56,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.green[300]),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Padding(
                                          padding: !loading.isLoading
                                              ? const EdgeInsets.only(left: 32)
                                              : const EdgeInsets.only(left: 0),
                                          child: !loading.isLoading
                                              ? Text(
                                                  'Adicionar',
                                                  style: AppTextStyle.style(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              : Lottie.asset(
                                                  'assets/loading.json',
                                                  height: 50,
                                                  width: 50),
                                        ),
                                      ),
                                    ),
                                    !loading.isLoading
                                        ? const Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Icon(Icons.arrow_forward,
                                                color: Colors.white, size: 32),
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                              )
                            : Container(
                                height: 56,
                                width: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.green[300]),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Padding(
                                          padding: !loading.isLoading
                                              ? const EdgeInsets.only(left: 32)
                                              : const EdgeInsets.only(left: 0),
                                          child: !loading.isLoading
                                              ? Text(
                                                  'Adicionar',
                                                  style: AppTextStyle.style(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              : Lottie.asset(
                                                  'assets/loading.json',
                                                  height: 50,
                                                  width: 50),
                                        ),
                                      ),
                                    ),
                                    !loading.isLoading
                                        ? const Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Icon(Icons.arrow_forward,
                                                color: Colors.white, size: 32),
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                              ),
                      ),
                      const SizedBox(height: 70),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
