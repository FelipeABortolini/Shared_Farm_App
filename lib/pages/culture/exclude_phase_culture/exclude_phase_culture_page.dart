import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flv_farm/pages/login/utils/auth_check.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:universal_io/io.dart';

import '../../../db/cultures/delete_phase/delete_phase.dart';
import '../../../db/cultures/finish_culture/finish_culture_phases.dart';
import '../../../db/products/update_quantity/update_quantity.dart';
import '../../../providers/providers.dart';
import '../../../shared/alert.dart';
import '../utils/phase_container_culture.dart';
import '../utils/product_container_culture.dart';
import '../utils/product_container_culture_exclude.dart';
import '../utils/select_culture_phases_page.dart';

// ignore: must_be_immutable
class ExcludePhaseCulturePage extends HookConsumerWidget {
  ExcludePhaseCulturePage({super.key});

  AlertWidget alert = AlertWidget();
  FinishCulturePhases finishCulturePhases = FinishCulturePhases();
  DeletePhase deletePhase = DeletePhase();
  UpdateQuantity updateQuantity = UpdateQuantity();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final culture = ref.watch(cultureProvider);
    final userCultures = ref.watch(userCulturesProvider);
    final indexCultureSelected = ref.watch(indexCultureSelectedProvider);
    final deletePhaseProv = ref.watch(deletePhaseControllerProvider);
    final cultureReport = ref.watch(cultureReportProvider);
    final isLoading = ref.watch(loadingCultureProvider);

    bool lastPhase = false;

    Future<int> incrementUsedProducts(
        List<Map<String, dynamic>> productsList, String local) async {
      int nivel = 0;
      double quantity = 0;
      double newQuantity = 0;
      // double newLocalQuantity = 0;
      Map<String, dynamic>? currentProd = {};

      for (Map<String, dynamic> product in productsList) {
        quantity = double.parse(product["quantity"]);

        currentProd = {};
        quantity = 0;
        newQuantity = 0;
        // newLocalQuantity = 0;
        nivel = 0;

        // GET CURRENT PRODUCT INFOS
        while (currentProd!.isEmpty && nivel <= 10) {
          nivel++;
          currentProd = await deletePhase.getCurrentProd(
              product["category"], nivel, product["code"]);
        }

        if (currentProd.isNotEmpty) {
          quantity = double.parse(product["quantity"]);
          newQuantity = double.parse(currentProd["quantity"].toString()) +
              double.parse(product["quantity"]);
          // newLocalQuantity = double.parse(currentProd[local].toString()) +
          //     double.parse(product["quantity"]);

          // UPDATE
          await updateQuantity.update(product["category"], currentProd["ID"],
              newQuantity, nivel, "quantity");
          // await updateQuantity.update(
          //     product["category"], currentProd["ID"], nivel, local);
        }
      }
      return 0;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Excluir Fase de Cultura'),
        leading: IconButton(
          onPressed: () {
            deletePhaseProv.resetPhaseId();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: Platform.isAndroid
              ? const EdgeInsets.all(20)
              : EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.3,
                  right: MediaQuery.of(context).size.width * 0.3,
                  top: 20,
                  bottom: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 211, 210, 210),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.black26,
              ),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 200, 199, 199).withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                    border: Border.all(color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 211, 211, 211)
                            .withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Text(
                    cultureReport.selectedCulture,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      userCultures.names[cultureReport.selectedCulture]!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int indexS) {
                    return InkWell(
                      onTap: () {
                        deletePhaseProv.setPhaseId(
                            userCultures.cultureExclude[indexS]['id']);
                      },
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: deletePhaseProv.phaseId ==
                                      userCultures.cultureExclude[indexS]['id']
                                  ? const Color.fromARGB(189, 232, 162, 143)
                                  : const Color.fromARGB(0, 255, 193, 7),
                              border: Border.all(
                                  color: const Color.fromARGB(255, 99, 97, 97)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  userCultures.cultureExclude[indexS]['phase'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  DateFormat('dd/MM/yyyy, HH:mm').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          (userCultures
                                                      .cultureExclude[indexS]
                                                          ['dateOutput']
                                                      .seconds *
                                                  1000) -
                                              10800 * 1000)),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                (userCultures.cultureExclude[indexS]['phase'] ==
                                        "COLHEITA")
                                    ? Column(
                                        children: [
                                          const SizedBox(height: 10),
                                          Text(
                                            "Quantidade Líquida: ${userCultures.cultureExclude[indexS]['netQuantity']} kg",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            userCultures.cultureExclude[indexS]
                                                        ['moisture'] ==
                                                    ""
                                                ? "Umidade: N/A"
                                                : "Umidade: ${userCultures.cultureExclude[indexS]['moisture']} kg",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            userCultures.cultureExclude[indexS]
                                                        ['impurity'] ==
                                                    ""
                                                ? "Impureza: N/A"
                                                : "Impureza: ${userCultures.cultureExclude[indexS]['impurity']} kg",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            userCultures.cultureExclude[indexS]
                                                        ['damaged'] ==
                                                    ""
                                                ? "Avariado: N/A"
                                                : "Avariado: ${userCultures.cultureExclude[indexS]['damaged']} kg",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "Quantidade Classificada (kg): ${userCultures.cultureExclude[indexS]['classifiedQttKg']} kg",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "Quantidade Classificada (scs): ${userCultures.cultureExclude[indexS]['classifiedQttBags']} scs",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "Diferença: ${userCultures.cultureExclude[indexS]['percentualDifference']} %",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "Veículo: ${userCultures.cultureExclude[indexS]['plate']}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      )
                                    : userCultures.cultureExclude.isNotEmpty
                                        ? ProductContainerCultureExclude(
                                            userCultures: userCultures,
                                            seq: indexS + 1,
                                          )
                                        : const SizedBox(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: (userCultures.culturesList.isNotEmpty)
          ? FloatingActionButton(
              onPressed: () async {
                if (!isLoading.isLoading) {
                  if (deletePhaseProv.phaseId == 0) {
                    await alert.alert(
                        context,
                        "Selecione uma fase de cultura para remover.",
                        "ATENÇÃO!",
                        AlertType.info);
                  } else {
                    if (await confirm(
                      context,
                      title: const Text('Confirmação'),
                      content: const Text(
                          'Deseja realmente remover a fase selecionada da cultura?'),
                      textOK: const Text('Sim'),
                      textCancel: const Text('Não.'),
                    )) {
                      isLoading.setIsLoading();
                      try {
                        List<String> cultureNameSplit = [];
                        String localCulturePhaseToExclude = "";
                        Map<String, dynamic> culturePhaseToExclude = {};
                        List<Map<String, dynamic>> productsToIncrementList = [];

                        for (var culture in userCultures.cultureExclude) {
                          if (culture['id'] == deletePhaseProv.phaseId) {
                            culturePhaseToExclude = culture;
                          }
                        }

                        if (culturePhaseToExclude["phase"] != "COLHEITA") {
                          for (Map<String, dynamic> prod
                              in culturePhaseToExclude['products']) {
                            productsToIncrementList.add(prod);
                          }

                          cultureNameSplit =
                              culturePhaseToExclude['cultureName'].split(" ");

                          if (cultureNameSplit.last == "TEREZINHA") {
                            localCulturePhaseToExclude = "santaTerezinha";
                          } else if (cultureNameSplit.last == "REAL") {
                            localCulturePhaseToExclude = "real";
                          } else if (cultureNameSplit.last == "JOÃO") {
                            localCulturePhaseToExclude = "saoJoao";
                          } else if (cultureNameSplit.last == "JORGE") {
                            localCulturePhaseToExclude = "saoJorge";
                          } else if (cultureNameSplit.last == "CAMPINHO") {
                            localCulturePhaseToExclude = "campinho";
                          } else if (cultureNameSplit.last == "CRUZEIRO") {
                            localCulturePhaseToExclude = "cruzeiro";
                          }

                          // INCREMENTAR PRODUTOS USADOS
                          await incrementUsedProducts(productsToIncrementList,
                              localCulturePhaseToExclude);

                          // ELIMINAR REGISTROS DAS SAÍDAS
                          for (Map<String, dynamic> prod
                              in culturePhaseToExclude['products']) {
                            await deletePhase.delOuts(
                              prod["product"],
                              culturePhaseToExclude["phase"],
                              culturePhaseToExclude['cultureName'],
                              prod["quantity"],
                              DateTime.fromMillisecondsSinceEpoch(
                                  culturePhaseToExclude['dateOutput']
                                      .millisecondsSinceEpoch),
                            );
                          }
                        }

                        // EXCLUIR REGISTRO DA FASE EM CULTURAS
                        await deletePhase
                            .del(deletePhaseProv.phaseId.toString());

                        deletePhaseProv.resetPhaseId();

                        isLoading.resetIsLoading();

                        // ignore: use_build_context_synchronously
                        await alert.alert(
                            context,
                            "Dado de cultura excluído com sucesso.",
                            "SUCESSO!",
                            AlertType.success);

                        // ignore: use_build_context_synchronously
                        FocusScope.of(context).requestFocus(FocusNode());
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return AuthCheck(first: false);
                            },
                          ),
                        );
                      } catch (e) {
                        isLoading.resetIsLoading();
                        // ignore: use_build_context_synchronously
                        await alert.alert(
                            context,
                            "Erro ao excluir dado de cultura.",
                            "ERRO!",
                            AlertType.error);
                      }
                    }
                  }
                }
              },
              child: isLoading.isLoading
                  ? Lottie.asset('assets/loading.json', height: 50, width: 50)
                  : const Icon(Icons.arrow_forward_rounded),
            )
          : Container(),
    );
  }
}
