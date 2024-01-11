import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flv_farm/pages/login/utils/auth_check.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:universal_io/io.dart';

import '../../../db/cultures/delete_phase/delete_phase.dart';
import '../../../db/cultures/finish_culture/finish_culture_phases.dart';
import '../../../db/cultures/reactive_culture/reactive_culture.dart';
import '../../../providers/providers.dart';
import '../../../shared/alert.dart';

// ignore: must_be_immutable
class ReactiveCulturePage extends HookConsumerWidget {
  ReactiveCulturePage({super.key});

  AlertWidget alert = AlertWidget();
  FinishCulturePhases finishCulturePhases = FinishCulturePhases();
  DeletePhase deletePhase = DeletePhase();

  ReactiveCulturePhases reactiveCulturePhases = ReactiveCulturePhases();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deletePhaseProv = ref.watch(deletePhaseControllerProvider);
    final cultureReport = ref.watch(cultureReportProvider);
    final isLoading = ref.watch(loadingCultureProvider);

    void resetControlls() {
      deletePhaseProv.resetPhaseId();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reativar Cultura'),
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
        child: (cultureReport.allNamesCultures.isNotEmpty)
            ? Padding(
                padding: const EdgeInsets.all(30),
                child: ListView.builder(
                  itemCount: cultureReport.allNamesCultures.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: Platform.isAndroid
                          ? const EdgeInsets.only(bottom: 20)
                          : EdgeInsets.only(
                              bottom: 20,
                              left: MediaQuery.of(context).size.width * 0.3,
                              right: MediaQuery.of(context).size.width * 0.3,
                            ),
                      decoration: cultureReport.selectedCulture ==
                              cultureReport.allNamesCultures[index]
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
                              color: Color.fromARGB(223, 164, 240, 154),
                            ),
                      child: ListTile(
                        title: Text(
                          cultureReport.allNamesCultures[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          cultureReport.setSelectedCulture(
                              cultureReport.allNamesCultures[index]);
                        },
                      ),
                    );
                  },
                ),
              )
            : const Padding(
                padding: EdgeInsets.all(40),
                child: Center(
                  child: Text(
                    "Não há culturas finalizadas para reativar.",
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (!isLoading.isLoading) {
            isLoading.setIsLoading();
            if (cultureReport.selectedCulture == "") {
              isLoading.resetIsLoading();
              alert.alert(context, "Selecione uma cultura para reativar.",
                  "ATENÇÃO!", AlertType.info);
            } else {
              List<int> idsList = [];

              idsList = await reactiveCulturePhases
                  .getCultureIds(cultureReport.selectedCulture);

              for (var id in idsList) {
                await reactiveCulturePhases.reactive(id);
              }
              isLoading.resetIsLoading();
              // ignore: use_build_context_synchronously
              await alert.alert(context, "Cultura reativada com sucesso.",
                  "SUCESSO!", AlertType.success);
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
            }
          }
        },
        child: isLoading.isLoading
            ? Lottie.asset('assets/loading.json', height: 50, width: 50)
            : const Icon(Icons.arrow_forward_rounded),
      ),
    );
  }
}
