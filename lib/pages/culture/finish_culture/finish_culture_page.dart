import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flv_farm/pages/login/utils/auth_check.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:universal_io/io.dart';

import '../../../db/cultures/finish_culture/finish_culture_phases.dart';
import '../../../providers/providers.dart';
import '../../../shared/alert.dart';
import '../utils/phase_container_culture.dart';
import '../utils/select_culture_phases_page.dart';

// ignore: must_be_immutable
class FinishCulturePage extends HookConsumerWidget {
  FinishCulturePage({super.key});

  AlertWidget alert = AlertWidget();
  FinishCulturePhases finishCulturePhases = FinishCulturePhases();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final culture = ref.watch(cultureProvider);
    final userCultures = ref.watch(userCulturesProvider);
    final indexCultureSelected = ref.watch(indexCultureSelectedProvider);
    final isLoading = ref.watch(loadingCultureProvider);

    bool lastPhase = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finalizar Cultura'),
      ),
      body: (userCultures.culturesList.isNotEmpty)
          ? ListView.builder(
              itemCount: userCultures.culturesList.length,
              itemBuilder: (BuildContext context, int index) {
                bool repeated = false;
                List<int> indexesRepeted = [];

                if (userCultures.names[
                        "${userCultures.culturesList[index]['cultureName']}"] !=
                    null) {
                  if (userCultures
                          .names[
                              "${userCultures.culturesList[index]['cultureName']}"]!
                          .length >
                      1) {
                    indexesRepeted = userCultures.names[
                        "${userCultures.culturesList[index]['cultureName']}"]!;
                    if (userCultures.names[
                                "${userCultures.culturesList[index]['cultureName']}"]![
                            0] !=
                        index) {
                      repeated = true;
                    }
                  }
                }

                return (repeated == true)
                    ? Container()
                    : Container(
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
                        child: InkWell(
                          onTap: () {
                            culture.name.text =
                                userCultures.culturesList[index]['cultureName'];
                            indexCultureSelected.setIndex(index);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: (indexCultureSelected.index == index)
                                  ? const Color.fromARGB(255, 211, 210, 210)
                                  : const Color.fromARGB(255, 177, 174, 174),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: (indexCultureSelected.index == index)
                                      ? Colors.black26
                                      : const Color.fromARGB(255, 94, 94, 94)),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 200, 199, 199)
                                          .withOpacity(0.5),
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
                                    color: (indexCultureSelected.index == index)
                                        ? Colors.green
                                        : Colors.green[300],
                                    border: Border.all(
                                        color: (indexCultureSelected.index ==
                                                index)
                                            ? Colors.white
                                            : Colors.grey),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                                255, 211, 211, 211)
                                            .withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: const Offset(1, 1),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    "${userCultures.culturesList[index]['cultureName']}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color:
                                          (indexCultureSelected.index == index)
                                              ? Colors.white
                                              : Colors.black26,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Visibility(
                                  visible: indexCultureSelected.index == index,
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: userCultures
                                        .names[
                                            "${userCultures.culturesList[index]['cultureName']}"]!
                                        .length,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int indexSec) {
                                      return PhaseContainerCulture(
                                        userCultures: userCultures,
                                        index: index,
                                        indexCultureSelected:
                                            indexCultureSelected,
                                        indexesRepeted: indexesRepeted,
                                        seq: indexSec + 1,
                                        historic: false,
                                      );
                                    },
                                  ),
                                ),
                                Visibility(
                                  visible: indexCultureSelected.index != index,
                                  child: PhaseContainerCulture(
                                    userCultures: userCultures,
                                    index: index,
                                    indexCultureSelected: indexCultureSelected,
                                    indexesRepeted: indexesRepeted,
                                    seq: 1,
                                    historic: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
              },
            )
          : const Padding(
              padding: EdgeInsets.all(40),
              child: Center(
                child: Text(
                  "Não há culturas registradas",
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
      floatingActionButton: (userCultures.culturesList.isNotEmpty)
          ? FloatingActionButton(
              onPressed: () async {
                if (!isLoading.isLoading) {
                  isLoading.setIsLoading();
                  if (indexCultureSelected.index == null) {
                    isLoading.resetIsLoading();
                    alert.alert(
                        context,
                        "Selecione uma cultura para continuar.",
                        "ATENÇÃO!",
                        AlertType.info);
                  } else {
                    lastPhase = true;
                    if (await confirm(
                      context,
                      title: const Text('Confirmação'),
                      content: const Text(
                          'Deseja adicionar fase antes de finalizar a cultura?'),
                      textOK: const Text('Sim'),
                      textCancel: const Text('Não, apenas finalizar.'),
                    )) {
                      lastPhase = false;
                      isLoading.resetIsLoading();
                      // ignore: use_build_context_synchronously
                      FocusScope.of(context).requestFocus(FocusNode());
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SelectCulturePhasesPage();
                          },
                        ),
                      );
                    }
                    if (lastPhase) {
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
                      isLoading.resetIsLoading();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return AuthCheck(first: false);
                          },
                        ),
                      );
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
