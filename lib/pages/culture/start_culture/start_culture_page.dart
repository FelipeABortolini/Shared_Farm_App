import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/providers.dart';
import '../../../shared/alert.dart';
import '../utils/select_culture_phases_page.dart';
import 'widgets/culture_type_select.dart';
import 'widgets/culture_year_select.dart';
import 'widgets/local_select.dart';

// ignore: must_be_immutable
class StartCulturePage extends HookConsumerWidget {
  StartCulturePage({super.key});

  AlertWidget alert = AlertWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final culture = ref.watch(cultureProvider);
    final cultureType = ref.watch(cultureTypeProvider);
    final local = ref.watch(localProvider);
    final cultureYear = ref.watch(cultureYearProvider);

    void resetControlls() {
      cultureType.setSoja();
      local.setSantaTerezinha();
      cultureYear.setLastCurrent();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Cultura'),
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
                CultureTypeSelect(tipoCultura: cultureType),
                const SizedBox(height: 10),
                const Divider(thickness: 2),
                const SizedBox(height: 10),
                CultureYearSelect(anoCultura: cultureYear),
                const SizedBox(height: 10),
                const Divider(thickness: 2),
                const SizedBox(height: 10),
                LocalSelect(local: local),
                const SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if(cultureYear.result == ''){
            cultureYear.setLastCurrent();
          }
          culture.name.text =
              "${cultureType.result.toUpperCase()} ${cultureYear.result.toUpperCase()} ${local.result.toUpperCase()}";
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
        },
        child: const Icon(Icons.arrow_forward_rounded),
      ),
    );
  }
}
