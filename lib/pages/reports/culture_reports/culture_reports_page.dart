import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:universal_io/io.dart';

import '../../../core/auth_service.dart';
import '../../../providers/providers.dart';
import '../../../shared/alert.dart';
import '../generate_report.dart';

// ignore: must_be_immutable
class CulturesReportPage extends HookConsumerWidget {
  CulturesReportPage({super.key});

  AlertWidget alert = AlertWidget();

  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = ref.watch(localProvider);
    final dateProv = ref.watch(datePickerProvider);
    final reportType = ref.watch(reportTypeProvider);
    final dailyReport = ref.watch(dailyReportProvider);
    final cultureReport = ref.watch(cultureReportProvider);
    final stockReport = ref.watch(stockReportProvider);
    final fillReport = ref.watch(fillReportProvider);
    final auth = ref.watch(authServiceProvider.notifier);

    TextEditingController dateController =
        TextEditingController(text: formatter.format(dateProv.date));

    void resetControlls() {
      local.setSantaTerezinha();
      cultureReport.resetControllers();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatório de Cultura'),
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
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: ListView.builder(
              itemCount: cultureReport.allNamesCultures.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: Platform.isAndroid
                      ? const EdgeInsets.only(bottom: 20)
                      : const EdgeInsets.only(
                          bottom: 20,
                          left: 400,
                          right: 400,
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
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (cultureReport.selectedCulture == "") {
            alert.alert(context, "Selecione uma cultura para continuar.",
                "ATENÇÃO!", AlertType.info);
          } else {
            //cultureReport.resetControllers();
            // ignore: use_build_context_synchronously
            FocusScope.of(context).requestFocus(FocusNode());
            // ignore: use_build_context_synchronously
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return GenerateReportPage(
                    reportType: reportType,
                    dailyReport: dailyReport,
                    cultureReport: cultureReport,
                    stockReport: stockReport,
                    fillReport: fillReport,
                    dateProv: dateProv,
                    local: local,
                    auth: auth,
                  );
                },
              ),
            );
          }
        },
        child: const Icon(Icons.arrow_forward_rounded),
      ),
    );
  }
}
