import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../db/recipes/del_recipe.dart';
import '../../../../providers/providers.dart';
import '../../../../shared/alert.dart';
import '../../../culture/start_culture/widgets/culture_type_select.dart';
import '../../../culture/utils/phase_option.dart';
import '../../../login/utils/auth_check.dart';

// ignore: must_be_immutable
class DelRecipeSelectPage extends HookConsumerWidget {
  DelRecipeSelectPage({super.key});

  AlertWidget alert = AlertWidget();
  DelRecipeElement delRecipeElement = DelRecipeElement();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cultureType = ref.watch(cultureTypeProvider);
    final phaseOption = ref.watch(selectPhaseProvider);
    final isLoading = ref.watch(loadingCultureProvider);

    void resetControlls() {
      phaseOption.resetPhase();
      cultureType.setSoja();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Limpar Receita'),
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
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CultureTypeSelect(tipoCultura: cultureType, recipe: true),
                const SizedBox(height: 40),
                const Text(
                  'Selecione uma fase de cultura',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                cultureType.soja
                    ? Column(
                        children: [
                          (phaseOption.phase == 'APLICAÇÃO DESSECAÇÃO')
                              ? Opacity(
                                  opacity: 1,
                                  child: PhaseOption(
                                      phase: 'APLICAÇÃO DESSECAÇÃO'))
                              : Opacity(
                                  opacity: 0.35,
                                  child: PhaseOption(
                                      phase: 'APLICAÇÃO DESSECAÇÃO')),
                          (phaseOption.phase ==
                                  'APLICAÇÃO SEQUENCIAL DESSECAÇÃO')
                              ? Opacity(
                                  opacity: 1,
                                  child: PhaseOption(
                                      phase: 'APLICAÇÃO SEQUENCIAL DESSECAÇÃO'))
                              : Opacity(
                                  opacity: 0.35,
                                  child: PhaseOption(
                                      phase:
                                          'APLICAÇÃO SEQUENCIAL DESSECAÇÃO')),
                          (phaseOption.phase == 'PLANTIO')
                              ? Opacity(
                                  opacity: 1,
                                  child: PhaseOption(phase: 'PLANTIO'))
                              : Opacity(
                                  opacity: 0.35,
                                  child: PhaseOption(phase: 'PLANTIO')),
                          (phaseOption.phase == 'APLICAÇÃO V3/V4')
                              ? Opacity(
                                  opacity: 1,
                                  child: PhaseOption(phase: 'APLICAÇÃO V3/V4'))
                              : Opacity(
                                  opacity: 0.35,
                                  child: PhaseOption(phase: 'APLICAÇÃO V3/V4')),
                          (phaseOption.phase == 'APLICAÇÃO COBERTURA')
                              ? Opacity(
                                  opacity: 1,
                                  child:
                                      PhaseOption(phase: 'APLICAÇÃO COBERTURA'))
                              : Opacity(
                                  opacity: 0.35,
                                  child: PhaseOption(
                                      phase: 'APLICAÇÃO COBERTURA')),
                          (phaseOption.phase == 'APLICAÇÃO V8/V9')
                              ? Opacity(
                                  opacity: 1,
                                  child: PhaseOption(phase: 'APLICAÇÃO V8/V9'))
                              : Opacity(
                                  opacity: 0.35,
                                  child: PhaseOption(phase: 'APLICAÇÃO V8/V9')),
                          (phaseOption.phase == 'APLICAÇÃO R1/R3')
                              ? Opacity(
                                  opacity: 1,
                                  child: PhaseOption(phase: 'APLICAÇÃO R1/R3'))
                              : Opacity(
                                  opacity: 0.35,
                                  child: PhaseOption(phase: 'APLICAÇÃO R1/R3')),
                          (phaseOption.phase == 'APLICAÇÃO R5/R5.2')
                              ? Opacity(
                                  opacity: 1,
                                  child:
                                      PhaseOption(phase: 'APLICAÇÃO R5/R5.2'))
                              : Opacity(
                                  opacity: 0.35,
                                  child:
                                      PhaseOption(phase: 'APLICAÇÃO R5/R5.2')),
                          // (phaseOption.phase == 'COLHEITA')
                          //     ? Opacity(
                          //         opacity: 1,
                          //         child: PhaseOption(phase: 'COLHEITA'))
                          //     : Opacity(
                          //         opacity: 0.35,
                          //         child: PhaseOption(phase: 'COLHEITA')),
                          const SizedBox(height: 50),
                        ],
                      )
                    : (cultureType.milho
                        ? Column(
                            children: [
                              (phaseOption.phase == 'PLANTIO')
                                  ? Opacity(
                                      opacity: 1,
                                      child: PhaseOption(phase: 'PLANTIO'))
                                  : Opacity(
                                      opacity: 0.35,
                                      child: PhaseOption(phase: 'PLANTIO')),
                              (phaseOption.phase == 'PALITINHO')
                                  ? Opacity(
                                      opacity: 1,
                                      child: PhaseOption(phase: 'PALITINHO'))
                                  : Opacity(
                                      opacity: 0.35,
                                      child: PhaseOption(phase: 'PALITINHO')),
                              (phaseOption.phase == 'APLICAÇÃO V2-V3')
                                  ? Opacity(
                                      opacity: 1,
                                      child:
                                          PhaseOption(phase: 'APLICAÇÃO V2-V3'))
                                  : Opacity(
                                      opacity: 0.35,
                                      child: PhaseOption(
                                          phase: 'APLICAÇÃO V2-V3')),
                              (phaseOption.phase == 'APLICAÇÃO V4-V5')
                                  ? Opacity(
                                      opacity: 1,
                                      child:
                                          PhaseOption(phase: 'APLICAÇÃO V4-V5'))
                                  : Opacity(
                                      opacity: 0.35,
                                      child: PhaseOption(
                                          phase: 'APLICAÇÃO V4-V5')),
                              (phaseOption.phase == 'APLICAÇÃO V8-V10')
                                  ? Opacity(
                                      opacity: 1,
                                      child: PhaseOption(
                                          phase: 'APLICAÇÃO V8-V10'))
                                  : Opacity(
                                      opacity: 0.35,
                                      child: PhaseOption(
                                          phase: 'APLICAÇÃO V8-V10')),
                              (phaseOption.phase == 'APLICAÇÃO R4-R5')
                                  ? Opacity(
                                      opacity: 1,
                                      child:
                                          PhaseOption(phase: 'APLICAÇÃO R4-R5'))
                                  : Opacity(
                                      opacity: 0.35,
                                      child: PhaseOption(
                                          phase: 'APLICAÇÃO R4-R5')),
                              // (phaseOption.phase == 'COLHEITA')
                              //     ? Opacity(
                              //         opacity: 1,
                              //         child: PhaseOption(phase: 'COLHEITA'))
                              //     : Opacity(
                              //         opacity: 0.35,
                              //         child: PhaseOption(phase: 'COLHEITA')),
                              const SizedBox(height: 50),
                            ],
                          )
                        : (cultureType.trigo
                            ? Column(
                                children: [
                                  (phaseOption.phase == 'APLICAÇÃO DESSECAÇÃO')
                                      ? Opacity(
                                          opacity: 1,
                                          child: PhaseOption(
                                              phase: 'APLICAÇÃO DESSECAÇÃO'))
                                      : Opacity(
                                          opacity: 0.35,
                                          child: PhaseOption(
                                              phase: 'APLICAÇÃO DESSECAÇÃO')),
                                  (phaseOption.phase == 'APLICAÇÃO SEQUENCIAL')
                                      ? Opacity(
                                          opacity: 1,
                                          child: PhaseOption(
                                              phase: 'APLICAÇÃO SEQUENCIAL'))
                                      : Opacity(
                                          opacity: 0.35,
                                          child: PhaseOption(
                                              phase: 'APLICAÇÃO SEQUENCIAL')),
                                  (phaseOption.phase == 'PLANTIO')
                                      ? Opacity(
                                          opacity: 1,
                                          child: PhaseOption(phase: 'PLANTIO'))
                                      : Opacity(
                                          opacity: 0.35,
                                          child: PhaseOption(phase: 'PLANTIO')),
                                  (phaseOption.phase == 'APLICAÇÃO HERBICIDA')
                                      ? Opacity(
                                          opacity: 1,
                                          child: PhaseOption(
                                              phase: 'APLICAÇÃO HERBICIDA'))
                                      : Opacity(
                                          opacity: 0.35,
                                          child: PhaseOption(
                                              phase: 'APLICAÇÃO HERBICIDA')),
                                  (phaseOption.phase == 'APLICAÇÃO COBERTURA')
                                      ? Opacity(
                                          opacity: 1,
                                          child: PhaseOption(
                                              phase: 'APLICAÇÃO COBERTURA'))
                                      : Opacity(
                                          opacity: 0.35,
                                          child: PhaseOption(
                                              phase: 'APLICAÇÃO COBERTURA')),
                                  (phaseOption.phase == 'ALONGAMENTO')
                                      ? Opacity(
                                          opacity: 1,
                                          child:
                                              PhaseOption(phase: 'ALONGAMENTO'))
                                      : Opacity(
                                          opacity: 0.35,
                                          child: PhaseOption(
                                              phase: 'ALONGAMENTO')),
                                  (phaseOption.phase == 'EMBORRACHAMENTO')
                                      ? Opacity(
                                          opacity: 1,
                                          child: PhaseOption(
                                              phase: 'EMBORRACHAMENTO'))
                                      : Opacity(
                                          opacity: 0.35,
                                          child: PhaseOption(
                                              phase: 'EMBORRACHAMENTO')),
                                  (phaseOption.phase ==
                                          'ESPIGAMENTO/FLORESCIMENTO')
                                      ? Opacity(
                                          opacity: 1,
                                          child: PhaseOption(
                                              phase:
                                                  'ESPIGAMENTO/FLORESCIMENTO'))
                                      : Opacity(
                                          opacity: 0.35,
                                          child: PhaseOption(
                                              phase:
                                                  'ESPIGAMENTO/FLORESCIMENTO')),
                                  (phaseOption.phase == 'ENXIMENTO DE GRÃOS')
                                      ? Opacity(
                                          opacity: 1,
                                          child: PhaseOption(
                                              phase: 'ENXIMENTO DE GRÃOS'))
                                      : Opacity(
                                          opacity: 0.35,
                                          child: PhaseOption(
                                              phase: 'ENXIMENTO DE GRÃOS')),
                                  (phaseOption.phase == 'MATURAÇÃO FINAL')
                                      ? Opacity(
                                          opacity: 1,
                                          child: PhaseOption(
                                              phase: 'MATURAÇÃO FINAL'))
                                      : Opacity(
                                          opacity: 0.35,
                                          child: PhaseOption(
                                              phase: 'MATURAÇÃO FINAL')),
                                  // (phaseOption.phase == 'COLHEITA')
                                  //     ? Opacity(
                                  //         opacity: 1,
                                  //         child:
                                  //             PhaseOption(phase: 'COLHEITA'))
                                  //     : Opacity(
                                  //         opacity: 0.35,
                                  //         child:
                                  //             PhaseOption(phase: 'COLHEITA')),
                                  const SizedBox(height: 50),
                                ],
                              )
                            : const SizedBox(height: 1))),
                const SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (!isLoading.isLoading) {
            isLoading.setIsLoading();
            try {
              await delRecipeElement.delete(
                  cultureType.result, phaseOption.phase);

              resetControlls();
              isLoading.resetIsLoading();
              // ignore: use_build_context_synchronously
              FocusScope.of(context).requestFocus(FocusNode());
              // ignore: use_build_context_synchronously
              await alert.alert(context, "Receita limpa com sucesso.",
                  "SUCESSO!", AlertType.success);
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => AuthCheck(first: true),
                ),
              );
            } catch (e) {
              isLoading.resetIsLoading();
              // ignore: use_build_context_synchronously
              alert.alert(
                  context, "Erro ao limpar receita.", "ERRO!", AlertType.error);
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
