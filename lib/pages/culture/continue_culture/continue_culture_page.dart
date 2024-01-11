import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:universal_io/io.dart';

import '../../../providers/providers.dart';
import '../../../shared/alert.dart';
import '../utils/culture_products_info_page.dart';
import '../utils/phase_container_culture.dart';
import '../utils/select_culture_phases_page.dart';

// ignore: must_be_immutable
class ContinueCulturePage extends HookConsumerWidget {
  ContinueCulturePage({super.key});

  AlertWidget alert = AlertWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final culture = ref.watch(cultureProvider);
    final userCultures = ref.watch(userCulturesProvider);
    final indexCultureSelected = ref.watch(indexCultureSelectedProvider);
    final isLoading = ref.watch(loadingCultureProvider);
    final user = ref.watch(userProvider);
    final phaseOption = ref.watch(selectPhaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Continuar Cultura'),
      ),
      body: (userCultures.culturesList.isNotEmpty)
          ? ListView.builder(
              itemCount: userCultures.culturesList.length,
              shrinkWrap: true,
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
                    : (user.currentUser["permission"] == "Operacional Básico"
                        ? Container(
                            padding: Platform.isAndroid
                                ? const EdgeInsets.all(20)
                                : EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * 0.3,
                                    right:
                                        MediaQuery.of(context).size.width * 0.3,
                                    top: 20,
                                    bottom: 20),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                culture.name.text = userCultures
                                    .culturesList[index]['cultureName'];
                                indexCultureSelected.setIndex(index);
                              },
                              child: Container(
                                // margin: Platform.isAndroid
                                //     ? const EdgeInsets.only(bottom: 20)
                                //     : const EdgeInsets.only(
                                //         bottom: 20,
                                //         left: 400,
                                //         right: 400,
                                //       ),
                                decoration: indexCultureSelected.index == index
                                    ? const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: Color.fromARGB(255, 70, 194, 74),
                                      )
                                    : const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color:
                                            Color.fromARGB(223, 164, 240, 154),
                                      ),
                                child: ListTile(
                                  title: Text(
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
                              ),
                            ),
                          )
                        : Container(
                            padding: Platform.isAndroid
                                ? const EdgeInsets.all(20)
                                : EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * 0.3,
                                    right:
                                        MediaQuery.of(context).size.width * 0.3,
                                    top: 20,
                                    bottom: 20),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                culture.name.text = userCultures
                                    .culturesList[index]['cultureName'];
                                indexCultureSelected.setIndex(index);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: (indexCultureSelected.index == index)
                                      ? const Color.fromARGB(255, 211, 210, 210)
                                      : const Color.fromARGB(
                                          255, 177, 174, 174),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color:
                                          (indexCultureSelected.index == index)
                                              ? Colors.black26
                                              : const Color.fromARGB(
                                                  255, 94, 94, 94)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                              255, 200, 199, 199)
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
                                        color: (indexCultureSelected.index ==
                                                index)
                                            ? Colors.green
                                            : Colors.green[300],
                                        border: Border.all(
                                            color:
                                                (indexCultureSelected.index ==
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
                                          color: (indexCultureSelected.index ==
                                                  index)
                                              ? Colors.white
                                              : Colors.black26,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Visibility(
                                      visible:
                                          indexCultureSelected.index == index,
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: userCultures
                                            .names[
                                                "${userCultures.culturesList[index]['cultureName']}"]!
                                            .length,
                                        shrinkWrap: true,
                                        itemBuilder: (BuildContext context,
                                            int indexSec) {
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
                                      visible:
                                          indexCultureSelected.index != index,
                                      child: PhaseContainerCulture(
                                        userCultures: userCultures,
                                        index: index,
                                        indexCultureSelected:
                                            indexCultureSelected,
                                        indexesRepeted: indexesRepeted,
                                        seq: 1,
                                        historic: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
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
                    await alert.alert(
                        context,
                        "Selecione uma cultura para continuar.",
                        "ATENÇÃO!",
                        AlertType.info);
                  } else {
                    isLoading.resetIsLoading();
                    if (user.currentUser["permission"] ==
                        "Operacional Básico") {
                      phaseOption.setPhase("COLHEITA");
                      // ignore: use_build_context_synchronously
                      FocusScope.of(context).requestFocus(FocusNode());
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return CultureProductsInfoPage();
                          },
                        ),
                      );
                    } else {
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
