import 'package:flutter/material.dart';
import 'package:flv_farm/pages/login/utils/auth_check.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:universal_io/io.dart';

import '../../../controllers/products/products_controller.dart';
import '../../../core/auth_service.dart';
import '../../../db/products/add_products/get_dad_infos.dart';
import '../../../db/products/get_quantity/get_quantity.dart';
import '../../../db/products/in_product/get_last_inputs.dart';
import '../../../db/products/in_product/in_product.dart';
import '../../../db/products/update_quantity/update_quantity.dart';
import '../../../db/products/utils/get_number_product.dart';
import '../../../providers/providers.dart';
import '../../../shared/alert.dart';
import '../../../shared/input.dart';
import '../../../shared/inputs_report.dart';
import '../../culture/start_culture/widgets/local_select.dart';
import '../products/widgets/drop_downs/products/drop_down_diesel_sequence.dart';
import '../products/widgets/drop_downs/products/drop_down_fertilizantes_foliares_sequence.dart';
import '../products/widgets/drop_downs/products/drop_down_inoculantes_sequence.dart';
import '../products/widgets/container_selected_info.dart';
import '../products/widgets/drop_downs/products/drop_down_adjuvantes_sequence.dart';
import '../products/widgets/drop_downs/products/drop_down_adubos_sequence.dart';
import '../products/widgets/drop_downs/products/drop_down_fungicidas_sequence.dart';
import '../products/widgets/drop_downs/products/drop_down_herbicidas_sequence.dart';
import '../products/widgets/drop_downs/products/drop_down_inseticidas_sequence.dart';
import '../products/widgets/drop_downs/products/drop_down_sementes_sequence.dart';

// ignore: must_be_immutable
class InProductPage extends HookConsumerWidget {
  InProductPage({super.key});

  String prodCode = "";
  Map<String, dynamic>? prodInfo = {};
  AlertWidget alert = AlertWidget();

  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  String toCamelCase(String input) {
    if (input.isEmpty) {
      return '';
    }

    List<String> words = input.split(' ');
    String camelCaseText = words[0].toLowerCase();

    for (int i = 1; i < words.length; i++) {
      String firstLetter = words[i][0].toUpperCase();
      String restOfWord = words[i].substring(1).toLowerCase();
      camelCaseText += firstLetter + restOfWord;
    }

    if (camelCaseText == "sãoJoão") {
      camelCaseText = "saoJoao";
    } else if (camelCaseText == "sãoJorge") {
      camelCaseText = "saoJorge";
    }

    return camelCaseText;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateProv = ref.watch(datePickerProvider);
    final auth = ref.watch(authServiceProvider);
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
    final local = ref.watch(localProvider);
    final isLoading = ref.watch(loadingCultureProvider);

    final inProduct = InProducts();
    final updateQuantity = UpdateQuantity();
    final getLenInputs = GetLastInputs();
    final numberProduct = GetNumberProduct();

    GetDadInfos getDadInfos = GetDadInfos();
    GetQuantity getQuantity = GetQuantity();
    TextEditingController dateController =
        TextEditingController(text: formatter.format(dateProv.date));

    Future<double> updateQuantityRecursive(
        ProductsController prod,
        int addLev,
        double credit,
        String category,
        String productCode,
        String productDad) async {
      int? n = await numberProduct.get(category, productCode, addLev);

      double currentQtt = await getQuantity.get(category, n, addLev);

      double newQuantity =
          double.parse((currentQtt + credit).toStringAsFixed(2));
      await updateQuantity.update(category, n, newQuantity, addLev, "quantity");

      return newQuantity;
    }

    // Future<double> updateQuantityLocalRecursive(
    //     ProductsController prod,
    //     int addLev,
    //     double credit,
    //     String category,
    //     String productCode,
    //     String productDad,
    //     String local) async {
    //   int? n = await numberProduct.get(category, productCode, addLev);

    //   local = toCamelCase(local);

    //   if (prod.name.text == "DIESEL") {
    //     local = "saoJoao";
    //   }

    //   double currentLocalQtt =
    //       await getQuantity.getLocal(category, n, addLev, local);

    //   double newLocalQuantity =
    //       double.parse((currentLocalQtt + credit).toStringAsFixed(2));
    //   await updateQuantity.update(category, n, newLocalQuantity, addLev, local);

    //   return newLocalQuantity;
    // }

    void resetControlls() {
      local.setSantaTerezinha();
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
      dateProv.setDate(DateTime.now());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de Produto"),
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
                      const SizedBox(height: 10),
                      const Text(
                        "Produto",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
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
                          input: true,
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
                          input: true,
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
                          input: true,
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
                          input: true,
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
                          input: true,
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
                          input: true,
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
                          input: true,
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
                          input: true,
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
                          input: true,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(thickness: 2),
                      const SizedBox(height: 20),
                      const Text(
                        "Dados da entrada",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              'Data: ${formatter.format(dateProv.date)}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                locale: const Locale('pt', 'BR'),
                                context: context,
                                initialDate: dateProv.date,
                                firstDate: DateTime(dateProv.date.year),
                                lastDate: DateTime(2100),
                              );
                              if (newDate == null) return;
                              dateProv.setDate(newDate);
                            },
                            icon: const Icon(Icons.date_range),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 300,
                        child: Input(
                          controller: product.quantity,
                          nameField: 'Quantidade (${product.unity.text})',
                          number: true,
                        ),
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () async {
                          if (!isLoading.isLoading) {
                            isLoading.setIsLoading();

                            addLev.setLevel(addLev.level);

                            if (selectedCategory.diesel) {
                              local.setSaoJoao();
                            }

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

                            if (prodCode.isEmpty) {
                              isLoading.resetIsLoading();
                              await alert.alert(
                                  context,
                                  "Informe o produto para ser registrada a entrada.",
                                  "ATENÇÃO!",
                                  AlertType.info);
                            } else if (product.quantity.text.isEmpty) {
                              isLoading.resetIsLoading();
                              await alert.alert(
                                  context,
                                  "Informe a quantidade de entrada do produto.",
                                  "ATENÇÃO!",
                                  AlertType.info);
                            } else {
                              try {
                                // QUANTAS ENTRADAS TEM REGISTRADAS
                                int lenInputs = await getLenInputs.get();
                                int newInputNumber = lenInputs + 1;

                                double newQtt = await updateQuantityRecursive(
                                  product,
                                  addLev.level,
                                  double.parse(product.quantity.text),
                                  selectedCategory.categoryString!,
                                  prodCode,
                                  product.dad.text,
                                );

                                // double newLocalQtt =
                                //     await updateQuantityLocalRecursive(
                                //   product,
                                //   addLev.level,
                                //   double.parse(product.quantity.text),
                                //   selectedCategory.categoryString!,
                                //   prodCode,
                                //   product.dad.text,
                                //   local.result,
                                // );

                                Map<String, dynamic>? dadInfos = {};

                                int? numDad;

                                if (!selectedCategory.diesel) {
                                  numDad = await numberProduct.get(
                                      selectedCategory.categoryString!,
                                      product.dad.text,
                                      addLev.level - 1);
                                  dadInfos = await getDadInfos.get(
                                      selectedCategory.categoryString!,
                                      addLev.level - 1,
                                      numDad!);

                                  inProduct.register(
                                      newInputNumber,
                                      auth,
                                      double.parse(product.quantity.text),
                                      product.name.text,
                                      prodCode,
                                      dateController.text,
                                      addLev.level.toString(),
                                      selectedCategory.categoryString!,
                                      newQtt,
                                      // newLocalQtt,
                                      local.result,
                                      dadInfos!["name"],
                                      product.unity.text);
                                } else {
                                  inProduct.register(
                                      newInputNumber,
                                      auth,
                                      double.parse(product.quantity.text),
                                      product.name.text,
                                      prodCode,
                                      dateController.text,
                                      addLev.level.toString(),
                                      selectedCategory.categoryString!,
                                      newQtt,
                                      // newLocalQtt,
                                      local.result,
                                      "",
                                      product.unity.text);
                                }
                                isLoading.resetIsLoading();
                                resetControlls();
                                // ignore: use_build_context_synchronously
                                await alert.alert(
                                    context,
                                    "Registro de entrada efetuado com sucesso.",
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
                                isLoading.resetIsLoading();
                                // ignore: use_build_context_synchronously
                                alert.alert(
                                    context,
                                    "Erro ao registrar entrada de produto.",
                                    "ERRO!",
                                    AlertType.error);
                              }
                            }
                            isLoading.resetIsLoading();
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
                                    const Expanded(
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 32),
                                          child: Text(
                                            'Registrar Entrada',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: isLoading.isLoading
                                          ? Lottie.asset('assets/loading.json',
                                              height: 50, width: 50)
                                          : const Icon(Icons.arrow_forward,
                                              color: Colors.white, size: 32),
                                    )
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
                                    const Expanded(
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 32),
                                          child: Text(
                                            'Registrar Entrada',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: isLoading.isLoading
                                          ? Lottie.asset('assets/loading.json',
                                              height: 50, width: 50)
                                          : const Icon(Icons.arrow_forward,
                                              color: Colors.white, size: 32),
                                    )
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
