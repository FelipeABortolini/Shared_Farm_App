import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../core/auth_service.dart';
import '../../../providers/providers.dart';
import '../../../shared/alert.dart';
import '../../../shared/inputs_report.dart';
import '../../culture/start_culture/widgets/local_select.dart';
import '../generate_report.dart';

// ignore: must_be_immutable
class DailyReportPage extends HookConsumerWidget {
  DailyReportPage({super.key});

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
      dateProv.setDate(DateTime.now());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatório Diário'),
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Data do relatório",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                const SizedBox(height: 20),
                const Divider(thickness: 2),
                const SizedBox(height: 20),
                LocalSelect(local: local, multi: true, text: "Local do relatório",),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    if (!local.santaTerezinha) {
                      local.allSelected();
                    } else {
                      local.allUnselected();
                    }
                  },
                  child: Container(
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green[300]),
                    child: const Center(
                      child: Text(
                        'Selecionar todos',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (local.hasSeleted()) {
            dailyReport.resetControllers();
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
          } else {
            await alert.alert(
                context, "Selecione um local.", "ALERTA!", AlertType.info);
          }
        },
        child: const Icon(Icons.arrow_forward_rounded),
      ),
    );
  }
}
