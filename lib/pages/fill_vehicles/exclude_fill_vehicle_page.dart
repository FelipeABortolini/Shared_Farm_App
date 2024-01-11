import 'package:flutter/material.dart';
import 'package:flv_farm/pages/login/utils/auth_check.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:universal_io/io.dart';

import '../../../providers/providers.dart';
import '../../../shared/alert.dart';
import '../../db/vehicles/fill/exclude_fill.dart';

// ignore: must_be_immutable
class ExcludeFillVehiclePage extends HookConsumerWidget {
  ExcludeFillVehiclePage({super.key});

  AlertWidget alert = AlertWidget();

  ExcludeFill excludeFill = ExcludeFill();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loadingCultureProvider);
    final deleteFillVehicle = ref.watch(deleteFillVehicleProvider);

    void resetControllers() {
      deleteFillVehicle.reset();
    }

    Future<int> incrementUsedProducts(double total, String local) async {
      double newQuantity = 0;
      // double newLocalQuantity = 0;
      Map<String, dynamic>? currentProd = {};

      // GET CURRENT PRODUCT INFOS
      currentProd = await excludeFill.getInfoDiesel();

      newQuantity = double.parse(currentProd!["quantity"].toString()) + total;
      // newLocalQuantity = double.parse(currentProd[local].toString()) + total;

      await excludeFill.updateDiesel(newQuantity);

      return 0;
    }

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

    Future<void> decrementVehicleTank(
        String name, String plate, double qtt) async {
      String vehicleID;
      double newQtt = 0;

      vehicleID = await excludeFill.getVehicleID(name, plate);

      newQtt = await excludeFill.getVehicleTank(vehicleID) - qtt;

      await excludeFill.decrementVehicle(vehicleID, newQtt);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Excluir Abastecimento'),
      ),
      body: Padding(
        padding: Platform.isAndroid
            ? const EdgeInsets.all(20)
            : EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.3,
                right: MediaQuery.of(context).size.width * 0.3,
                top: 25,
                bottom: 20),
        child: (deleteFillVehicle.fills.isNotEmpty)
            ? ListView.builder(
                itemCount: deleteFillVehicle.fills.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          deleteFillVehicle.setIndexSelected(
                              deleteFillVehicle.fills[index]["ID"]);
                          deleteFillVehicle.setIndexListviewSelected(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: deleteFillVehicle.indexSelected ==
                                    deleteFillVehicle.fills[index]["ID"]
                                ? const Color.fromARGB(189, 235, 153, 136)
                                : const Color.fromARGB(0, 255, 193, 7),
                            border: Border.all(
                                color: deleteFillVehicle.indexSelected ==
                                        deleteFillVehicle.fills[index]["ID"]
                                    ? const Color.fromARGB(255, 255, 255, 255)
                                    : Colors.black12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat('dd/MM/yyyy, HH:mm').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        (deleteFillVehicle
                                                    .fills[index]['dateInput']
                                                    .seconds *
                                                1000) -
                                            10800 * 1000)),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: deleteFillVehicle.indexSelected
                                              .toString() ==
                                          deleteFillVehicle.fills[index]["ID"]
                                      ? const Color.fromARGB(255, 255, 255, 255)
                                      : Colors.black26,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${deleteFillVehicle.fills[index]['vehicle']} / ${deleteFillVehicle.fills[index]['plate']}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: deleteFillVehicle.indexSelected
                                              .toString() ==
                                          deleteFillVehicle.fills[index]["ID"]
                                      ? const Color.fromARGB(255, 255, 255, 255)
                                      : Colors.black26,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${deleteFillVehicle.fills[index]['quantity']} L",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: deleteFillVehicle.indexSelected
                                              .toString() ==
                                          deleteFillVehicle.fills[index]["ID"]
                                      ? const Color.fromARGB(255, 255, 255, 255)
                                      : Colors.black26,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                deleteFillVehicle.fills[index]['local'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: deleteFillVehicle.indexSelected
                                              .toString() ==
                                          deleteFillVehicle.fills[index]["ID"]
                                      ? const Color.fromARGB(255, 255, 255, 255)
                                      : Colors.black26,
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  );
                },
              )
            : const Padding(
                padding: EdgeInsets.all(40),
                child: Center(
                  child: Text(
                    "Não há abastecimentos registrados.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SF Pro Display',
                    ),
                  ),
                ),
              ),
      ),
      floatingActionButton: (deleteFillVehicle.fills.isNotEmpty)
          ? FloatingActionButton(
              onPressed: () async {
                if (!isLoading.isLoading) {
                  if (deleteFillVehicle.indexSelected == 0) {
                    await alert.alert(
                        context,
                        "Selecione um abastecimento para excluir.",
                        "ATENÇÃO!",
                        AlertType.info);
                  } else {
                    isLoading.setIsLoading();
                    try {
                      incrementUsedProducts(
                          double.parse(deleteFillVehicle
                              .fills[deleteFillVehicle.indexListviewSelected]
                                  ["quantity"]
                              .toString()),
                          toCamelCase(deleteFillVehicle.fills[deleteFillVehicle
                              .indexListviewSelected]["local"]));

                      decrementVehicleTank(
                          deleteFillVehicle.fills[deleteFillVehicle
                              .indexListviewSelected]["vehicle"],
                          deleteFillVehicle.fills[
                              deleteFillVehicle.indexListviewSelected]["plate"],
                          double.parse(deleteFillVehicle
                              .fills[deleteFillVehicle.indexListviewSelected]
                                  ["quantity"]
                              .toString()));

                      await excludeFill
                          .delOut(deleteFillVehicle.indexSelected.toString());

                      isLoading.resetIsLoading();
                      resetControllers();
                      // ignore: use_build_context_synchronously
                      await alert.alert(
                          context,
                          "Abastecimento excluído com sucesso.",
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
                          "Erro ao excluir abastecimento.",
                          "ERRO!",
                          AlertType.error);
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
