import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flv_farm/pages/host/products/delete_product/utils/no_sons.dart';
import 'package:flv_farm/pages/host/products/widgets/drop_downs/products/drop_down_fertilizantes_foliares_sequence.dart';
import 'package:flv_farm/pages/login/utils/auth_check.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:universal_io/io.dart';

import '../../../../db/products/add_products/get_dad_infos.dart';
import '../../../../db/products/delete_products/delete_products.dart';
import '../../../../db/products/utils/get_number_product.dart';
import '../../../../providers/providers.dart';
import '../../../../shared/alert.dart';
import '../../../../styles/app_text_style.dart';
import '../widgets/drop_downs/products/drop_down_adjuvantes_sequence.dart';
import '../widgets/drop_downs/products/drop_down_adubos_sequence.dart';
import '../widgets/drop_downs/products/drop_down_diesel_sequence.dart';
import '../widgets/drop_downs/products/drop_down_fungicidas_sequence.dart';
import '../widgets/drop_downs/products/drop_down_herbicidas_sequence.dart';
import '../widgets/drop_downs/products/drop_down_inoculantes_sequence.dart';
import '../widgets/drop_downs/products/drop_down_inseticidas_sequence.dart';
import '../widgets/drop_downs/products/drop_down_sementes_sequence.dart';
import '../widgets/container_selected_info.dart';
import 'utils/delete_dads_son.dart';

// ignore: must_be_immutable
class DelProductPage extends HookConsumerWidget {
  DelProductPage({super.key});

  String dadCode = "";
  Map<String, dynamic>? dadInfo = {};
  AlertWidget alert = AlertWidget();
  String codeDeleted = "";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider);
    final adubos = ref.watch(adubosProvider);
    final levelSelected = ref.watch(addLevelProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final sementes = ref.watch(sementesProvider);
    final inseticidas = ref.watch(inseticidasProvider);
    final herbicidas = ref.watch(herbicidasProvider);
    final fungicidas = ref.watch(fungicidasProvider);
    final adjuvantes = ref.watch(adjuvantesProvider);
    final inoculantes = ref.watch(inoculantesProvider);
    final diesel = ref.watch(dieselProvider);
    final fertilizantesFoliares = ref.watch(fertilizantesFoliaresProvider);
    final loading = ref.watch(loadingCultureProvider);

    final delProd = DeleteProducts();
    final numberProduct = GetNumberProduct();
    final dadInfos = GetDadInfos();
    final delDadsSon = DeleteDadsSon();

    void resetControlls() {
      levelSelected.resetLevel();
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
      selectedCategory.resetControllers();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Excluir Produto"),
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
                          addLev: levelSelected,
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
                          addLev: levelSelected,
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
                          addLev: levelSelected,
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
                          addLev: levelSelected,
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
                          addLev: levelSelected,
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
                          addLev: levelSelected,
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
                          addLev: levelSelected,
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
                          addLev: levelSelected,
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
                          addLev: levelSelected,
                          fertilizantesFoliares: fertilizantesFoliares,
                          product: product,
                          edit: false,
                          culture: false,
                          input: false,
                        ),
                      ),
                      const SizedBox(height: 50),
                      GestureDetector(
                        onTap: () async {
                          if (!loading.isLoading) {
                            loading.setIsLoading();
                            if (adubos.lastSelected != null ||
                                sementes.lastSelected != null ||
                                inseticidas.lastSelected != null ||
                                herbicidas.lastSelected != null ||
                                fungicidas.lastSelected != null ||
                                adjuvantes.lastSelected != null ||
                                inoculantes.lastSelected != null ||
                                diesel.lastSelected != null ||
                                fertilizantesFoliares.lastSelected != null) {
                              int? numProd;

                              if (selectedCategory.adubos) {
                                numProd = await numberProduct.get(
                                    selectedCategory.categoryString,
                                    adubos.lastSelected!,
                                    levelSelected.level);
                                codeDeleted = adubos.lastSelected!;
                              } else if (selectedCategory.sementes) {
                                numProd = await numberProduct.get(
                                    selectedCategory.categoryString,
                                    sementes.lastSelected!,
                                    levelSelected.level);
                                codeDeleted = sementes.lastSelected!;
                              } else if (selectedCategory.inseticidas) {
                                numProd = await numberProduct.get(
                                    selectedCategory.categoryString,
                                    inseticidas.lastSelected!,
                                    levelSelected.level);
                                codeDeleted = inseticidas.lastSelected!;
                              } else if (selectedCategory.herbicidas) {
                                numProd = await numberProduct.get(
                                    selectedCategory.categoryString,
                                    herbicidas.lastSelected!,
                                    levelSelected.level);
                                codeDeleted = herbicidas.lastSelected!;
                              } else if (selectedCategory.fungicidas) {
                                numProd = await numberProduct.get(
                                    selectedCategory.categoryString,
                                    fungicidas.lastSelected!,
                                    levelSelected.level);
                                codeDeleted = fungicidas.lastSelected!;
                              } else if (selectedCategory.adjuvantes) {
                                numProd = await numberProduct.get(
                                    selectedCategory.categoryString,
                                    adjuvantes.lastSelected!,
                                    levelSelected.level);
                                codeDeleted = adjuvantes.lastSelected!;
                              } else if (selectedCategory.inoculantes) {
                                numProd = await numberProduct.get(
                                    selectedCategory.categoryString,
                                    inoculantes.lastSelected!,
                                    levelSelected.level);
                                codeDeleted = inoculantes.lastSelected!;
                              } else if (selectedCategory.diesel) {
                                numProd = await numberProduct.get(
                                    selectedCategory.categoryString,
                                    diesel.lastSelected!,
                                    levelSelected.level);
                                codeDeleted = diesel.lastSelected!;
                              } else if (selectedCategory
                                  .fertilizantesFoliares) {
                                numProd = await numberProduct.get(
                                    selectedCategory.categoryString,
                                    fertilizantesFoliares.lastSelected!,
                                    levelSelected.level);
                                codeDeleted =
                                    fertilizantesFoliares.lastSelected!;
                              }

                              bool noSons = false;

                              // INFOS DO PAI
                              if (levelSelected.level == 10) {
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
                              } else if (levelSelected.level == 9) {
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
                              } else if (levelSelected.level == 8) {
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
                              } else if (levelSelected.level == 7) {
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
                              } else if (levelSelected.level == 6) {
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
                              } else if (levelSelected.level == 5) {
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
                              } else if (levelSelected.level == 4) {
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
                              } else if (levelSelected.level == 3) {
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
                              } else if (levelSelected.level == 2) {
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

                              int? numDad = await numberProduct.get(
                                  selectedCategory.categoryString,
                                  dadCode,
                                  levelSelected.level - 1);

                              numDad != null
                                  ? dadInfo = await dadInfos.get(
                                      selectedCategory.categoryString,
                                      levelSelected.level - 1,
                                      numDad)
                                  : ();

                              noSons = noSonsFun(
                                levelSelected.level,
                                selectedCategory,
                                adubos,
                                sementes,
                                inseticidas,
                                fungicidas,
                                herbicidas,
                                adjuvantes,
                                inoculantes,
                                diesel,
                                fertilizantesFoliares,
                              );

                              if (noSons) {
                                if (numProd != null) {
                                  try {
                                    delProd.delProduct(
                                      selectedCategory.categoryString,
                                      levelSelected.level,
                                      numProd,
                                    );
                                    if (dadInfo != null) {
                                      delDadsSon.delDadsSon(
                                        selectedCategory.categoryString,
                                        levelSelected.level - 1,
                                        numDad,
                                        dadInfo!["sons"],
                                        codeDeleted,
                                      );
                                    }
                                    loading.resetIsLoading();
                                    // ignore: use_build_context_synchronously
                                    await alert.alert(
                                        context,
                                        "Produto excluido com sucesso.",
                                        "SUCESSO!",
                                        AlertType.success);
                                    resetControlls();
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
                                        "Não foi possível localizar o produto no banco de dados.",
                                        "ERRO!",
                                        AlertType.error);
                                  }
                                } else {
                                  loading.resetIsLoading();
                                  // ignore: use_build_context_synchronously
                                  await alert.alert(
                                      context,
                                      "Não foi possível localizar o produto no banco de dados.",
                                      "ERRO!",
                                      AlertType.error);
                                }
                              } else {
                                loading.resetIsLoading();
                                // ignore: use_build_context_synchronously
                                await alert.alert(
                                    context,
                                    "Não é possível excluir produtos que possuam outros produtos descendentes.",
                                    "ERRO!",
                                    AlertType.error);
                              }
                            } else {
                              loading.resetIsLoading();
                              await alert.alert(
                                  context,
                                  "Selecione um produto para deletar.",
                                  "ERRO!",
                                  AlertType.error);
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
                                                  'Excluir',
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
                                                  'Excluir',
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
