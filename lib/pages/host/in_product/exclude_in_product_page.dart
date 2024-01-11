import 'package:flutter/material.dart';
import 'package:flv_farm/pages/login/utils/auth_check.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:universal_io/io.dart';

import '../../../db/products/in_product/exclude_in_product.dart';
import '../../../providers/providers.dart';
import '../../../shared/alert.dart';

// ignore: must_be_immutable
class ExcludeInProductPage extends HookConsumerWidget {
  ExcludeInProductPage({super.key});

  AlertWidget alert = AlertWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loadingCultureProvider);
    final deleteInProduct = ref.watch(deleteInProductProvider);

    ExcludeInProduct excludeInProduct = ExcludeInProduct();

    void resetControllers(){
      deleteInProduct.reset();
    }

    Future<void> decrementProducts(
      double qtt,
      String local,
      String code,
      String category,
    ) async {
      double newQtt = 0;
      // double newLocalQtt = 0;
      Map<String, dynamic>? currentProd = {};
      int nivel = 0;

      while (currentProd!.isEmpty && nivel <= 10) {
        nivel++;
        currentProd =
            await excludeInProduct.getCurrentProd(category, nivel, code);
      }

      newQtt = currentProd["quantity"] - qtt;
      // newLocalQtt = currentProd[local] - qtt;

      await excludeInProduct.decrementProd(
          newQtt, local, currentProd["ID"].toString(), nivel, category);
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Excluir Entrada'),
      ),
      body: Padding(
        padding: Platform.isAndroid
            ? const EdgeInsets.all(20)
            : EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.3,
                right: MediaQuery.of(context).size.width * 0.3,
                top: 25,
                bottom: 20),
        child: (deleteInProduct.ins.isNotEmpty)
            ? ListView.builder(
                itemCount: deleteInProduct.ins.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          deleteInProduct.setIndexSelected(
                              deleteInProduct.ins[index]["ID"]);
                          deleteInProduct.setIndexListviewSelected(index);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: deleteInProduct.indexSelected ==
                                    deleteInProduct.ins[index]["ID"]
                                ? const Color.fromARGB(189, 235, 153, 136)
                                : const Color.fromARGB(0, 255, 193, 7),
                            border: Border.all(
                                color: deleteInProduct.indexSelected ==
                                        deleteInProduct.ins[index]["ID"]
                                    ? const Color.fromARGB(255, 255, 255, 255)
                                    : Colors.black12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat('dd/MM/yyyy, HH:mm').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        (deleteInProduct.ins[index]['dateInput']
                                                    .seconds *
                                                1000) -
                                            10800 * 1000)),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: deleteInProduct.indexSelected
                                              .toString() ==
                                          deleteInProduct.ins[index]["ID"]
                                      ? const Color.fromARGB(255, 255, 255, 255)
                                      : Colors.black26,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${deleteInProduct.ins[index]['product']} / ${deleteInProduct.ins[index]['activePrinciple']}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: deleteInProduct.indexSelected
                                              .toString() ==
                                          deleteInProduct.ins[index]["ID"]
                                      ? const Color.fromARGB(255, 255, 255, 255)
                                      : Colors.black26,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${deleteInProduct.ins[index]['quantity']} ${deleteInProduct.ins[index]['unity']}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: deleteInProduct.indexSelected
                                              .toString() ==
                                          deleteInProduct.ins[index]["ID"]
                                      ? const Color.fromARGB(255, 255, 255, 255)
                                      : Colors.black26,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                deleteInProduct.ins[index]['local'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: deleteInProduct.indexSelected
                                              .toString() ==
                                          deleteInProduct.ins[index]["ID"]
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
                    "Não há entradas registradas.",
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
      floatingActionButton: (deleteInProduct.ins.isNotEmpty)
          ? FloatingActionButton(
              onPressed: () async {
                if (!isLoading.isLoading) {
                  if (deleteInProduct.indexSelected == 0) {
                    await alert.alert(
                        context,
                        "Selecione uma entrada para excluir.",
                        "ATENÇÃO!",
                        AlertType.info);
                  } else {
                    isLoading.setIsLoading();
                    try {
                      await decrementProducts(
                          double.parse(deleteInProduct.ins[deleteInProduct.indexListviewSelected]["quantity"].toString()),
                          toCamelCase(deleteInProduct
                                  .ins[deleteInProduct.indexListviewSelected]
                              ["local"]),
                          deleteInProduct
                                  .ins[deleteInProduct.indexListviewSelected]
                              ["code"],
                          deleteInProduct
                                  .ins[deleteInProduct.indexListviewSelected]
                              ["category"]);

                      await excludeInProduct
                          .delInProd(deleteInProduct.indexSelected.toString());

                      isLoading.resetIsLoading();
                      resetControllers();
                      // ignore: use_build_context_synchronously
                      await alert.alert(
                          context,
                          "Entrada excluída com sucesso.",
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
                      await alert.alert(context, "Erro ao excluir entrada.",
                          "ERRO!", AlertType.error);
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
