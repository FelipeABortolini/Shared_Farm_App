import 'package:flutter/material.dart';
import 'package:flv_farm/db/products/edit_products/update_prod.dart';
import 'package:flv_farm/pages/login/utils/auth_check.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:universal_io/io.dart';

import '../../../../db/products/utils/get_number_product.dart';
import '../../../../providers/providers.dart';
import '../../../../shared/alert.dart';
import '../../../../shared/input.dart';
import '../../../../styles/app_text_style.dart';
import '../widgets/drop_downs/products/drop_down_diesel_sequence.dart';
import '../widgets/drop_downs/products/drop_down_fertilizantes_foliares_sequence.dart';
import '../widgets/drop_downs/products/drop_down_inoculantes_sequence.dart';
import '../widgets/container_selected_info.dart';
import '../widgets/drop_downs/products/drop_down_adjuvantes_sequence.dart';
import '../widgets/drop_downs/products/drop_down_adubos_sequence.dart';
import '../widgets/drop_downs/products/drop_down_fungicidas_sequence.dart';
import '../widgets/drop_downs/products/drop_down_herbicidas_sequence.dart';
import '../widgets/drop_downs/products/drop_down_inseticidas_sequence.dart';
import '../widgets/drop_downs/products/drop_down_sementes_sequence.dart';

// ignore: must_be_immutable
class EditProductPage extends HookConsumerWidget {
  EditProductPage({super.key});

  String prodCode = "";
  Map<String, dynamic>? prodInfo = {};
  AlertWidget alert = AlertWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider);
    final adubos = ref.watch(adubosProvider);
    final sementes = ref.watch(sementesProvider);
    final inseticidas = ref.watch(inseticidasProvider);
    final herbicidas = ref.watch(herbicidasProvider);
    final fungicidas = ref.watch(fungicidasProvider);
    final adjuvantes = ref.watch(adjuvantesProvider);
    final addLev = ref.watch(addLevelProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final inoculantes = ref.watch(inoculantesProvider);
    final diesel = ref.watch(dieselProvider);
    final fertilizantesFoliares = ref.watch(fertilizantesFoliaresProvider);
    final loading = ref.watch(loadingCultureProvider);

    final editProduct = EditProducts();
    final numberProduct = GetNumberProduct();

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
        title: const Text("Editar Produto"),
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
                          edit: true,
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
                          edit: true,
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
                          edit: true,
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
                          edit: true,
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
                          edit: true,
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
                          edit: true,
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
                          edit: true,
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
                          edit: true,
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
                          edit: true,
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
                      // Input(
                      //   controller: product.quantity,
                      //   nameField: 'Quantidade Inicial',
                      //   number: true,
                      // ),
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
                              // ignore: use_build_context_synchronously
                              await alert.alert(
                                  context,
                                  "O campo nome deve ser preenchido.",
                                  "ATENÇÃO!",
                                  AlertType.info);
                            } else if (product.unity.text == "") {
                              loading.resetIsLoading();
                              // ignore: use_build_context_synchronously
                              await alert.alert(
                                  context,
                                  "O campo unidade de medida deve ser preenchido.",
                                  "ATENÇÃO!",
                                  AlertType.info);
                            } else {
                              try {
                                addLev.setLevel(addLev.level);

                                if (addLev.level == 10) {
                                  if (selectedCategory.adubos) {
                                    prodCode = adubos.selectedNivel10!;
                                  } else if (selectedCategory.sementes) {
                                    prodCode = sementes.selectedNivel10!;
                                  } else if (selectedCategory.inseticidas) {
                                    prodCode = inseticidas.selectedNivel10!;
                                  } else if (selectedCategory.herbicidas) {
                                    prodCode = herbicidas.selectedNivel10!;
                                  } else if (selectedCategory.fungicidas) {
                                    prodCode = fungicidas.selectedNivel10!;
                                  } else if (selectedCategory.adjuvantes) {
                                    prodCode = adjuvantes.selectedNivel10!;
                                  } else if (selectedCategory.inoculantes) {
                                    prodCode = inoculantes.selectedNivel10!;
                                  } else if (selectedCategory.diesel) {
                                    prodCode = diesel.selectedNivel10!;
                                  } else if (selectedCategory
                                      .fertilizantesFoliares) {
                                    prodCode =
                                        fertilizantesFoliares.selectedNivel10!;
                                  }
                                } else if (addLev.level == 9) {
                                  if (selectedCategory.adubos) {
                                    prodCode = adubos.selectedNivel9!;
                                  } else if (selectedCategory.sementes) {
                                    prodCode = sementes.selectedNivel9!;
                                  } else if (selectedCategory.inseticidas) {
                                    prodCode = inseticidas.selectedNivel9!;
                                  } else if (selectedCategory.herbicidas) {
                                    prodCode = herbicidas.selectedNivel9!;
                                  } else if (selectedCategory.fungicidas) {
                                    prodCode = fungicidas.selectedNivel9!;
                                  } else if (selectedCategory.adjuvantes) {
                                    prodCode = adjuvantes.selectedNivel9!;
                                  } else if (selectedCategory.inoculantes) {
                                    prodCode = inoculantes.selectedNivel9!;
                                  } else if (selectedCategory.diesel) {
                                    prodCode = diesel.selectedNivel9!;
                                  } else if (selectedCategory
                                      .fertilizantesFoliares) {
                                    prodCode =
                                        fertilizantesFoliares.selectedNivel9!;
                                  }
                                } else if (addLev.level == 8) {
                                  if (selectedCategory.adubos) {
                                    prodCode = adubos.selectedNivel8!;
                                  } else if (selectedCategory.sementes) {
                                    prodCode = sementes.selectedNivel8!;
                                  } else if (selectedCategory.inseticidas) {
                                    prodCode = inseticidas.selectedNivel8!;
                                  } else if (selectedCategory.herbicidas) {
                                    prodCode = herbicidas.selectedNivel8!;
                                  } else if (selectedCategory.fungicidas) {
                                    prodCode = fungicidas.selectedNivel8!;
                                  } else if (selectedCategory.adjuvantes) {
                                    prodCode = adjuvantes.selectedNivel8!;
                                  } else if (selectedCategory.inoculantes) {
                                    prodCode = inoculantes.selectedNivel8!;
                                  } else if (selectedCategory.diesel) {
                                    prodCode = diesel.selectedNivel8!;
                                  } else if (selectedCategory
                                      .fertilizantesFoliares) {
                                    prodCode =
                                        fertilizantesFoliares.selectedNivel8!;
                                  }
                                } else if (addLev.level == 7) {
                                  if (selectedCategory.adubos) {
                                    prodCode = adubos.selectedNivel7!;
                                  } else if (selectedCategory.sementes) {
                                    prodCode = sementes.selectedNivel7!;
                                  } else if (selectedCategory.inseticidas) {
                                    prodCode = inseticidas.selectedNivel7!;
                                  } else if (selectedCategory.herbicidas) {
                                    prodCode = herbicidas.selectedNivel7!;
                                  } else if (selectedCategory.fungicidas) {
                                    prodCode = fungicidas.selectedNivel7!;
                                  } else if (selectedCategory.adjuvantes) {
                                    prodCode = adjuvantes.selectedNivel7!;
                                  } else if (selectedCategory.inoculantes) {
                                    prodCode = inoculantes.selectedNivel7!;
                                  } else if (selectedCategory.diesel) {
                                    prodCode = diesel.selectedNivel7!;
                                  } else if (selectedCategory
                                      .fertilizantesFoliares) {
                                    prodCode =
                                        fertilizantesFoliares.selectedNivel7!;
                                  }
                                } else if (addLev.level == 6) {
                                  if (selectedCategory.adubos) {
                                    prodCode = adubos.selectedNivel6!;
                                  } else if (selectedCategory.sementes) {
                                    prodCode = sementes.selectedNivel6!;
                                  } else if (selectedCategory.inseticidas) {
                                    prodCode = inseticidas.selectedNivel6!;
                                  } else if (selectedCategory.herbicidas) {
                                    prodCode = herbicidas.selectedNivel6!;
                                  } else if (selectedCategory.fungicidas) {
                                    prodCode = fungicidas.selectedNivel6!;
                                  } else if (selectedCategory.adjuvantes) {
                                    prodCode = adjuvantes.selectedNivel6!;
                                  } else if (selectedCategory.inoculantes) {
                                    prodCode = inoculantes.selectedNivel6!;
                                  } else if (selectedCategory.diesel) {
                                    prodCode = diesel.selectedNivel6!;
                                  } else if (selectedCategory
                                      .fertilizantesFoliares) {
                                    prodCode =
                                        fertilizantesFoliares.selectedNivel6!;
                                  }
                                } else if (addLev.level == 5) {
                                  if (selectedCategory.adubos) {
                                    prodCode = adubos.selectedNivel5!;
                                  } else if (selectedCategory.sementes) {
                                    prodCode = sementes.selectedNivel5!;
                                  } else if (selectedCategory.inseticidas) {
                                    prodCode = inseticidas.selectedNivel5!;
                                  } else if (selectedCategory.herbicidas) {
                                    prodCode = herbicidas.selectedNivel5!;
                                  } else if (selectedCategory.fungicidas) {
                                    prodCode = fungicidas.selectedNivel5!;
                                  } else if (selectedCategory.adjuvantes) {
                                    prodCode = adjuvantes.selectedNivel5!;
                                  } else if (selectedCategory.inoculantes) {
                                    prodCode = inoculantes.selectedNivel5!;
                                  } else if (selectedCategory.diesel) {
                                    prodCode = diesel.selectedNivel5!;
                                  } else if (selectedCategory
                                      .fertilizantesFoliares) {
                                    prodCode =
                                        fertilizantesFoliares.selectedNivel5!;
                                  }
                                } else if (addLev.level == 4) {
                                  if (selectedCategory.adubos) {
                                    prodCode = adubos.selectedNivel4!;
                                  } else if (selectedCategory.sementes) {
                                    prodCode = sementes.selectedNivel4!;
                                  } else if (selectedCategory.inseticidas) {
                                    prodCode = inseticidas.selectedNivel4!;
                                  } else if (selectedCategory.herbicidas) {
                                    prodCode = herbicidas.selectedNivel4!;
                                  } else if (selectedCategory.fungicidas) {
                                    prodCode = fungicidas.selectedNivel4!;
                                  } else if (selectedCategory.adjuvantes) {
                                    prodCode = adjuvantes.selectedNivel4!;
                                  } else if (selectedCategory.inoculantes) {
                                    prodCode = inoculantes.selectedNivel4!;
                                  } else if (selectedCategory.diesel) {
                                    prodCode = diesel.selectedNivel4!;
                                  } else if (selectedCategory
                                      .fertilizantesFoliares) {
                                    prodCode =
                                        fertilizantesFoliares.selectedNivel4!;
                                  }
                                } else if (addLev.level == 3) {
                                  if (selectedCategory.adubos) {
                                    prodCode = adubos.selectedNivel3!;
                                  } else if (selectedCategory.sementes) {
                                    prodCode = sementes.selectedNivel3!;
                                  } else if (selectedCategory.inseticidas) {
                                    prodCode = inseticidas.selectedNivel3!;
                                  } else if (selectedCategory.herbicidas) {
                                    prodCode = herbicidas.selectedNivel3!;
                                  } else if (selectedCategory.fungicidas) {
                                    prodCode = fungicidas.selectedNivel3!;
                                  } else if (selectedCategory.adjuvantes) {
                                    prodCode = adjuvantes.selectedNivel3!;
                                  } else if (selectedCategory.inoculantes) {
                                    prodCode = inoculantes.selectedNivel3!;
                                  } else if (selectedCategory.diesel) {
                                    prodCode = diesel.selectedNivel3!;
                                  } else if (selectedCategory
                                      .fertilizantesFoliares) {
                                    prodCode =
                                        fertilizantesFoliares.selectedNivel3!;
                                  }
                                } else if (addLev.level == 2) {
                                  if (selectedCategory.adubos) {
                                    prodCode = adubos.selectedNivel2!;
                                  } else if (selectedCategory.sementes) {
                                    prodCode = sementes.selectedNivel2!;
                                  } else if (selectedCategory.inseticidas) {
                                    prodCode = inseticidas.selectedNivel2!;
                                  } else if (selectedCategory.herbicidas) {
                                    prodCode = herbicidas.selectedNivel2!;
                                  } else if (selectedCategory.fungicidas) {
                                    prodCode = fungicidas.selectedNivel2!;
                                  } else if (selectedCategory.adjuvantes) {
                                    prodCode = adjuvantes.selectedNivel2!;
                                  } else if (selectedCategory.inoculantes) {
                                    prodCode = inoculantes.selectedNivel2!;
                                  } else if (selectedCategory.diesel) {
                                    prodCode = diesel.selectedNivel2!;
                                  } else if (selectedCategory
                                      .fertilizantesFoliares) {
                                    prodCode =
                                        fertilizantesFoliares.selectedNivel2!;
                                  }
                                } else if (addLev.level == 1) {
                                  if (selectedCategory.adubos) {
                                    prodCode = adubos.selectedNivel1!;
                                  } else if (selectedCategory.sementes) {
                                    prodCode = sementes.selectedNivel1!;
                                  } else if (selectedCategory.inseticidas) {
                                    prodCode = inseticidas.selectedNivel1!;
                                  } else if (selectedCategory.herbicidas) {
                                    prodCode = herbicidas.selectedNivel1!;
                                  } else if (selectedCategory.fungicidas) {
                                    prodCode = fungicidas.selectedNivel1!;
                                  } else if (selectedCategory.adjuvantes) {
                                    prodCode = adjuvantes.selectedNivel1!;
                                  } else if (selectedCategory.inoculantes) {
                                    prodCode = inoculantes.selectedNivel1!;
                                  } else if (selectedCategory.diesel) {
                                    prodCode = diesel.selectedNivel1!;
                                  } else if (selectedCategory
                                      .fertilizantesFoliares) {
                                    prodCode =
                                        fertilizantesFoliares.selectedNivel1!;
                                  }
                                }

                                int? numProd = await numberProduct.get(
                                    selectedCategory.categoryString,
                                    prodCode,
                                    addLev.level);

                                editProduct.update(
                                  selectedCategory.categoryString,
                                  numProd,
                                  {
                                    "name": product.name.text.toUpperCase(),
                                    "unity": product.unity.text.toUpperCase(),
                                  },
                                  addLev.level,
                                );

                                // ignore: use_build_context_synchronously
                                await alert.alert(
                                    context,
                                    "Produto editado com sucesso.",
                                    "SUCESSO!",
                                    AlertType.success);
                                resetControlls();
                                loading.resetIsLoading();
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
                                    "Erro ao editar produto.",
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
                                                  'Editar',
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
                                                  'Editar',
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
