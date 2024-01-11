import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flv_farm/pages/login/utils/auth_check.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:universal_io/io.dart';

import '../../../../providers/providers.dart';
import '../../../../shared/alert.dart';
import '../../../controllers/products/products_controller.dart';
import '../../../core/auth_service.dart';
import '../../../db/products/add_products/get_dad_infos.dart';
import '../../../db/cultures/finish_culture/finish_culture_phases.dart';
import '../../../db/products/get_quantity/get_quantity.dart';
import '../../../db/products/out_product/get_last_outputs.dart';
import '../../../db/products/out_product/out_products.dart';
import '../../../db/cultures/start_culture/get_last_id_cultures.dart';
import '../../../db/cultures/start_culture/start_culture.dart';
import '../../../db/products/update_quantity/update_quantity.dart';
import '../../../db/products/utils/get_name_product.dart';
import '../../../db/products/utils/get_number_product.dart';
import '../../../shared/input.dart';
import '../../../shared/inputs_report.dart';
import '../../host/vehicles/widgets/drop_down_vehicles.dart';
import '../../login/utils/organize_culture_products.dart';
import 'local_delivery_select.dart';
import 'product_widget.dart';

// ignore: must_be_immutable
class CultureProductsInfoPage extends HookConsumerWidget {
  CultureProductsInfoPage({super.key});

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
    final prod1 = ref.watch(prod1Provider);
    final prod2 = ref.watch(prod2Provider);
    final prod3 = ref.watch(prod3Provider);
    final prod4 = ref.watch(prod4Provider);
    final prod5 = ref.watch(prod5Provider);
    final prod6 = ref.watch(prod6Provider);
    final prod7 = ref.watch(prod7Provider);
    final prod8 = ref.watch(prod8Provider);
    final prod9 = ref.watch(prod9Provider);
    final prod10 = ref.watch(prod10Provider);
    final selectedCategory1 = ref.watch(selectedCategory1Provider);
    final selectedCategory2 = ref.watch(selectedCategory2Provider);
    final selectedCategory3 = ref.watch(selectedCategory3Provider);
    final selectedCategory4 = ref.watch(selectedCategory4Provider);
    final selectedCategory5 = ref.watch(selectedCategory5Provider);
    final selectedCategory6 = ref.watch(selectedCategory6Provider);
    final selectedCategory7 = ref.watch(selectedCategory7Provider);
    final selectedCategory8 = ref.watch(selectedCategory8Provider);
    final selectedCategory9 = ref.watch(selectedCategory9Provider);
    final selectedCategory10 = ref.watch(selectedCategory10Provider);
    final adubos1 = ref.watch(adubos1Provider);
    final adubos2 = ref.watch(adubos2Provider);
    final adubos3 = ref.watch(adubos3Provider);
    final adubos4 = ref.watch(adubos4Provider);
    final adubos5 = ref.watch(adubos5Provider);
    final adubos6 = ref.watch(adubos6Provider);
    final adubos7 = ref.watch(adubos7Provider);
    final adubos8 = ref.watch(adubos8Provider);
    final adubos9 = ref.watch(adubos9Provider);
    final adubos10 = ref.watch(adubos10Provider);
    final sementes1 = ref.watch(sementes1Provider);
    final sementes2 = ref.watch(sementes2Provider);
    final sementes3 = ref.watch(sementes3Provider);
    final sementes4 = ref.watch(sementes4Provider);
    final sementes5 = ref.watch(sementes5Provider);
    final sementes6 = ref.watch(sementes6Provider);
    final sementes7 = ref.watch(sementes7Provider);
    final sementes8 = ref.watch(sementes8Provider);
    final sementes9 = ref.watch(sementes9Provider);
    final sementes10 = ref.watch(sementes10Provider);
    final inseticidas1 = ref.watch(inseticidas1Provider);
    final inseticidas2 = ref.watch(inseticidas2Provider);
    final inseticidas3 = ref.watch(inseticidas3Provider);
    final inseticidas4 = ref.watch(inseticidas4Provider);
    final inseticidas5 = ref.watch(inseticidas5Provider);
    final inseticidas6 = ref.watch(inseticidas6Provider);
    final inseticidas7 = ref.watch(inseticidas7Provider);
    final inseticidas8 = ref.watch(inseticidas8Provider);
    final inseticidas9 = ref.watch(inseticidas9Provider);
    final inseticidas10 = ref.watch(inseticidas10Provider);
    final herbicidas1 = ref.watch(herbicidas1Provider);
    final herbicidas2 = ref.watch(herbicidas2Provider);
    final herbicidas3 = ref.watch(herbicidas3Provider);
    final herbicidas4 = ref.watch(herbicidas4Provider);
    final herbicidas5 = ref.watch(herbicidas5Provider);
    final herbicidas6 = ref.watch(herbicidas6Provider);
    final herbicidas7 = ref.watch(herbicidas7Provider);
    final herbicidas8 = ref.watch(herbicidas8Provider);
    final herbicidas9 = ref.watch(herbicidas9Provider);
    final herbicidas10 = ref.watch(herbicidas10Provider);
    final fungicidas1 = ref.watch(fungicidas1Provider);
    final fungicidas2 = ref.watch(fungicidas2Provider);
    final fungicidas3 = ref.watch(fungicidas3Provider);
    final fungicidas4 = ref.watch(fungicidas4Provider);
    final fungicidas5 = ref.watch(fungicidas5Provider);
    final fungicidas6 = ref.watch(fungicidas6Provider);
    final fungicidas7 = ref.watch(fungicidas7Provider);
    final fungicidas8 = ref.watch(fungicidas8Provider);
    final fungicidas9 = ref.watch(fungicidas9Provider);
    final fungicidas10 = ref.watch(fungicidas10Provider);
    final adjuvantes1 = ref.watch(adjuvantes1Provider);
    final adjuvantes2 = ref.watch(adjuvantes2Provider);
    final adjuvantes3 = ref.watch(adjuvantes3Provider);
    final adjuvantes4 = ref.watch(adjuvantes4Provider);
    final adjuvantes5 = ref.watch(adjuvantes5Provider);
    final adjuvantes6 = ref.watch(adjuvantes6Provider);
    final adjuvantes7 = ref.watch(adjuvantes7Provider);
    final adjuvantes8 = ref.watch(adjuvantes8Provider);
    final adjuvantes9 = ref.watch(adjuvantes9Provider);
    final adjuvantes10 = ref.watch(adjuvantes10Provider);
    final inoculantes1 = ref.watch(inoculantes1Provider);
    final inoculantes2 = ref.watch(inoculantes2Provider);
    final inoculantes3 = ref.watch(inoculantes3Provider);
    final inoculantes4 = ref.watch(inoculantes4Provider);
    final inoculantes5 = ref.watch(inoculantes5Provider);
    final inoculantes6 = ref.watch(inoculantes6Provider);
    final inoculantes7 = ref.watch(inoculantes7Provider);
    final inoculantes8 = ref.watch(inoculantes8Provider);
    final inoculantes9 = ref.watch(inoculantes9Provider);
    final inoculantes10 = ref.watch(inoculantes10Provider);
    final diesel1 = ref.watch(diesel1Provider);
    final diesel2 = ref.watch(diesel2Provider);
    final diesel3 = ref.watch(diesel3Provider);
    final diesel4 = ref.watch(diesel4Provider);
    final diesel5 = ref.watch(diesel5Provider);
    final diesel6 = ref.watch(diesel6Provider);
    final diesel7 = ref.watch(diesel7Provider);
    final diesel8 = ref.watch(diesel8Provider);
    final diesel9 = ref.watch(diesel9Provider);
    final diesel10 = ref.watch(diesel10Provider);
    final fertilizantesFoliares1 = ref.watch(fertilizantesFoliares1Provider);
    final fertilizantesFoliares2 = ref.watch(fertilizantesFoliares2Provider);
    final fertilizantesFoliares3 = ref.watch(fertilizantesFoliares3Provider);
    final fertilizantesFoliares4 = ref.watch(fertilizantesFoliares4Provider);
    final fertilizantesFoliares5 = ref.watch(fertilizantesFoliares5Provider);
    final fertilizantesFoliares6 = ref.watch(fertilizantesFoliares6Provider);
    final fertilizantesFoliares7 = ref.watch(fertilizantesFoliares7Provider);
    final fertilizantesFoliares8 = ref.watch(fertilizantesFoliares8Provider);
    final fertilizantesFoliares9 = ref.watch(fertilizantesFoliares9Provider);
    final fertilizantesFoliares10 = ref.watch(fertilizantesFoliares10Provider);
    final addLev1 = ref.watch(addLevel1Provider);
    final addLev2 = ref.watch(addLevel2Provider);
    final addLev3 = ref.watch(addLevel3Provider);
    final addLev4 = ref.watch(addLevel4Provider);
    final addLev5 = ref.watch(addLevel5Provider);
    final addLev6 = ref.watch(addLevel6Provider);
    final addLev7 = ref.watch(addLevel7Provider);
    final addLev8 = ref.watch(addLevel8Provider);
    final addLev9 = ref.watch(addLevel9Provider);
    final addLev10 = ref.watch(addLevel10Provider);
    final phaseOption = ref.watch(selectPhaseProvider);
    final dateProv = ref.watch(datePickerProvider);
    final hourProv = ref.watch(hourPickerProvider);
    final amountProducts = ref.watch(amountProductsProvider);
    final auth = ref.watch(authServiceProvider.notifier);
    final culture = ref.watch(cultureProvider);
    final cultureType = ref.watch(cultureTypeProvider);
    final cultureStage = ref.watch(cultureStageProvider);
    final userCultures = ref.watch(userCulturesProvider);
    final indexCultureSelected = ref.watch(indexCultureSelectedProvider);
    final colheita = ref.watch(colheitaProvider);
    final vehicles = ref.watch(vehiclesProvider);
    final local = ref.watch(localProvider);
    final isLoading = ref.watch(loadingCultureProvider);
    final locals = ref.watch(localsProvider);

    TextEditingController dateController =
        TextEditingController(text: formatter.format(dateProv.date));
    TextEditingController hourController = TextEditingController(
        text:
            "${hourProv.hour.hour.toString().padLeft(2, '0')}:${hourProv.hour.minute.toString().padLeft(2, '0')}");

    OrganizeCultureProducts organizeCultureProducts = OrganizeCultureProducts();
    RegisterCulture registerCulture = RegisterCulture();
    GetLastIdCultures getLastIdCultures = GetLastIdCultures();
    UpdateQuantity updateQuantity = UpdateQuantity();
    GetDadInfos getDadInfos = GetDadInfos();
    GetNameProduct getNameProduct = GetNameProduct();
    FinishCulturePhases finishCulturePhases = FinishCulturePhases();
    GetQuantity getQuantity = GetQuantity();

    final outProduct = OutProducts();
    final getLastOutputs = GetLastOutputs();
    final numberProduct = GetNumberProduct();

    Future<double> updateQuantityRecursive(
        ProductsController prod, int addLev, double debit) async {
      String category = prod.category.text;

      int? n = await numberProduct.get(category, prod.code.text, addLev);

      double currentQtt = await getQuantity.get(category, n, addLev);

      double newQuantity =
          double.parse((currentQtt - debit).toStringAsFixed(2));
      await updateQuantity.update(category, n, newQuantity, addLev, "quantity");

      return newQuantity;
    }

    // Future<double> updateQuantityLocalRecursive(
    //     ProductsController prod, int addLev, double debit, String local) async {
    //   String category = prod.category.text;

    //   local = toCamelCase(local);

    //   int? n = await numberProduct.get(category, prod.code.text, addLev);
    //   double currentLocalQtt =
    //       await getQuantity.getLocal(category, n, addLev, local);

    //   // double newLocalQuantity =
    //   //     double.parse((currentLocalQtt - debit).toStringAsFixed(2));
    //   await updateQuantity.update(category, n, newLocalQuantity, addLev, local);

    //   return newLocalQuantity;
    // }

    void resetControlls() {
      hourProv.setDefaultHour();
      culture.resetAlqueres();
      colheita.resetControllers();
      vehicles.resetControllers();
      amountProducts.setAmount(1);

      addLev1.resetLevel();
      addLev2.resetLevel();
      addLev3.resetLevel();
      addLev4.resetLevel();
      addLev5.resetLevel();
      addLev6.resetLevel();
      addLev7.resetLevel();
      addLev8.resetLevel();
      addLev9.resetLevel();
      addLev10.resetLevel();

      adubos1.setNoSelection();
      adubos2.setNoSelection();
      adubos3.setNoSelection();
      adubos4.setNoSelection();
      adubos5.setNoSelection();
      adubos6.setNoSelection();
      adubos7.setNoSelection();
      adubos8.setNoSelection();
      adubos9.setNoSelection();
      adubos10.setNoSelection();
      sementes1.setNoSelection();
      sementes2.setNoSelection();
      sementes3.setNoSelection();
      sementes4.setNoSelection();
      sementes5.setNoSelection();
      sementes6.setNoSelection();
      sementes7.setNoSelection();
      sementes8.setNoSelection();
      sementes9.setNoSelection();
      sementes10.setNoSelection();
      inseticidas1.setNoSelection();
      inseticidas2.setNoSelection();
      inseticidas3.setNoSelection();
      inseticidas4.setNoSelection();
      inseticidas5.setNoSelection();
      inseticidas6.setNoSelection();
      inseticidas7.setNoSelection();
      inseticidas8.setNoSelection();
      inseticidas9.setNoSelection();
      inseticidas10.setNoSelection();
      herbicidas1.setNoSelection();
      herbicidas2.setNoSelection();
      herbicidas3.setNoSelection();
      herbicidas4.setNoSelection();
      herbicidas5.setNoSelection();
      herbicidas6.setNoSelection();
      herbicidas7.setNoSelection();
      herbicidas8.setNoSelection();
      herbicidas9.setNoSelection();
      herbicidas10.setNoSelection();
      fungicidas1.setNoSelection();
      fungicidas2.setNoSelection();
      fungicidas3.setNoSelection();
      fungicidas4.setNoSelection();
      fungicidas5.setNoSelection();
      fungicidas6.setNoSelection();
      fungicidas7.setNoSelection();
      fungicidas8.setNoSelection();
      fungicidas9.setNoSelection();
      fungicidas10.setNoSelection();
      adjuvantes1.setNoSelection();
      adjuvantes2.setNoSelection();
      adjuvantes3.setNoSelection();
      adjuvantes4.setNoSelection();
      adjuvantes5.setNoSelection();
      adjuvantes6.setNoSelection();
      adjuvantes7.setNoSelection();
      adjuvantes8.setNoSelection();
      adjuvantes9.setNoSelection();
      adjuvantes10.setNoSelection();
      inoculantes1.setNoSelection();
      inoculantes2.setNoSelection();
      inoculantes3.setNoSelection();
      inoculantes4.setNoSelection();
      inoculantes5.setNoSelection();
      inoculantes6.setNoSelection();
      inoculantes7.setNoSelection();
      inoculantes8.setNoSelection();
      inoculantes9.setNoSelection();
      inoculantes10.setNoSelection();
      diesel1.setNoSelection();
      diesel2.setNoSelection();
      diesel3.setNoSelection();
      diesel4.setNoSelection();
      diesel5.setNoSelection();
      diesel6.setNoSelection();
      diesel7.setNoSelection();
      diesel8.setNoSelection();
      diesel9.setNoSelection();
      diesel10.setNoSelection();
      fertilizantesFoliares1.setNoSelection();
      fertilizantesFoliares2.setNoSelection();
      fertilizantesFoliares3.setNoSelection();
      fertilizantesFoliares4.setNoSelection();
      fertilizantesFoliares5.setNoSelection();
      fertilizantesFoliares6.setNoSelection();
      fertilizantesFoliares7.setNoSelection();
      fertilizantesFoliares8.setNoSelection();
      fertilizantesFoliares9.setNoSelection();
      fertilizantesFoliares10.setNoSelection();

      adubos1.resetAll();
      adubos2.resetAll();
      adubos3.resetAll();
      adubos4.resetAll();
      adubos5.resetAll();
      adubos6.resetAll();
      adubos7.resetAll();
      adubos8.resetAll();
      adubos9.resetAll();
      adubos10.resetAll();
      sementes1.resetAll();
      sementes2.resetAll();
      sementes3.resetAll();
      sementes4.resetAll();
      sementes5.resetAll();
      sementes6.resetAll();
      sementes7.resetAll();
      sementes8.resetAll();
      sementes9.resetAll();
      sementes10.resetAll();
      inseticidas1.resetAll();
      inseticidas2.resetAll();
      inseticidas3.resetAll();
      inseticidas4.resetAll();
      inseticidas5.resetAll();
      inseticidas6.resetAll();
      inseticidas7.resetAll();
      inseticidas8.resetAll();
      inseticidas9.resetAll();
      inseticidas10.resetAll();
      herbicidas1.resetAll();
      herbicidas2.resetAll();
      herbicidas3.resetAll();
      herbicidas4.resetAll();
      herbicidas5.resetAll();
      herbicidas6.resetAll();
      herbicidas7.resetAll();
      herbicidas8.resetAll();
      herbicidas9.resetAll();
      herbicidas10.resetAll();
      fungicidas1.resetAll();
      fungicidas2.resetAll();
      fungicidas3.resetAll();
      fungicidas4.resetAll();
      fungicidas5.resetAll();
      fungicidas6.resetAll();
      fungicidas7.resetAll();
      fungicidas8.resetAll();
      fungicidas9.resetAll();
      fungicidas10.resetAll();
      adjuvantes1.resetAll();
      adjuvantes2.resetAll();
      adjuvantes3.resetAll();
      adjuvantes4.resetAll();
      adjuvantes5.resetAll();
      adjuvantes6.resetAll();
      adjuvantes7.resetAll();
      adjuvantes8.resetAll();
      adjuvantes9.resetAll();
      adjuvantes10.resetAll();
      inoculantes1.resetAll();
      inoculantes2.resetAll();
      inoculantes3.resetAll();
      inoculantes4.resetAll();
      inoculantes5.resetAll();
      inoculantes6.resetAll();
      inoculantes7.resetAll();
      inoculantes8.resetAll();
      inoculantes9.resetAll();
      inoculantes10.resetAll();
      diesel1.resetAll();
      diesel2.resetAll();
      diesel3.resetAll();
      diesel4.resetAll();
      diesel5.resetAll();
      diesel6.resetAll();
      diesel7.resetAll();
      diesel8.resetAll();
      diesel9.resetAll();
      diesel10.resetAll();
      fertilizantesFoliares1.resetAll();
      fertilizantesFoliares2.resetAll();
      fertilizantesFoliares3.resetAll();
      fertilizantesFoliares4.resetAll();
      fertilizantesFoliares5.resetAll();
      fertilizantesFoliares6.resetAll();
      fertilizantesFoliares7.resetAll();
      fertilizantesFoliares8.resetAll();
      fertilizantesFoliares9.resetAll();
      fertilizantesFoliares10.resetAll();

      prod1.resetControllers();
      prod2.resetControllers();
      prod3.resetControllers();
      prod4.resetControllers();
      prod5.resetControllers();
      prod6.resetControllers();
      prod7.resetControllers();
      prod8.resetControllers();
      prod9.resetControllers();
      prod10.resetControllers();
      selectedCategory1.resetControllers();
      selectedCategory2.resetControllers();
      selectedCategory3.resetControllers();
      selectedCategory4.resetControllers();
      selectedCategory5.resetControllers();
      selectedCategory6.resetControllers();
      selectedCategory7.resetControllers();
      selectedCategory8.resetControllers();
      selectedCategory9.resetControllers();
      selectedCategory10.resetControllers();
      dateProv.setDate(DateTime.now());
      locals.resetSelected();
    }

    return Scaffold(
      appBar: AppBar(
        title: cultureStage.stage == "start"
            ? const Text(
                "INÍCIO DE CULTURA",
                style: TextStyle(color: Colors.white),
              )
            : (cultureStage.stage == "finish")
                ? const Text(
                    "FIM DE CULTURA",
                    style: TextStyle(color: Colors.white),
                  )
                : const Text(
                    "CONTINUAÇÃO DE CULTURA",
                    style: TextStyle(color: Colors.white),
                  ),
        leading: IconButton(
          onPressed: () {
            resetControlls();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        titleTextStyle: const TextStyle(fontSize: 16),
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
                  child: phaseOption.phase != "COLHEITA"
                      ? Column(
                          children: [
                            SizedBox(
                              width: 300,
                              child: Text(
                                "${culture.name.text} - ${phaseOption.phase}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 270,
                                  child: Center(
                                    child: Text(
                                      'Data da operação: ${formatter.format(dateProv.date)}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 270,
                                  child: Center(
                                    child: Text(
                                      'Hora da operação: ${hourProv.hour.format(context)}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                      context: context,
                                      initialTime: hourProv.hour,
                                    );
                                    if (pickedTime == null) return;
                                    hourProv.setHour(pickedTime);
                                  },
                                  icon: const Icon(Icons.timer_sharp),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 250,
                              child: Input(
                                controller: culture.alqueres,
                                nameField: 'Nº de Alqueres',
                                number: true,
                                culture: culture,
                                prod1: prod1,
                                prod2: prod2,
                                prod3: prod3,
                                prod4: prod4,
                                prod5: prod5,
                                prod6: prod6,
                                prod7: prod7,
                                prod8: prod8,
                                prod9: prod9,
                                prod10: prod10,
                              ),
                            ),
                            ProductWidget(
                              selectedCategory: selectedCategory1,
                              selectedCategory1: selectedCategory1,
                              selectedCategory2: selectedCategory2,
                              selectedCategory3: selectedCategory3,
                              selectedCategory4: selectedCategory4,
                              selectedCategory5: selectedCategory5,
                              selectedCategory6: selectedCategory6,
                              selectedCategory7: selectedCategory7,
                              selectedCategory8: selectedCategory8,
                              selectedCategory9: selectedCategory9,
                              selectedCategory10: selectedCategory10,
                              adubos1: adubos1,
                              adubos2: adubos2,
                              adubos3: adubos3,
                              adubos4: adubos4,
                              adubos5: adubos5,
                              adubos6: adubos6,
                              adubos7: adubos7,
                              adubos8: adubos8,
                              adubos9: adubos9,
                              sementes1: sementes1,
                              sementes2: sementes2,
                              sementes3: sementes3,
                              sementes4: sementes4,
                              sementes5: sementes5,
                              sementes6: sementes6,
                              sementes7: sementes7,
                              sementes8: sementes8,
                              sementes9: sementes9,
                              inseticidas1: inseticidas1,
                              inseticidas2: inseticidas2,
                              inseticidas3: inseticidas3,
                              inseticidas4: inseticidas4,
                              inseticidas5: inseticidas5,
                              inseticidas6: inseticidas6,
                              inseticidas7: inseticidas7,
                              inseticidas8: inseticidas8,
                              inseticidas9: inseticidas9,
                              herbicidas1: herbicidas1,
                              herbicidas2: herbicidas2,
                              herbicidas3: herbicidas3,
                              herbicidas4: herbicidas4,
                              herbicidas5: herbicidas5,
                              herbicidas6: herbicidas6,
                              herbicidas7: herbicidas7,
                              herbicidas8: herbicidas8,
                              herbicidas9: herbicidas9,
                              fungicidas1: fungicidas1,
                              fungicidas2: fungicidas2,
                              fungicidas3: fungicidas3,
                              fungicidas4: fungicidas4,
                              fungicidas5: fungicidas5,
                              fungicidas6: fungicidas6,
                              fungicidas7: fungicidas7,
                              fungicidas8: fungicidas8,
                              fungicidas9: fungicidas9,
                              adjuvantes1: adjuvantes1,
                              adjuvantes2: adjuvantes2,
                              adjuvantes3: adjuvantes3,
                              adjuvantes4: adjuvantes4,
                              adjuvantes5: adjuvantes5,
                              adjuvantes6: adjuvantes6,
                              adjuvantes7: adjuvantes7,
                              adjuvantes8: adjuvantes8,
                              adjuvantes9: adjuvantes9,
                              inoculantes1: inoculantes1,
                              inoculantes2: inoculantes2,
                              inoculantes3: inoculantes3,
                              inoculantes4: inoculantes4,
                              inoculantes5: inoculantes5,
                              inoculantes6: inoculantes6,
                              inoculantes7: inoculantes7,
                              inoculantes8: inoculantes8,
                              inoculantes9: inoculantes9,
                              diesel1: diesel1,
                              diesel2: diesel2,
                              diesel3: diesel3,
                              diesel4: diesel4,
                              diesel5: diesel5,
                              diesel6: diesel6,
                              diesel7: diesel7,
                              diesel8: diesel8,
                              diesel9: diesel9,
                              fertilizantesFoliares1: fertilizantesFoliares1,
                              fertilizantesFoliares2: fertilizantesFoliares2,
                              fertilizantesFoliares3: fertilizantesFoliares3,
                              fertilizantesFoliares4: fertilizantesFoliares4,
                              fertilizantesFoliares5: fertilizantesFoliares5,
                              fertilizantesFoliares6: fertilizantesFoliares6,
                              fertilizantesFoliares7: fertilizantesFoliares7,
                              fertilizantesFoliares8: fertilizantesFoliares8,
                              fertilizantesFoliares9: fertilizantesFoliares9,
                              prod: "Produto 1",
                              product: prod1,
                              prod1: prod1,
                              prod2: prod2,
                              prod3: prod3,
                              prod4: prod4,
                              prod5: prod5,
                              prod6: prod6,
                              prod7: prod7,
                              prod8: prod8,
                              prod9: prod9,
                              prod10: prod10,
                              adjuvantes: adjuvantes1,
                              adubos: adubos1,
                              fungicidas: fungicidas1,
                              herbicidas: herbicidas1,
                              inseticidas: inseticidas1,
                              sementes: sementes1,
                              inoculantes: inoculantes1,
                              diesel: diesel1,
                              fertilizantesFoliares: fertilizantesFoliares1,
                              num: 1,
                              addLev: addLev1,
                              culture: culture,
                              isCulture: culture.isCulture,
                              amount: amountProducts,
                            ),
                            Visibility(
                              visible: (amountProducts.amount >= 2),
                              child: ProductWidget(
                                selectedCategory: selectedCategory2,
                                selectedCategory1: selectedCategory1,
                                selectedCategory2: selectedCategory2,
                                selectedCategory3: selectedCategory3,
                                selectedCategory4: selectedCategory4,
                                selectedCategory5: selectedCategory5,
                                selectedCategory6: selectedCategory6,
                                selectedCategory7: selectedCategory7,
                                selectedCategory8: selectedCategory8,
                                selectedCategory9: selectedCategory9,
                                selectedCategory10: selectedCategory10,
                                adubos1: adubos1,
                                adubos2: adubos2,
                                adubos3: adubos3,
                                adubos4: adubos4,
                                adubos5: adubos5,
                                adubos6: adubos6,
                                adubos7: adubos7,
                                adubos8: adubos8,
                                adubos9: adubos9,
                                sementes1: sementes1,
                                sementes2: sementes2,
                                sementes3: sementes3,
                                sementes4: sementes4,
                                sementes5: sementes5,
                                sementes6: sementes6,
                                sementes7: sementes7,
                                sementes8: sementes8,
                                sementes9: sementes9,
                                inseticidas1: inseticidas1,
                                inseticidas2: inseticidas2,
                                inseticidas3: inseticidas3,
                                inseticidas4: inseticidas4,
                                inseticidas5: inseticidas5,
                                inseticidas6: inseticidas6,
                                inseticidas7: inseticidas7,
                                inseticidas8: inseticidas8,
                                inseticidas9: inseticidas9,
                                herbicidas1: herbicidas1,
                                herbicidas2: herbicidas2,
                                herbicidas3: herbicidas3,
                                herbicidas4: herbicidas4,
                                herbicidas5: herbicidas5,
                                herbicidas6: herbicidas6,
                                herbicidas7: herbicidas7,
                                herbicidas8: herbicidas8,
                                herbicidas9: herbicidas9,
                                fungicidas1: fungicidas1,
                                fungicidas2: fungicidas2,
                                fungicidas3: fungicidas3,
                                fungicidas4: fungicidas4,
                                fungicidas5: fungicidas5,
                                fungicidas6: fungicidas6,
                                fungicidas7: fungicidas7,
                                fungicidas8: fungicidas8,
                                fungicidas9: fungicidas9,
                                adjuvantes1: adjuvantes1,
                                adjuvantes2: adjuvantes2,
                                adjuvantes3: adjuvantes3,
                                adjuvantes4: adjuvantes4,
                                adjuvantes5: adjuvantes5,
                                adjuvantes6: adjuvantes6,
                                adjuvantes7: adjuvantes7,
                                adjuvantes8: adjuvantes8,
                                adjuvantes9: adjuvantes9,
                                inoculantes1: inoculantes1,
                                inoculantes2: inoculantes2,
                                inoculantes3: inoculantes3,
                                inoculantes4: inoculantes4,
                                inoculantes5: inoculantes5,
                                inoculantes6: inoculantes6,
                                inoculantes7: inoculantes7,
                                inoculantes8: inoculantes8,
                                inoculantes9: inoculantes9,
                                diesel1: diesel1,
                                diesel2: diesel2,
                                diesel3: diesel3,
                                diesel4: diesel4,
                                diesel5: diesel5,
                                diesel6: diesel6,
                                diesel7: diesel7,
                                diesel8: diesel8,
                                diesel9: diesel9,
                                fertilizantesFoliares1: fertilizantesFoliares1,
                                fertilizantesFoliares2: fertilizantesFoliares2,
                                fertilizantesFoliares3: fertilizantesFoliares3,
                                fertilizantesFoliares4: fertilizantesFoliares4,
                                fertilizantesFoliares5: fertilizantesFoliares5,
                                fertilizantesFoliares6: fertilizantesFoliares6,
                                fertilizantesFoliares7: fertilizantesFoliares7,
                                fertilizantesFoliares8: fertilizantesFoliares8,
                                fertilizantesFoliares9: fertilizantesFoliares9,
                                prod: "Produto 2",
                                product: prod2,
                                prod1: prod1,
                                prod2: prod2,
                                prod3: prod3,
                                prod4: prod4,
                                prod5: prod5,
                                prod6: prod6,
                                prod7: prod7,
                                prod8: prod8,
                                prod9: prod9,
                                prod10: prod10,
                                adjuvantes: adjuvantes2,
                                adubos: adubos2,
                                fungicidas: fungicidas2,
                                herbicidas: herbicidas2,
                                inseticidas: inseticidas2,
                                sementes: sementes2,
                                inoculantes: inoculantes2,
                                diesel: diesel2,
                                fertilizantesFoliares: fertilizantesFoliares2,
                                num: 2,
                                addLev: addLev2,
                                culture: culture,
                                isCulture: culture.isCulture,
                                amount: amountProducts,
                              ),
                            ),
                            Visibility(
                              visible: (amountProducts.amount >= 3),
                              child: ProductWidget(
                                selectedCategory: selectedCategory3,
                                selectedCategory1: selectedCategory1,
                                selectedCategory2: selectedCategory2,
                                selectedCategory3: selectedCategory3,
                                selectedCategory4: selectedCategory4,
                                selectedCategory5: selectedCategory5,
                                selectedCategory6: selectedCategory6,
                                selectedCategory7: selectedCategory7,
                                selectedCategory8: selectedCategory8,
                                selectedCategory9: selectedCategory9,
                                selectedCategory10: selectedCategory10,
                                adubos1: adubos1,
                                adubos2: adubos2,
                                adubos3: adubos3,
                                adubos4: adubos4,
                                adubos5: adubos5,
                                adubos6: adubos6,
                                adubos7: adubos7,
                                adubos8: adubos8,
                                adubos9: adubos9,
                                sementes1: sementes1,
                                sementes2: sementes2,
                                sementes3: sementes3,
                                sementes4: sementes4,
                                sementes5: sementes5,
                                sementes6: sementes6,
                                sementes7: sementes7,
                                sementes8: sementes8,
                                sementes9: sementes9,
                                inseticidas1: inseticidas1,
                                inseticidas2: inseticidas2,
                                inseticidas3: inseticidas3,
                                inseticidas4: inseticidas4,
                                inseticidas5: inseticidas5,
                                inseticidas6: inseticidas6,
                                inseticidas7: inseticidas7,
                                inseticidas8: inseticidas8,
                                inseticidas9: inseticidas9,
                                herbicidas1: herbicidas1,
                                herbicidas2: herbicidas2,
                                herbicidas3: herbicidas3,
                                herbicidas4: herbicidas4,
                                herbicidas5: herbicidas5,
                                herbicidas6: herbicidas6,
                                herbicidas7: herbicidas7,
                                herbicidas8: herbicidas8,
                                herbicidas9: herbicidas9,
                                fungicidas1: fungicidas1,
                                fungicidas2: fungicidas2,
                                fungicidas3: fungicidas3,
                                fungicidas4: fungicidas4,
                                fungicidas5: fungicidas5,
                                fungicidas6: fungicidas6,
                                fungicidas7: fungicidas7,
                                fungicidas8: fungicidas8,
                                fungicidas9: fungicidas9,
                                adjuvantes1: adjuvantes1,
                                adjuvantes2: adjuvantes2,
                                adjuvantes3: adjuvantes3,
                                adjuvantes4: adjuvantes4,
                                adjuvantes5: adjuvantes5,
                                adjuvantes6: adjuvantes6,
                                adjuvantes7: adjuvantes7,
                                adjuvantes8: adjuvantes8,
                                adjuvantes9: adjuvantes9,
                                inoculantes1: inoculantes1,
                                inoculantes2: inoculantes2,
                                inoculantes3: inoculantes3,
                                inoculantes4: inoculantes4,
                                inoculantes5: inoculantes5,
                                inoculantes6: inoculantes6,
                                inoculantes7: inoculantes7,
                                inoculantes8: inoculantes8,
                                inoculantes9: inoculantes9,
                                diesel1: diesel1,
                                diesel2: diesel2,
                                diesel3: diesel3,
                                diesel4: diesel4,
                                diesel5: diesel5,
                                diesel6: diesel6,
                                diesel7: diesel7,
                                diesel8: diesel8,
                                diesel9: diesel9,
                                fertilizantesFoliares1: fertilizantesFoliares1,
                                fertilizantesFoliares2: fertilizantesFoliares2,
                                fertilizantesFoliares3: fertilizantesFoliares3,
                                fertilizantesFoliares4: fertilizantesFoliares4,
                                fertilizantesFoliares5: fertilizantesFoliares5,
                                fertilizantesFoliares6: fertilizantesFoliares6,
                                fertilizantesFoliares7: fertilizantesFoliares7,
                                fertilizantesFoliares8: fertilizantesFoliares8,
                                fertilizantesFoliares9: fertilizantesFoliares9,
                                prod: "Produto 3",
                                product: prod3,
                                prod1: prod1,
                                prod2: prod2,
                                prod3: prod3,
                                prod4: prod4,
                                prod5: prod5,
                                prod6: prod6,
                                prod7: prod7,
                                prod8: prod8,
                                prod9: prod9,
                                prod10: prod10,
                                adjuvantes: adjuvantes3,
                                adubos: adubos3,
                                fungicidas: fungicidas3,
                                herbicidas: herbicidas3,
                                inseticidas: inseticidas3,
                                sementes: sementes3,
                                inoculantes: inoculantes3,
                                diesel: diesel3,
                                fertilizantesFoliares: fertilizantesFoliares3,
                                num: 3,
                                addLev: addLev3,
                                culture: culture,
                                isCulture: culture.isCulture,
                                amount: amountProducts,
                              ),
                            ),
                            Visibility(
                              visible: (amountProducts.amount >= 4),
                              child: ProductWidget(
                                selectedCategory: selectedCategory4,
                                selectedCategory1: selectedCategory1,
                                selectedCategory2: selectedCategory2,
                                selectedCategory3: selectedCategory3,
                                selectedCategory4: selectedCategory4,
                                selectedCategory5: selectedCategory5,
                                selectedCategory6: selectedCategory6,
                                selectedCategory7: selectedCategory7,
                                selectedCategory8: selectedCategory8,
                                selectedCategory9: selectedCategory9,
                                selectedCategory10: selectedCategory10,
                                adubos1: adubos1,
                                adubos2: adubos2,
                                adubos3: adubos3,
                                adubos4: adubos4,
                                adubos5: adubos5,
                                adubos6: adubos6,
                                adubos7: adubos7,
                                adubos8: adubos8,
                                adubos9: adubos9,
                                sementes1: sementes1,
                                sementes2: sementes2,
                                sementes3: sementes3,
                                sementes4: sementes4,
                                sementes5: sementes5,
                                sementes6: sementes6,
                                sementes7: sementes7,
                                sementes8: sementes8,
                                sementes9: sementes9,
                                inseticidas1: inseticidas1,
                                inseticidas2: inseticidas2,
                                inseticidas3: inseticidas3,
                                inseticidas4: inseticidas4,
                                inseticidas5: inseticidas5,
                                inseticidas6: inseticidas6,
                                inseticidas7: inseticidas7,
                                inseticidas8: inseticidas8,
                                inseticidas9: inseticidas9,
                                herbicidas1: herbicidas1,
                                herbicidas2: herbicidas2,
                                herbicidas3: herbicidas3,
                                herbicidas4: herbicidas4,
                                herbicidas5: herbicidas5,
                                herbicidas6: herbicidas6,
                                herbicidas7: herbicidas7,
                                herbicidas8: herbicidas8,
                                herbicidas9: herbicidas9,
                                fungicidas1: fungicidas1,
                                fungicidas2: fungicidas2,
                                fungicidas3: fungicidas3,
                                fungicidas4: fungicidas4,
                                fungicidas5: fungicidas5,
                                fungicidas6: fungicidas6,
                                fungicidas7: fungicidas7,
                                fungicidas8: fungicidas8,
                                fungicidas9: fungicidas9,
                                adjuvantes1: adjuvantes1,
                                adjuvantes2: adjuvantes2,
                                adjuvantes3: adjuvantes3,
                                adjuvantes4: adjuvantes4,
                                adjuvantes5: adjuvantes5,
                                adjuvantes6: adjuvantes6,
                                adjuvantes7: adjuvantes7,
                                adjuvantes8: adjuvantes8,
                                adjuvantes9: adjuvantes9,
                                inoculantes1: inoculantes1,
                                inoculantes2: inoculantes2,
                                inoculantes3: inoculantes3,
                                inoculantes4: inoculantes4,
                                inoculantes5: inoculantes5,
                                inoculantes6: inoculantes6,
                                inoculantes7: inoculantes7,
                                inoculantes8: inoculantes8,
                                inoculantes9: inoculantes9,
                                diesel1: diesel1,
                                diesel2: diesel2,
                                diesel3: diesel3,
                                diesel4: diesel4,
                                diesel5: diesel5,
                                diesel6: diesel6,
                                diesel7: diesel7,
                                diesel8: diesel8,
                                diesel9: diesel9,
                                fertilizantesFoliares1: fertilizantesFoliares1,
                                fertilizantesFoliares2: fertilizantesFoliares2,
                                fertilizantesFoliares3: fertilizantesFoliares3,
                                fertilizantesFoliares4: fertilizantesFoliares4,
                                fertilizantesFoliares5: fertilizantesFoliares5,
                                fertilizantesFoliares6: fertilizantesFoliares6,
                                fertilizantesFoliares7: fertilizantesFoliares7,
                                fertilizantesFoliares8: fertilizantesFoliares8,
                                fertilizantesFoliares9: fertilizantesFoliares9,
                                prod: "Produto 4",
                                product: prod4,
                                prod1: prod1,
                                prod2: prod2,
                                prod3: prod3,
                                prod4: prod4,
                                prod5: prod5,
                                prod6: prod6,
                                prod7: prod7,
                                prod8: prod8,
                                prod9: prod9,
                                prod10: prod10,
                                adjuvantes: adjuvantes4,
                                adubos: adubos4,
                                fungicidas: fungicidas4,
                                herbicidas: herbicidas4,
                                inseticidas: inseticidas4,
                                sementes: sementes4,
                                inoculantes: inoculantes4,
                                diesel: diesel4,
                                fertilizantesFoliares: fertilizantesFoliares4,
                                num: 4,
                                addLev: addLev4,
                                culture: culture,
                                isCulture: culture.isCulture,
                                amount: amountProducts,
                              ),
                            ),
                            Visibility(
                              visible: (amountProducts.amount >= 5),
                              child: ProductWidget(
                                selectedCategory: selectedCategory5,
                                selectedCategory1: selectedCategory1,
                                selectedCategory2: selectedCategory2,
                                selectedCategory3: selectedCategory3,
                                selectedCategory4: selectedCategory4,
                                selectedCategory5: selectedCategory5,
                                selectedCategory6: selectedCategory6,
                                selectedCategory7: selectedCategory7,
                                selectedCategory8: selectedCategory8,
                                selectedCategory9: selectedCategory9,
                                selectedCategory10: selectedCategory10,
                                adubos1: adubos1,
                                adubos2: adubos2,
                                adubos3: adubos3,
                                adubos4: adubos4,
                                adubos5: adubos5,
                                adubos6: adubos6,
                                adubos7: adubos7,
                                adubos8: adubos8,
                                adubos9: adubos9,
                                sementes1: sementes1,
                                sementes2: sementes2,
                                sementes3: sementes3,
                                sementes4: sementes4,
                                sementes5: sementes5,
                                sementes6: sementes6,
                                sementes7: sementes7,
                                sementes8: sementes8,
                                sementes9: sementes9,
                                inseticidas1: inseticidas1,
                                inseticidas2: inseticidas2,
                                inseticidas3: inseticidas3,
                                inseticidas4: inseticidas4,
                                inseticidas5: inseticidas5,
                                inseticidas6: inseticidas6,
                                inseticidas7: inseticidas7,
                                inseticidas8: inseticidas8,
                                inseticidas9: inseticidas9,
                                herbicidas1: herbicidas1,
                                herbicidas2: herbicidas2,
                                herbicidas3: herbicidas3,
                                herbicidas4: herbicidas4,
                                herbicidas5: herbicidas5,
                                herbicidas6: herbicidas6,
                                herbicidas7: herbicidas7,
                                herbicidas8: herbicidas8,
                                herbicidas9: herbicidas9,
                                fungicidas1: fungicidas1,
                                fungicidas2: fungicidas2,
                                fungicidas3: fungicidas3,
                                fungicidas4: fungicidas4,
                                fungicidas5: fungicidas5,
                                fungicidas6: fungicidas6,
                                fungicidas7: fungicidas7,
                                fungicidas8: fungicidas8,
                                fungicidas9: fungicidas9,
                                adjuvantes1: adjuvantes1,
                                adjuvantes2: adjuvantes2,
                                adjuvantes3: adjuvantes3,
                                adjuvantes4: adjuvantes4,
                                adjuvantes5: adjuvantes5,
                                adjuvantes6: adjuvantes6,
                                adjuvantes7: adjuvantes7,
                                adjuvantes8: adjuvantes8,
                                adjuvantes9: adjuvantes9,
                                inoculantes1: inoculantes1,
                                inoculantes2: inoculantes2,
                                inoculantes3: inoculantes3,
                                inoculantes4: inoculantes4,
                                inoculantes5: inoculantes5,
                                inoculantes6: inoculantes6,
                                inoculantes7: inoculantes7,
                                inoculantes8: inoculantes8,
                                inoculantes9: inoculantes9,
                                diesel1: diesel1,
                                diesel2: diesel2,
                                diesel3: diesel3,
                                diesel4: diesel4,
                                diesel5: diesel5,
                                diesel6: diesel6,
                                diesel7: diesel7,
                                diesel8: diesel8,
                                diesel9: diesel9,
                                fertilizantesFoliares1: fertilizantesFoliares1,
                                fertilizantesFoliares2: fertilizantesFoliares2,
                                fertilizantesFoliares3: fertilizantesFoliares3,
                                fertilizantesFoliares4: fertilizantesFoliares4,
                                fertilizantesFoliares5: fertilizantesFoliares5,
                                fertilizantesFoliares6: fertilizantesFoliares6,
                                fertilizantesFoliares7: fertilizantesFoliares7,
                                fertilizantesFoliares8: fertilizantesFoliares8,
                                fertilizantesFoliares9: fertilizantesFoliares9,
                                prod: "Produto 5",
                                product: prod5,
                                prod1: prod1,
                                prod2: prod2,
                                prod3: prod3,
                                prod4: prod4,
                                prod5: prod5,
                                prod6: prod6,
                                prod7: prod7,
                                prod8: prod8,
                                prod9: prod9,
                                prod10: prod10,
                                adjuvantes: adjuvantes5,
                                adubos: adubos5,
                                fungicidas: fungicidas5,
                                herbicidas: herbicidas5,
                                inseticidas: inseticidas5,
                                sementes: sementes5,
                                inoculantes: inoculantes5,
                                diesel: diesel5,
                                fertilizantesFoliares: fertilizantesFoliares5,
                                num: 5,
                                addLev: addLev5,
                                culture: culture,
                                isCulture: culture.isCulture,
                                amount: amountProducts,
                              ),
                            ),
                            Visibility(
                              visible: (amountProducts.amount >= 6),
                              child: ProductWidget(
                                selectedCategory: selectedCategory6,
                                selectedCategory1: selectedCategory1,
                                selectedCategory2: selectedCategory2,
                                selectedCategory3: selectedCategory3,
                                selectedCategory4: selectedCategory4,
                                selectedCategory5: selectedCategory5,
                                selectedCategory6: selectedCategory6,
                                selectedCategory7: selectedCategory7,
                                selectedCategory8: selectedCategory8,
                                selectedCategory9: selectedCategory9,
                                selectedCategory10: selectedCategory10,
                                adubos1: adubos1,
                                adubos2: adubos2,
                                adubos3: adubos3,
                                adubos4: adubos4,
                                adubos5: adubos5,
                                adubos6: adubos6,
                                adubos7: adubos7,
                                adubos8: adubos8,
                                adubos9: adubos9,
                                sementes1: sementes1,
                                sementes2: sementes2,
                                sementes3: sementes3,
                                sementes4: sementes4,
                                sementes5: sementes5,
                                sementes6: sementes6,
                                sementes7: sementes7,
                                sementes8: sementes8,
                                sementes9: sementes9,
                                inseticidas1: inseticidas1,
                                inseticidas2: inseticidas2,
                                inseticidas3: inseticidas3,
                                inseticidas4: inseticidas4,
                                inseticidas5: inseticidas5,
                                inseticidas6: inseticidas6,
                                inseticidas7: inseticidas7,
                                inseticidas8: inseticidas8,
                                inseticidas9: inseticidas9,
                                herbicidas1: herbicidas1,
                                herbicidas2: herbicidas2,
                                herbicidas3: herbicidas3,
                                herbicidas4: herbicidas4,
                                herbicidas5: herbicidas5,
                                herbicidas6: herbicidas6,
                                herbicidas7: herbicidas7,
                                herbicidas8: herbicidas8,
                                herbicidas9: herbicidas9,
                                fungicidas1: fungicidas1,
                                fungicidas2: fungicidas2,
                                fungicidas3: fungicidas3,
                                fungicidas4: fungicidas4,
                                fungicidas5: fungicidas5,
                                fungicidas6: fungicidas6,
                                fungicidas7: fungicidas7,
                                fungicidas8: fungicidas8,
                                fungicidas9: fungicidas9,
                                adjuvantes1: adjuvantes1,
                                adjuvantes2: adjuvantes2,
                                adjuvantes3: adjuvantes3,
                                adjuvantes4: adjuvantes4,
                                adjuvantes5: adjuvantes5,
                                adjuvantes6: adjuvantes6,
                                adjuvantes7: adjuvantes7,
                                adjuvantes8: adjuvantes8,
                                adjuvantes9: adjuvantes9,
                                inoculantes1: inoculantes1,
                                inoculantes2: inoculantes2,
                                inoculantes3: inoculantes3,
                                inoculantes4: inoculantes4,
                                inoculantes5: inoculantes5,
                                inoculantes6: inoculantes6,
                                inoculantes7: inoculantes7,
                                inoculantes8: inoculantes8,
                                inoculantes9: inoculantes9,
                                diesel1: diesel1,
                                diesel2: diesel2,
                                diesel3: diesel3,
                                diesel4: diesel4,
                                diesel5: diesel5,
                                diesel6: diesel6,
                                diesel7: diesel7,
                                diesel8: diesel8,
                                diesel9: diesel9,
                                fertilizantesFoliares1: fertilizantesFoliares1,
                                fertilizantesFoliares2: fertilizantesFoliares2,
                                fertilizantesFoliares3: fertilizantesFoliares3,
                                fertilizantesFoliares4: fertilizantesFoliares4,
                                fertilizantesFoliares5: fertilizantesFoliares5,
                                fertilizantesFoliares6: fertilizantesFoliares6,
                                fertilizantesFoliares7: fertilizantesFoliares7,
                                fertilizantesFoliares8: fertilizantesFoliares8,
                                fertilizantesFoliares9: fertilizantesFoliares9,
                                prod: "Produto 6",
                                product: prod6,
                                prod1: prod1,
                                prod2: prod2,
                                prod3: prod3,
                                prod4: prod4,
                                prod5: prod5,
                                prod6: prod6,
                                prod7: prod7,
                                prod8: prod8,
                                prod9: prod9,
                                prod10: prod10,
                                adjuvantes: adjuvantes6,
                                adubos: adubos6,
                                fungicidas: fungicidas6,
                                herbicidas: herbicidas6,
                                inseticidas: inseticidas6,
                                sementes: sementes6,
                                inoculantes: inoculantes6,
                                diesel: diesel6,
                                fertilizantesFoliares: fertilizantesFoliares6,
                                num: 6,
                                addLev: addLev6,
                                culture: culture,
                                isCulture: culture.isCulture,
                                amount: amountProducts,
                              ),
                            ),
                            Visibility(
                              visible: (amountProducts.amount >= 7),
                              child: ProductWidget(
                                selectedCategory: selectedCategory7,
                                selectedCategory1: selectedCategory1,
                                selectedCategory2: selectedCategory2,
                                selectedCategory3: selectedCategory3,
                                selectedCategory4: selectedCategory4,
                                selectedCategory5: selectedCategory5,
                                selectedCategory6: selectedCategory6,
                                selectedCategory7: selectedCategory7,
                                selectedCategory8: selectedCategory8,
                                selectedCategory9: selectedCategory9,
                                selectedCategory10: selectedCategory10,
                                adubos1: adubos1,
                                adubos2: adubos2,
                                adubos3: adubos3,
                                adubos4: adubos4,
                                adubos5: adubos5,
                                adubos6: adubos6,
                                adubos7: adubos7,
                                adubos8: adubos8,
                                adubos9: adubos9,
                                sementes1: sementes1,
                                sementes2: sementes2,
                                sementes3: sementes3,
                                sementes4: sementes4,
                                sementes5: sementes5,
                                sementes6: sementes6,
                                sementes7: sementes7,
                                sementes8: sementes8,
                                sementes9: sementes9,
                                inseticidas1: inseticidas1,
                                inseticidas2: inseticidas2,
                                inseticidas3: inseticidas3,
                                inseticidas4: inseticidas4,
                                inseticidas5: inseticidas5,
                                inseticidas6: inseticidas6,
                                inseticidas7: inseticidas7,
                                inseticidas8: inseticidas8,
                                inseticidas9: inseticidas9,
                                herbicidas1: herbicidas1,
                                herbicidas2: herbicidas2,
                                herbicidas3: herbicidas3,
                                herbicidas4: herbicidas4,
                                herbicidas5: herbicidas5,
                                herbicidas6: herbicidas6,
                                herbicidas7: herbicidas7,
                                herbicidas8: herbicidas8,
                                herbicidas9: herbicidas9,
                                fungicidas1: fungicidas1,
                                fungicidas2: fungicidas2,
                                fungicidas3: fungicidas3,
                                fungicidas4: fungicidas4,
                                fungicidas5: fungicidas5,
                                fungicidas6: fungicidas6,
                                fungicidas7: fungicidas7,
                                fungicidas8: fungicidas8,
                                fungicidas9: fungicidas9,
                                adjuvantes1: adjuvantes1,
                                adjuvantes2: adjuvantes2,
                                adjuvantes3: adjuvantes3,
                                adjuvantes4: adjuvantes4,
                                adjuvantes5: adjuvantes5,
                                adjuvantes6: adjuvantes6,
                                adjuvantes7: adjuvantes7,
                                adjuvantes8: adjuvantes8,
                                adjuvantes9: adjuvantes9,
                                inoculantes1: inoculantes1,
                                inoculantes2: inoculantes2,
                                inoculantes3: inoculantes3,
                                inoculantes4: inoculantes4,
                                inoculantes5: inoculantes5,
                                inoculantes6: inoculantes6,
                                inoculantes7: inoculantes7,
                                inoculantes8: inoculantes8,
                                inoculantes9: inoculantes9,
                                diesel1: diesel1,
                                diesel2: diesel2,
                                diesel3: diesel3,
                                diesel4: diesel4,
                                diesel5: diesel5,
                                diesel6: diesel6,
                                diesel7: diesel7,
                                diesel8: diesel8,
                                diesel9: diesel9,
                                fertilizantesFoliares1: fertilizantesFoliares1,
                                fertilizantesFoliares2: fertilizantesFoliares2,
                                fertilizantesFoliares3: fertilizantesFoliares3,
                                fertilizantesFoliares4: fertilizantesFoliares4,
                                fertilizantesFoliares5: fertilizantesFoliares5,
                                fertilizantesFoliares6: fertilizantesFoliares6,
                                fertilizantesFoliares7: fertilizantesFoliares7,
                                fertilizantesFoliares8: fertilizantesFoliares8,
                                fertilizantesFoliares9: fertilizantesFoliares9,
                                prod: "Produto 7",
                                product: prod7,
                                prod1: prod1,
                                prod2: prod2,
                                prod3: prod3,
                                prod4: prod4,
                                prod5: prod5,
                                prod6: prod6,
                                prod7: prod7,
                                prod8: prod8,
                                prod9: prod9,
                                prod10: prod10,
                                adjuvantes: adjuvantes7,
                                adubos: adubos7,
                                fungicidas: fungicidas7,
                                herbicidas: herbicidas7,
                                inseticidas: inseticidas7,
                                sementes: sementes7,
                                inoculantes: inoculantes7,
                                diesel: diesel7,
                                fertilizantesFoliares: fertilizantesFoliares7,
                                num: 7,
                                addLev: addLev7,
                                culture: culture,
                                isCulture: culture.isCulture,
                                amount: amountProducts,
                              ),
                            ),
                            Visibility(
                              visible: (amountProducts.amount >= 8),
                              child: ProductWidget(
                                selectedCategory: selectedCategory8,
                                selectedCategory1: selectedCategory1,
                                selectedCategory2: selectedCategory2,
                                selectedCategory3: selectedCategory3,
                                selectedCategory4: selectedCategory4,
                                selectedCategory5: selectedCategory5,
                                selectedCategory6: selectedCategory6,
                                selectedCategory7: selectedCategory7,
                                selectedCategory8: selectedCategory8,
                                selectedCategory9: selectedCategory9,
                                selectedCategory10: selectedCategory10,
                                adubos1: adubos1,
                                adubos2: adubos2,
                                adubos3: adubos3,
                                adubos4: adubos4,
                                adubos5: adubos5,
                                adubos6: adubos6,
                                adubos7: adubos7,
                                adubos8: adubos8,
                                adubos9: adubos9,
                                sementes1: sementes1,
                                sementes2: sementes2,
                                sementes3: sementes3,
                                sementes4: sementes4,
                                sementes5: sementes5,
                                sementes6: sementes6,
                                sementes7: sementes7,
                                sementes8: sementes8,
                                sementes9: sementes9,
                                inseticidas1: inseticidas1,
                                inseticidas2: inseticidas2,
                                inseticidas3: inseticidas3,
                                inseticidas4: inseticidas4,
                                inseticidas5: inseticidas5,
                                inseticidas6: inseticidas6,
                                inseticidas7: inseticidas7,
                                inseticidas8: inseticidas8,
                                inseticidas9: inseticidas9,
                                herbicidas1: herbicidas1,
                                herbicidas2: herbicidas2,
                                herbicidas3: herbicidas3,
                                herbicidas4: herbicidas4,
                                herbicidas5: herbicidas5,
                                herbicidas6: herbicidas6,
                                herbicidas7: herbicidas7,
                                herbicidas8: herbicidas8,
                                herbicidas9: herbicidas9,
                                fungicidas1: fungicidas1,
                                fungicidas2: fungicidas2,
                                fungicidas3: fungicidas3,
                                fungicidas4: fungicidas4,
                                fungicidas5: fungicidas5,
                                fungicidas6: fungicidas6,
                                fungicidas7: fungicidas7,
                                fungicidas8: fungicidas8,
                                fungicidas9: fungicidas9,
                                adjuvantes1: adjuvantes1,
                                adjuvantes2: adjuvantes2,
                                adjuvantes3: adjuvantes3,
                                adjuvantes4: adjuvantes4,
                                adjuvantes5: adjuvantes5,
                                adjuvantes6: adjuvantes6,
                                adjuvantes7: adjuvantes7,
                                adjuvantes8: adjuvantes8,
                                adjuvantes9: adjuvantes9,
                                inoculantes1: inoculantes1,
                                inoculantes2: inoculantes2,
                                inoculantes3: inoculantes3,
                                inoculantes4: inoculantes4,
                                inoculantes5: inoculantes5,
                                inoculantes6: inoculantes6,
                                inoculantes7: inoculantes7,
                                inoculantes8: inoculantes8,
                                inoculantes9: inoculantes9,
                                diesel1: diesel1,
                                diesel2: diesel2,
                                diesel3: diesel3,
                                diesel4: diesel4,
                                diesel5: diesel5,
                                diesel6: diesel6,
                                diesel7: diesel7,
                                diesel8: diesel8,
                                diesel9: diesel9,
                                fertilizantesFoliares1: fertilizantesFoliares1,
                                fertilizantesFoliares2: fertilizantesFoliares2,
                                fertilizantesFoliares3: fertilizantesFoliares3,
                                fertilizantesFoliares4: fertilizantesFoliares4,
                                fertilizantesFoliares5: fertilizantesFoliares5,
                                fertilizantesFoliares6: fertilizantesFoliares6,
                                fertilizantesFoliares7: fertilizantesFoliares7,
                                fertilizantesFoliares8: fertilizantesFoliares8,
                                fertilizantesFoliares9: fertilizantesFoliares9,
                                prod: "Produto 8",
                                product: prod8,
                                prod1: prod1,
                                prod2: prod2,
                                prod3: prod3,
                                prod4: prod4,
                                prod5: prod5,
                                prod6: prod6,
                                prod7: prod7,
                                prod8: prod8,
                                prod9: prod9,
                                prod10: prod10,
                                adjuvantes: adjuvantes8,
                                adubos: adubos8,
                                fungicidas: fungicidas8,
                                herbicidas: herbicidas8,
                                inseticidas: inseticidas8,
                                sementes: sementes8,
                                inoculantes: inoculantes8,
                                diesel: diesel8,
                                fertilizantesFoliares: fertilizantesFoliares8,
                                num: 8,
                                addLev: addLev8,
                                culture: culture,
                                isCulture: culture.isCulture,
                                amount: amountProducts,
                              ),
                            ),
                            Visibility(
                              visible: (amountProducts.amount >= 9),
                              child: ProductWidget(
                                selectedCategory: selectedCategory9,
                                selectedCategory1: selectedCategory1,
                                selectedCategory2: selectedCategory2,
                                selectedCategory3: selectedCategory3,
                                selectedCategory4: selectedCategory4,
                                selectedCategory5: selectedCategory5,
                                selectedCategory6: selectedCategory6,
                                selectedCategory7: selectedCategory7,
                                selectedCategory8: selectedCategory8,
                                selectedCategory9: selectedCategory9,
                                selectedCategory10: selectedCategory10,
                                adubos1: adubos1,
                                adubos2: adubos2,
                                adubos3: adubos3,
                                adubos4: adubos4,
                                adubos5: adubos5,
                                adubos6: adubos6,
                                adubos7: adubos7,
                                adubos8: adubos8,
                                adubos9: adubos9,
                                sementes1: sementes1,
                                sementes2: sementes2,
                                sementes3: sementes3,
                                sementes4: sementes4,
                                sementes5: sementes5,
                                sementes6: sementes6,
                                sementes7: sementes7,
                                sementes8: sementes8,
                                sementes9: sementes9,
                                inseticidas1: inseticidas1,
                                inseticidas2: inseticidas2,
                                inseticidas3: inseticidas3,
                                inseticidas4: inseticidas4,
                                inseticidas5: inseticidas5,
                                inseticidas6: inseticidas6,
                                inseticidas7: inseticidas7,
                                inseticidas8: inseticidas8,
                                inseticidas9: inseticidas9,
                                herbicidas1: herbicidas1,
                                herbicidas2: herbicidas2,
                                herbicidas3: herbicidas3,
                                herbicidas4: herbicidas4,
                                herbicidas5: herbicidas5,
                                herbicidas6: herbicidas6,
                                herbicidas7: herbicidas7,
                                herbicidas8: herbicidas8,
                                herbicidas9: herbicidas9,
                                fungicidas1: fungicidas1,
                                fungicidas2: fungicidas2,
                                fungicidas3: fungicidas3,
                                fungicidas4: fungicidas4,
                                fungicidas5: fungicidas5,
                                fungicidas6: fungicidas6,
                                fungicidas7: fungicidas7,
                                fungicidas8: fungicidas8,
                                fungicidas9: fungicidas9,
                                adjuvantes1: adjuvantes1,
                                adjuvantes2: adjuvantes2,
                                adjuvantes3: adjuvantes3,
                                adjuvantes4: adjuvantes4,
                                adjuvantes5: adjuvantes5,
                                adjuvantes6: adjuvantes6,
                                adjuvantes7: adjuvantes7,
                                adjuvantes8: adjuvantes8,
                                adjuvantes9: adjuvantes9,
                                inoculantes1: inoculantes1,
                                inoculantes2: inoculantes2,
                                inoculantes3: inoculantes3,
                                inoculantes4: inoculantes4,
                                inoculantes5: inoculantes5,
                                inoculantes6: inoculantes6,
                                inoculantes7: inoculantes7,
                                inoculantes8: inoculantes8,
                                inoculantes9: inoculantes9,
                                diesel1: diesel1,
                                diesel2: diesel2,
                                diesel3: diesel3,
                                diesel4: diesel4,
                                diesel5: diesel5,
                                diesel6: diesel6,
                                diesel7: diesel7,
                                diesel8: diesel8,
                                diesel9: diesel9,
                                fertilizantesFoliares1: fertilizantesFoliares1,
                                fertilizantesFoliares2: fertilizantesFoliares2,
                                fertilizantesFoliares3: fertilizantesFoliares3,
                                fertilizantesFoliares4: fertilizantesFoliares4,
                                fertilizantesFoliares5: fertilizantesFoliares5,
                                fertilizantesFoliares6: fertilizantesFoliares6,
                                fertilizantesFoliares7: fertilizantesFoliares7,
                                fertilizantesFoliares8: fertilizantesFoliares8,
                                fertilizantesFoliares9: fertilizantesFoliares9,
                                prod: "Produto 9",
                                product: prod9,
                                prod1: prod1,
                                prod2: prod2,
                                prod3: prod3,
                                prod4: prod4,
                                prod5: prod5,
                                prod6: prod6,
                                prod7: prod7,
                                prod8: prod8,
                                prod9: prod9,
                                prod10: prod10,
                                adjuvantes: adjuvantes9,
                                adubos: adubos9,
                                fungicidas: fungicidas9,
                                herbicidas: herbicidas9,
                                inseticidas: inseticidas9,
                                sementes: sementes9,
                                inoculantes: inoculantes9,
                                diesel: diesel9,
                                fertilizantesFoliares: fertilizantesFoliares9,
                                num: 9,
                                addLev: addLev9,
                                culture: culture,
                                isCulture: culture.isCulture,
                                amount: amountProducts,
                              ),
                            ),
                            Visibility(
                              visible: (amountProducts.amount >= 10),
                              child: ProductWidget(
                                selectedCategory: selectedCategory10,
                                selectedCategory1: selectedCategory1,
                                selectedCategory2: selectedCategory2,
                                selectedCategory3: selectedCategory3,
                                selectedCategory4: selectedCategory4,
                                selectedCategory5: selectedCategory5,
                                selectedCategory6: selectedCategory6,
                                selectedCategory7: selectedCategory7,
                                selectedCategory8: selectedCategory8,
                                selectedCategory9: selectedCategory9,
                                selectedCategory10: selectedCategory10,
                                adubos1: adubos1,
                                adubos2: adubos2,
                                adubos3: adubos3,
                                adubos4: adubos4,
                                adubos5: adubos5,
                                adubos6: adubos6,
                                adubos7: adubos7,
                                adubos8: adubos8,
                                adubos9: adubos9,
                                sementes1: sementes1,
                                sementes2: sementes2,
                                sementes3: sementes3,
                                sementes4: sementes4,
                                sementes5: sementes5,
                                sementes6: sementes6,
                                sementes7: sementes7,
                                sementes8: sementes8,
                                sementes9: sementes9,
                                inseticidas1: inseticidas1,
                                inseticidas2: inseticidas2,
                                inseticidas3: inseticidas3,
                                inseticidas4: inseticidas4,
                                inseticidas5: inseticidas5,
                                inseticidas6: inseticidas6,
                                inseticidas7: inseticidas7,
                                inseticidas8: inseticidas8,
                                inseticidas9: inseticidas9,
                                herbicidas1: herbicidas1,
                                herbicidas2: herbicidas2,
                                herbicidas3: herbicidas3,
                                herbicidas4: herbicidas4,
                                herbicidas5: herbicidas5,
                                herbicidas6: herbicidas6,
                                herbicidas7: herbicidas7,
                                herbicidas8: herbicidas8,
                                herbicidas9: herbicidas9,
                                fungicidas1: fungicidas1,
                                fungicidas2: fungicidas2,
                                fungicidas3: fungicidas3,
                                fungicidas4: fungicidas4,
                                fungicidas5: fungicidas5,
                                fungicidas6: fungicidas6,
                                fungicidas7: fungicidas7,
                                fungicidas8: fungicidas8,
                                fungicidas9: fungicidas9,
                                adjuvantes1: adjuvantes1,
                                adjuvantes2: adjuvantes2,
                                adjuvantes3: adjuvantes3,
                                adjuvantes4: adjuvantes4,
                                adjuvantes5: adjuvantes5,
                                adjuvantes6: adjuvantes6,
                                adjuvantes7: adjuvantes7,
                                adjuvantes8: adjuvantes8,
                                adjuvantes9: adjuvantes9,
                                inoculantes1: inoculantes1,
                                inoculantes2: inoculantes2,
                                inoculantes3: inoculantes3,
                                inoculantes4: inoculantes4,
                                inoculantes5: inoculantes5,
                                inoculantes6: inoculantes6,
                                inoculantes7: inoculantes7,
                                inoculantes8: inoculantes8,
                                inoculantes9: inoculantes9,
                                diesel1: diesel1,
                                diesel2: diesel2,
                                diesel3: diesel3,
                                diesel4: diesel4,
                                diesel5: diesel5,
                                diesel6: diesel6,
                                diesel7: diesel7,
                                diesel8: diesel8,
                                diesel9: diesel9,
                                fertilizantesFoliares1: fertilizantesFoliares1,
                                fertilizantesFoliares2: fertilizantesFoliares2,
                                fertilizantesFoliares3: fertilizantesFoliares3,
                                fertilizantesFoliares4: fertilizantesFoliares4,
                                fertilizantesFoliares5: fertilizantesFoliares5,
                                fertilizantesFoliares6: fertilizantesFoliares6,
                                fertilizantesFoliares7: fertilizantesFoliares7,
                                fertilizantesFoliares8: fertilizantesFoliares8,
                                fertilizantesFoliares9: fertilizantesFoliares9,
                                prod: "Produto 10",
                                product: prod10,
                                prod1: prod1,
                                prod2: prod2,
                                prod3: prod3,
                                prod4: prod4,
                                prod5: prod5,
                                prod6: prod6,
                                prod7: prod7,
                                prod8: prod8,
                                prod9: prod9,
                                prod10: prod10,
                                adjuvantes: adjuvantes10,
                                adubos: adubos10,
                                fungicidas: fungicidas10,
                                herbicidas: herbicidas10,
                                inseticidas: inseticidas10,
                                sementes: sementes10,
                                inoculantes: inoculantes10,
                                diesel: diesel10,
                                fertilizantesFoliares: fertilizantesFoliares10,
                                num: 10,
                                addLev: addLev10,
                                culture: culture,
                                isCulture: culture.isCulture,
                                amount: amountProducts,
                              ),
                            ),
                          ],
                        )
                      : Column(children: [
                          SizedBox(
                            width: 300,
                            child: Text(
                              "${culture.name.text} - ${phaseOption.phase}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 270,
                                child: Center(
                                  child: Text(
                                    'Data da operação: ${formatter.format(dateProv.date)}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 270,
                                child: Center(
                                  child: Text(
                                    'Hora da operação: ${hourProv.hour.format(context)}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: hourProv.hour,
                                  );
                                  if (pickedTime == null) return;
                                  hourProv.setHour(pickedTime);
                                },
                                icon: const Icon(Icons.timer_sharp),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Divider(thickness: 2),
                          const SizedBox(height: 20),
                          const Text("Veículo"),
                          DropDownVehicles(
                            vehicles: vehicles.vehicles,
                            selected: vehicles.selected,
                            v: vehicles,
                            edit: false,
                          ),
                          const SizedBox(height: 20),
                          // Platform.isAndroid
                          //     ? InputReport(
                          //         controller: colheita.grossQuantity,
                          //         nameField: "Quantidade Bruta (KG)",
                          //         qtd: true,
                          //         colheita: colheita,
                          //       )
                          //     : Padding(
                          //         padding: const EdgeInsets.symmetric(
                          //             horizontal: 400),
                          //         child: InputReport(
                          //           controller: colheita.grossQuantity,
                          //           nameField: "Quantidade Bruta (KG)",
                          //           qtd: true,
                          //           colheita: colheita,
                          //         ),
                          //       ),
                          Platform.isAndroid
                              ? InputReport(
                                  controller: colheita.netQuantity,
                                  nameField: "Quantidade Líquida (kg)",
                                  qtd: true,
                                  colheita: colheita,
                                  type: "QttLiquida",
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 400),
                                  child: InputReport(
                                    controller: colheita.netQuantity,
                                    nameField: "Quantidade Líquida (kg)",
                                    qtd: true,
                                    colheita: colheita,
                                    type: "QttLiquida",
                                  ),
                                ),
                          Platform.isAndroid
                              ? InputReport(
                                  controller: colheita.moisture,
                                  nameField: "Umidade (kg)",
                                  qtd: true,
                                  colheita: colheita,
                                  type: "Umidade",
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 400),
                                  child: InputReport(
                                    controller: colheita.moisture,
                                    nameField: "Umidade (kg)",
                                    qtd: true,
                                    colheita: colheita,
                                    type: "Umidade",
                                  ),
                                ),
                          Platform.isAndroid
                              ? InputReport(
                                  controller: colheita.impurity,
                                  nameField: "Impurezas (kg)",
                                  qtd: true,
                                  colheita: colheita,
                                  type: "Impurezas",
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 400),
                                  child: InputReport(
                                    controller: colheita.impurity,
                                    nameField: "Impurezas (kg)",
                                    qtd: true,
                                    colheita: colheita,
                                    type: "Impurezas",
                                  ),
                                ),
                          Platform.isAndroid
                              ? InputReport(
                                  controller: colheita.damaged,
                                  nameField: "Avariados (kg)",
                                  qtd: true,
                                  colheita: colheita,
                                  type: "Avariados",
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 400),
                                  child: InputReport(
                                    controller: colheita.damaged,
                                    nameField: "Avariados (kg)",
                                    qtd: true,
                                    colheita: colheita,
                                    type: "Avariados",
                                  ),
                                ),

                          Text(
                            "Quantidade Classificada (kg): ${colheita.classifiedQttKg} kg",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Quantidade Classificada (SCS): ${colheita.classifiedQttBags} sacos",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Diferença percentual: ${colheita.difPerc}%",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          // const SizedBox(height: 20),
                          // const Divider(
                          //   thickness: 2,
                          // ),
                          // const SizedBox(height: 20),
                          // const Text("Preenchimento Facultativo:",
                          //     style: TextStyle(
                          //       fontSize: 16,
                          //       fontWeight: FontWeight.bold,
                          //     )),

                          const SizedBox(height: 20),
                          const Divider(
                            thickness: 2,
                          ),
                          const SizedBox(height: 20),
                          LocalDeliverySelect(
                              local: locals, colheita: colheita),
                          const SizedBox(height: 70),
                        ]),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: isLoading.isLoading
            ? const Color.fromARGB(255, 194, 236, 145)
            : Colors.green,
        onPressed: () async {
          if (await confirm(
            context,
            title: const Text('Confirmação'),
            content: const Text('Deseja cadastrar nova fase à cultura?'),
            textOK: const Text('Sim'),
            textCancel: const Text('Não'),
          )) {
            isLoading.setIsLoading();
            if (phaseOption.phase == "COLHEITA") {
              try {
                if (
                    // colheita.grossQuantity.text == "0.0" ||
                    //   colheita.grossQuantity.text == "" ||
                    colheita.netQuantity.text == "0.0" ||
                        colheita.netQuantity.text == "") {
                  // ignore: use_build_context_synchronously
                  await alert.alert(
                      context,
                      "Todos os campos obrigatórios devem ser preenchidos.",
                      "ATENÇÃO!",
                      AlertType.info);
                } else if (colheita.localEntrega == "") {
                  // ignore: use_build_context_synchronously
                  await alert.alert(context, "Selecione um local de entrega.",
                      "ATENÇÃO!", AlertType.info);
                } else if (vehicles.name.text == "Selecione") {
                  // ignore: use_build_context_synchronously
                  await alert.alert(context, "Selecione um veículo.",
                      "ATENÇÃO!", AlertType.info);
                } else {
                  int number = await getLastIdCultures.get();
                  int nextNumber = number + 1;

                  if (culture.name.text[0] == "M") {
                    cultureType.setMilho();
                  } else if (culture.name.text[0] == "T") {
                    cultureType.setTrigo();
                  } else if (culture.name.text[0] == "S") {
                    cultureType.setSoja();
                  }

                  DateTime dateTime = DateFormat('dd/MM/yyyy hh:mm')
                      .parse("${dateController.text} ${hourController.text}");
                  Timestamp timestamp = Timestamp.fromMillisecondsSinceEpoch(
                      dateTime.millisecondsSinceEpoch + 10800000);

                  if (cultureStage.stage == "finish") {
                    await registerCulture.register(
                      nextNumber,
                      {
                        'id': nextNumber,
                        'cultureName': culture.name.text,
                        'dateOutput': timestamp,
                        'dateRegister': FieldValue.serverTimestamp(),
                        'opened': false,
                        'phase': phaseOption.phase,
                        'cultureType': cultureType.result,
                        // 'grossQuantity': colheita.grossQuantity.text,
                        'netQuantity': colheita.netQuantity.text,
                        'percentualDifference': colheita.difPerc,
                        'classifiedQttKg': colheita.classifiedQttKg,
                        'classifiedQttBags': colheita.classifiedQttBags,
                        'impurity': colheita.impurity.text,
                        'damaged': colheita.damaged.text,
                        'moisture': colheita.moisture.text,
                        'vehicle': vehicles.name.text,
                        'plate': vehicles.plate.text,
                        'user': auth.usuario!.uid,
                        'localEntrega': colheita.localEntrega,
                        'products': [],
                      },
                    );
                    for (int index in userCultures.names[
                        "${userCultures.culturesList[indexCultureSelected.index!]['cultureName']}"]!) {
                      finishCulturePhases
                          .finish(userCultures.culturesList[index]["id"]);
                    }
                    // ignore: use_build_context_synchronously
                    await alert.alert(
                        context,
                        "Cultura finalizada com sucesso.",
                        "SUCESSO!",
                        AlertType.success);
                  } else {
                    await registerCulture.register(
                      nextNumber,
                      {
                        'id': nextNumber,
                        'cultureName': culture.name.text,
                        'dateOutput': timestamp,
                        'dateRegister': FieldValue.serverTimestamp(),
                        'opened': true,
                        'phase': phaseOption.phase,
                        'cultureType': cultureType.result,
                        // 'grossQuantity': colheita.grossQuantity.text,
                        'netQuantity': colheita.netQuantity.text,
                        'percentualDifference': colheita.difPerc,
                        'classifiedQttKg': colheita.classifiedQttKg,
                        'classifiedQttBags': colheita.classifiedQttBags,
                        'impurity': colheita.impurity.text,
                        'damaged': colheita.damaged.text,
                        'moisture': colheita.moisture.text,
                        'vehicle': vehicles.name.text,
                        'plate': vehicles.plate.text,
                        'user': auth.usuario!.uid,
                        'localEntrega': colheita.localEntrega,
                        'products': [],
                      },
                    );
                    // ignore: use_build_context_synchronously
                    await alert.alert(
                        context,
                        "Colheita cadastrada com sucesso.",
                        "SUCESSO!",
                        AlertType.success);
                  }
                  resetControlls();
                  // ignore: use_build_context_synchronously
                  FocusScope.of(context).requestFocus(FocusNode());
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return AuthCheck(first: false);
                      },
                    ),
                  );
                }
              } catch (e) {
                // ignore: use_build_context_synchronously
                await alert.alert(
                    context, "Algo deu errado!", "ERRO!", AlertType.error);
              }
            } else {
              try {
                if ((amountProducts.amount >= 1 &&
                        prod1.quantity.text.isEmpty) ||
                    (amountProducts.amount >= 2 &&
                        prod2.quantity.text.isEmpty) ||
                    (amountProducts.amount >= 3 &&
                        prod3.quantity.text.isEmpty) ||
                    (amountProducts.amount >= 4 &&
                        prod4.quantity.text.isEmpty) ||
                    (amountProducts.amount >= 5 &&
                        prod5.quantity.text.isEmpty) ||
                    (amountProducts.amount >= 6 &&
                        prod6.quantity.text.isEmpty) ||
                    (amountProducts.amount >= 7 &&
                        prod7.quantity.text.isEmpty) ||
                    (amountProducts.amount >= 8 &&
                        prod8.quantity.text.isEmpty) ||
                    (amountProducts.amount >= 9 &&
                        prod9.quantity.text.isEmpty) ||
                    (amountProducts.amount >= 10 &&
                        prod10.quantity.text.isEmpty)) {
                  // ignore: use_build_context_synchronously
                  await alert.alert(
                      context,
                      "Todos os campos devem ser preenchidos.",
                      "ATENÇÃO!",
                      AlertType.info);
                } else if ((addLev1.level == 1 && !selectedCategory1.diesel) ||
                    (addLev2.level == 1 && !selectedCategory2.diesel) ||
                    (addLev3.level == 1 && !selectedCategory3.diesel) ||
                    (addLev4.level == 1 && !selectedCategory4.diesel) ||
                    (addLev5.level == 1 && !selectedCategory5.diesel) ||
                    (addLev6.level == 1 && !selectedCategory6.diesel) ||
                    (addLev7.level == 1 && !selectedCategory7.diesel) ||
                    (addLev8.level == 1 && !selectedCategory8.diesel) ||
                    (addLev9.level == 1 && !selectedCategory9.diesel) ||
                    (addLev10.level == 1 && !selectedCategory10.diesel)) {
                  // ignore: use_build_context_synchronously
                  await alert.alert(
                      context,
                      "Erro, verifique se o item selecionado é um produto.",
                      "ERRO!",
                      AlertType.error);
                } else if (culture.alqueresNum <= 0 ||
                    culture.alqueres.text.contains(",") ||
                    culture.alqueres.text.contains(".") ||
                    culture.alqueres.text.contains(" ") ||
                    culture.alqueres.text.contains("-")) {
                  // ignore: use_build_context_synchronously
                  await alert.alert(
                      context,
                      'Deve-se preencher o campo "Nº de Alqueres" corretamente como nº inteiro maior ou igual a 0.',
                      "ATENÇÃO!",
                      AlertType.info);
                } else {
                  List<Map<String, dynamic>> listCultureProds = [];
                  List<Map<String, dynamic>> products1 = [];
                  List<Map<String, dynamic>> products2 = [];
                  List<Map<String, dynamic>> products3 = [];
                  List<Map<String, dynamic>> products4 = [];
                  List<Map<String, dynamic>> products5 = [];
                  List<Map<String, dynamic>> products6 = [];
                  List<Map<String, dynamic>> products7 = [];
                  List<Map<String, dynamic>> products8 = [];
                  List<Map<String, dynamic>> products9 = [];
                  List<Map<String, dynamic>> products10 = [];

                  int lastOutputs = 0;
                  int newInputNumber = 0;

                  double newQtt = 0;
                  // double newLocalQtt = 0;

                  Map<String, dynamic>? dadInfos;
                  int? numDad;

                  if (culture.name.text.contains("SANTA")) {
                    local.setSantaTerezinha();
                  } else if (culture.name.text.contains("REAL")) {
                    local.setReal();
                  } else if (culture.name.text.contains("JOÃO")) {
                    local.setSaoJoao();
                  } else if (culture.name.text.contains("JORGE")) {
                    local.setSaoJorge();
                  } else if (culture.name.text.contains("CRUZEIRO")) {
                    local.setCruzeiro();
                  } else if (culture.name.text.contains("CAMPINHO")) {
                    local.setCampinho();
                  }

                  if (amountProducts.amount >= 1) {
                    prod1.activePrinciple.text = await getNameProduct.get(
                        prod1.category.text, prod1.dad.text, addLev1.level - 1);

                    newQtt = await updateQuantityRecursive(prod1, addLev1.level,
                        double.parse(prod1.realQuantity.text));

                    // newLocalQtt = await updateQuantityLocalRecursive(
                    //   prod1,
                    //   addLev1.level,
                    //   double.parse(prod1.realQuantity.text),
                    //   local.result,
                    // );

                    products1 = organizeCultureProducts.get(
                      listCultureProds,
                      prod1.category.text,
                      prod1.activePrinciple.text,
                      prod1.code.text,
                      prod1.realQuantity.text,
                      newQtt,
                      // newLocalQtt,
                      prod1.unity.text,
                      prod1.name.text,
                    );
                    listCultureProds = products1;

                    lastOutputs = await getLastOutputs.get();
                    newInputNumber = lastOutputs + 1;

                    numDad = await numberProduct.get(
                        selectedCategory1.categoryString!,
                        prod1.dad.text,
                        addLev1.level - 1);
                    dadInfos = await getDadInfos.get(
                        selectedCategory1.categoryString!,
                        addLev1.level - 1,
                        numDad!);

                    outProduct.register(
                      newInputNumber,
                      auth,
                      double.parse(prod1.realQuantity.text),
                      prod1.name.text,
                      dateController.text,
                      hourController.text,
                      addLev1.level.toString(),
                      prod1.category.text,
                      newQtt,
                      // newLocalQtt,
                      local.result,
                      dadInfos!["name"],
                      culture.name.text,
                      phaseOption.phase,
                      prod1.unity.text,
                      false,
                      "",
                      "",
                    );
                  }
                  if (amountProducts.amount >= 2) {
                    prod2.activePrinciple.text = await getNameProduct.get(
                        prod2.category.text, prod2.dad.text, addLev2.level - 1);

                    newQtt = await updateQuantityRecursive(prod2, addLev2.level,
                        double.parse(prod2.realQuantity.text));

                    // newLocalQtt = await updateQuantityLocalRecursive(
                    //   prod2,
                    //   addLev2.level,
                    //   double.parse(prod2.realQuantity.text),
                    //   local.result,
                    // );

                    products2 = organizeCultureProducts.get(
                      products1,
                      prod2.category.text,
                      prod2.activePrinciple.text,
                      prod2.code.text,
                      prod2.realQuantity.text,
                      newQtt,
                      // newLocalQtt,
                      prod2.unity.text,
                      prod2.name.text,
                    );
                    listCultureProds = products2;

                    newInputNumber = newInputNumber + 1;

                    numDad = await numberProduct.get(
                        selectedCategory2.categoryString!,
                        prod2.dad.text,
                        addLev2.level - 1);
                    dadInfos = await getDadInfos.get(
                        selectedCategory2.categoryString!,
                        addLev2.level - 1,
                        numDad!);

                    outProduct.register(
                      newInputNumber,
                      auth,
                      double.parse(prod2.realQuantity.text),
                      prod2.name.text,
                      dateController.text,
                      hourController.text,
                      addLev2.level.toString(),
                      prod2.category.text,
                      newQtt,
                      // newLocalQtt,
                      local.result,
                      dadInfos!["name"],
                      culture.name.text,
                      phaseOption.phase,
                      prod2.unity.text,
                      false,
                      "",
                      "",
                    );
                  }
                  if (amountProducts.amount >= 3) {
                    prod3.activePrinciple.text = await getNameProduct.get(
                        prod3.category.text, prod3.dad.text, addLev3.level - 1);

                    newQtt = await updateQuantityRecursive(prod3, addLev3.level,
                        double.parse(prod3.realQuantity.text));

                    // newLocalQtt = await updateQuantityLocalRecursive(
                    //   prod3,
                    //   addLev3.level,
                    //   double.parse(prod3.realQuantity.text),
                    //   local.result,
                    // );

                    products3 = organizeCultureProducts.get(
                      products2,
                      prod3.category.text,
                      prod3.activePrinciple.text,
                      prod3.code.text,
                      prod3.realQuantity.text,
                      newQtt,
                      // newLocalQtt,
                      prod3.unity.text,
                      prod3.name.text,
                    );
                    listCultureProds = products3;

                    newInputNumber = newInputNumber + 1;

                    numDad = await numberProduct.get(
                        selectedCategory3.categoryString!,
                        prod3.dad.text,
                        addLev3.level - 1);
                    dadInfos = await getDadInfos.get(
                        selectedCategory3.categoryString!,
                        addLev3.level - 1,
                        numDad!);

                    outProduct.register(
                      newInputNumber,
                      auth,
                      double.parse(prod3.realQuantity.text),
                      prod3.name.text,
                      dateController.text,
                      hourController.text,
                      addLev3.level.toString(),
                      prod3.category.text,
                      newQtt,
                      // newLocalQtt,
                      local.result,
                      dadInfos!["name"],
                      culture.name.text,
                      phaseOption.phase,
                      prod3.unity.text,
                      false,
                      "",
                      "",
                    );
                  }
                  if (amountProducts.amount >= 4) {
                    prod4.activePrinciple.text = await getNameProduct.get(
                        prod4.category.text, prod4.dad.text, addLev4.level - 1);

                    newQtt = await updateQuantityRecursive(prod4, addLev4.level,
                        double.parse(prod4.realQuantity.text));

                    // newLocalQtt = await updateQuantityLocalRecursive(
                    //   prod4,
                    //   addLev4.level,
                    //   double.parse(prod4.realQuantity.text),
                    //   local.result,
                    // );

                    products4 = organizeCultureProducts.get(
                      products3,
                      prod4.category.text,
                      prod4.activePrinciple.text,
                      prod4.code.text,
                      prod4.realQuantity.text,
                      newQtt,
                      // newLocalQtt,
                      prod4.unity.text,
                      prod4.name.text,
                    );
                    listCultureProds = products4;

                    newInputNumber = newInputNumber + 1;

                    numDad = await numberProduct.get(
                        selectedCategory4.categoryString!,
                        prod4.dad.text,
                        addLev4.level - 1);
                    dadInfos = await getDadInfos.get(
                        selectedCategory4.categoryString!,
                        addLev4.level - 1,
                        numDad!);

                    outProduct.register(
                      newInputNumber,
                      auth,
                      double.parse(prod4.realQuantity.text),
                      prod4.name.text,
                      dateController.text,
                      hourController.text,
                      addLev4.level.toString(),
                      prod4.category.text,
                      newQtt,
                      // newLocalQtt,
                      local.result,
                      dadInfos!["name"],
                      culture.name.text,
                      phaseOption.phase,
                      prod4.unity.text,
                      false,
                      "",
                      "",
                    );
                  }
                  if (amountProducts.amount >= 5) {
                    prod5.activePrinciple.text = await getNameProduct.get(
                        prod5.category.text, prod5.dad.text, addLev5.level - 1);

                    newQtt = await updateQuantityRecursive(prod5, addLev5.level,
                        double.parse(prod5.realQuantity.text));

                    // newLocalQtt = await updateQuantityLocalRecursive(
                    //   prod5,
                    //   addLev5.level,
                    //   double.parse(prod5.realQuantity.text),
                    //   local.result,
                    // );

                    products5 = organizeCultureProducts.get(
                      products4,
                      prod5.category.text,
                      prod5.activePrinciple.text,
                      prod5.code.text,
                      prod5.realQuantity.text,
                      newQtt,
                      // newLocalQtt,
                      prod5.unity.text,
                      prod5.name.text,
                    );
                    listCultureProds = products5;

                    newInputNumber = newInputNumber + 1;

                    numDad = await numberProduct.get(
                        selectedCategory5.categoryString!,
                        prod5.dad.text,
                        addLev5.level - 1);
                    dadInfos = await getDadInfos.get(
                        selectedCategory5.categoryString!,
                        addLev5.level - 1,
                        numDad!);

                    outProduct.register(
                      newInputNumber,
                      auth,
                      double.parse(prod5.realQuantity.text),
                      prod5.name.text,
                      dateController.text,
                      hourController.text,
                      addLev5.level.toString(),
                      prod5.category.text,
                      newQtt,
                      // newLocalQtt,
                      local.result,
                      dadInfos!["name"],
                      culture.name.text,
                      phaseOption.phase,
                      prod5.unity.text,
                      false,
                      "",
                      "",
                    );
                  }
                  if (amountProducts.amount >= 6) {
                    prod6.activePrinciple.text = await getNameProduct.get(
                        prod6.category.text, prod6.dad.text, addLev6.level - 1);

                    newQtt = await updateQuantityRecursive(prod6, addLev6.level,
                        double.parse(prod6.realQuantity.text));

                    // newLocalQtt = await updateQuantityLocalRecursive(
                    //   prod6,
                    //   addLev6.level,
                    //   double.parse(prod6.realQuantity.text),
                    //   local.result,
                    // );

                    products6 = organizeCultureProducts.get(
                      products5,
                      prod6.category.text,
                      prod6.activePrinciple.text,
                      prod6.code.text,
                      prod6.realQuantity.text,
                      newQtt,
                      // newLocalQtt,
                      prod6.unity.text,
                      prod6.name.text,
                    );
                    listCultureProds = products6;

                    newInputNumber = newInputNumber + 1;

                    numDad = await numberProduct.get(
                        selectedCategory6.categoryString!,
                        prod6.dad.text,
                        addLev6.level - 1);
                    dadInfos = await getDadInfos.get(
                        selectedCategory6.categoryString!,
                        addLev6.level - 1,
                        numDad!);

                    outProduct.register(
                      newInputNumber,
                      auth,
                      double.parse(prod6.realQuantity.text),
                      prod6.name.text,
                      dateController.text,
                      hourController.text,
                      addLev6.level.toString(),
                      prod6.category.text,
                      newQtt,
                      // newLocalQtt,
                      local.result,
                      dadInfos!["name"],
                      culture.name.text,
                      phaseOption.phase,
                      prod6.unity.text,
                      false,
                      "",
                      "",
                    );
                  }
                  if (amountProducts.amount >= 7) {
                    prod7.activePrinciple.text = await getNameProduct.get(
                        prod7.category.text, prod7.dad.text, addLev7.level - 1);

                    newQtt = await updateQuantityRecursive(prod7, addLev7.level,
                        double.parse(prod7.realQuantity.text));

                    // newLocalQtt = await updateQuantityLocalRecursive(
                    //   prod7,
                    //   addLev7.level,
                    //   double.parse(prod7.realQuantity.text),
                    //   local.result,
                    // );

                    products7 = organizeCultureProducts.get(
                      products6,
                      prod7.category.text,
                      prod7.activePrinciple.text,
                      prod7.code.text,
                      prod7.realQuantity.text,
                      newQtt,
                      // newLocalQtt,
                      prod7.unity.text,
                      prod7.name.text,
                    );
                    listCultureProds = products7;

                    newInputNumber = newInputNumber + 1;

                    numDad = await numberProduct.get(
                        selectedCategory7.categoryString!,
                        prod7.dad.text,
                        addLev7.level - 1);
                    dadInfos = await getDadInfos.get(
                        selectedCategory7.categoryString!,
                        addLev7.level - 1,
                        numDad!);

                    outProduct.register(
                      newInputNumber,
                      auth,
                      double.parse(prod7.realQuantity.text),
                      prod7.name.text,
                      dateController.text,
                      hourController.text,
                      addLev7.level.toString(),
                      prod7.category.text,
                      newQtt,
                      // newLocalQtt,
                      local.result,
                      dadInfos!["name"],
                      culture.name.text,
                      phaseOption.phase,
                      prod7.unity.text,
                      false,
                      "",
                      "",
                    );
                  }
                  if (amountProducts.amount >= 8) {
                    prod8.activePrinciple.text = await getNameProduct.get(
                        prod8.category.text, prod8.dad.text, addLev8.level - 1);

                    newQtt = await updateQuantityRecursive(prod8, addLev8.level,
                        double.parse(prod8.realQuantity.text));

                    // newLocalQtt = await updateQuantityLocalRecursive(
                    //   prod8,
                    //   addLev8.level,
                    //   double.parse(prod8.realQuantity.text),
                    //   local.result,
                    // );

                    products8 = organizeCultureProducts.get(
                      products7,
                      prod8.category.text,
                      prod8.activePrinciple.text,
                      prod8.code.text,
                      prod8.realQuantity.text,
                      newQtt,
                      // newLocalQtt,
                      prod8.unity.text,
                      prod8.name.text,
                    );
                    listCultureProds = products8;

                    newInputNumber = newInputNumber + 1;

                    numDad = await numberProduct.get(
                        selectedCategory8.categoryString!,
                        prod8.dad.text,
                        addLev8.level - 1);
                    dadInfos = await getDadInfos.get(
                        selectedCategory8.categoryString!,
                        addLev8.level - 1,
                        numDad!);

                    outProduct.register(
                      newInputNumber,
                      auth,
                      double.parse(prod8.realQuantity.text),
                      prod8.name.text,
                      dateController.text,
                      hourController.text,
                      addLev8.level.toString(),
                      prod8.category.text,
                      newQtt,
                      // newLocalQtt,
                      local.result,
                      dadInfos!["name"],
                      culture.name.text,
                      phaseOption.phase,
                      prod8.unity.text,
                      false,
                      "",
                      "",
                    );
                  }
                  if (amountProducts.amount >= 9) {
                    prod9.activePrinciple.text = await getNameProduct.get(
                        prod9.category.text, prod9.dad.text, addLev9.level - 1);

                    newQtt = await updateQuantityRecursive(prod9, addLev9.level,
                        double.parse(prod9.realQuantity.text));

                    // newLocalQtt = await updateQuantityLocalRecursive(
                    //   prod9,
                    //   addLev9.level,
                    //   double.parse(prod9.realQuantity.text),
                    //   local.result,
                    // );

                    products9 = organizeCultureProducts.get(
                      products8,
                      prod9.category.text,
                      prod9.activePrinciple.text,
                      prod9.code.text,
                      prod9.realQuantity.text,
                      newQtt,
                      // newLocalQtt,
                      prod9.unity.text,
                      prod9.name.text,
                    );
                    listCultureProds = products9;

                    newInputNumber = newInputNumber + 1;

                    numDad = await numberProduct.get(
                        selectedCategory9.categoryString!,
                        prod9.dad.text,
                        addLev9.level - 1);
                    dadInfos = await getDadInfos.get(
                        selectedCategory9.categoryString!,
                        addLev9.level - 1,
                        numDad!);

                    outProduct.register(
                      newInputNumber,
                      auth,
                      double.parse(prod9.realQuantity.text),
                      prod9.name.text,
                      dateController.text,
                      hourController.text,
                      addLev9.level.toString(),
                      prod9.category.text,
                      newQtt,
                      // newLocalQtt,
                      local.result,
                      dadInfos!["name"],
                      culture.name.text,
                      phaseOption.phase,
                      prod9.unity.text,
                      false,
                      "",
                      "",
                    );
                  }
                  if (amountProducts.amount >= 10) {
                    prod10.activePrinciple.text = await getNameProduct.get(
                        prod10.category.text,
                        prod10.dad.text,
                        addLev10.level - 1);

                    newQtt = await updateQuantityRecursive(prod10,
                        addLev10.level, double.parse(prod10.realQuantity.text));

                    // newLocalQtt = await updateQuantityLocalRecursive(
                    //   prod10,
                    //   addLev10.level,
                    //   double.parse(prod10.realQuantity.text),
                    //   local.result,
                    // );

                    products10 = organizeCultureProducts.get(
                      products9,
                      prod10.category.text,
                      prod10.activePrinciple.text,
                      prod10.code.text,
                      prod10.realQuantity.text,
                      newQtt,
                      // newLocalQtt,
                      prod10.unity.text,
                      prod10.name.text,
                    );
                    listCultureProds = products10;

                    newInputNumber = newInputNumber + 1;

                    numDad = await numberProduct.get(
                        selectedCategory10.categoryString!,
                        prod10.dad.text,
                        addLev10.level - 1);
                    dadInfos = await getDadInfos.get(
                        selectedCategory10.categoryString!,
                        addLev10.level - 1,
                        numDad!);

                    outProduct.register(
                      newInputNumber,
                      auth,
                      double.parse(prod10.realQuantity.text),
                      prod10.name.text,
                      dateController.text,
                      hourController.text,
                      addLev10.level.toString(),
                      prod10.category.text,
                      newQtt,
                      // newLocalQtt,
                      local.result,
                      dadInfos!["name"],
                      culture.name.text,
                      phaseOption.phase,
                      prod10.unity.text,
                      false,
                      "",
                      "",
                    );
                  }

                  int number = await getLastIdCultures.get();
                  int nextNumber = number + 1;

                  DateTime dateTime = DateFormat('dd/MM/yyyy hh:mm')
                      .parse("${dateController.text} ${hourController.text}");
                  Timestamp timestamp = Timestamp.fromMillisecondsSinceEpoch(
                      dateTime.millisecondsSinceEpoch + 10800000);

                  if (cultureStage.stage == "start") {
                    await registerCulture.register(
                      nextNumber,
                      {
                        'id': nextNumber,
                        'cultureName': culture.name.text,
                        'dateOutput': timestamp,
                        'dateRegister': FieldValue.serverTimestamp(),
                        'opened': true,
                        'phase': phaseOption.phase,
                        'products': listCultureProds,
                        'user': auth.usuario!.uid,
                      },
                    );
                    // ignore: use_build_context_synchronously
                    await alert.alert(context, "Cultura iniciada com sucesso.",
                        "SUCESSO!", AlertType.success);
                  } else if (cultureStage.stage == "continue") {
                    await registerCulture.register(
                      nextNumber,
                      {
                        'id': nextNumber,
                        'cultureName': userCultures
                                .culturesList[indexCultureSelected.index!]
                            ['cultureName'],
                        'dateOutput': timestamp,
                        'dateRegister': FieldValue.serverTimestamp(),
                        'opened': true,
                        'phase': phaseOption.phase,
                        'products': listCultureProds,
                        'user': auth.usuario!.uid
                      },
                    );
                    // ignore: use_build_context_synchronously
                    await alert.alert(
                        context,
                        "Fase adicionada à cultura com sucesso.",
                        "SUCESSO!",
                        AlertType.success);
                  } else if (cultureStage.stage == "finish") {
                    await registerCulture.register(
                      nextNumber,
                      {
                        'id': nextNumber,
                        'cultureName': userCultures
                                .culturesList[indexCultureSelected.index!]
                            ['cultureName'],
                        'dateOutput': timestamp,
                        'dateRegister': FieldValue.serverTimestamp(),
                        'opened': false,
                        'phase': phaseOption.phase,
                        'products': listCultureProds,
                        'user': auth.usuario!.uid
                      },
                    );
                    for (int index in userCultures.names[
                        "${userCultures.culturesList[indexCultureSelected.index!]['cultureName']}"]!) {
                      finishCulturePhases
                          .finish(userCultures.culturesList[index]["id"]);
                    }
                    // ignore: use_build_context_synchronously
                    await alert.alert(
                        context,
                        "Cultura finalizada com sucesso.",
                        "SUCESSO!",
                        AlertType.success);
                  }
                  resetControlls();
                  isLoading.resetIsLoading();
                  // ignore: use_build_context_synchronously
                  FocusScope.of(context).requestFocus(FocusNode());
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return AuthCheck(first: false);
                      },
                    ),
                  );
                }
              } catch (e) {
                // ignore: use_build_context_synchronously
                await alert.alert(
                    context, "Algo deu errado!", "ERRO!", AlertType.error);
              }
            }
            isLoading.resetIsLoading();
          }
        },
        child: isLoading.isLoading
            ? Lottie.asset('assets/loading.json', height: 50, width: 50)
            : const Icon(Icons.arrow_forward_rounded),
      ),
    );
  }
}
