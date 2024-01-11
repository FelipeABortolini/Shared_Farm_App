import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../providers/providers.dart';
import '../../../../shared/alert.dart';
import '../../../culture/start_culture/widgets/culture_type_select.dart';
import '../../../culture/utils/phase_option.dart';
import '../../../culture/utils/update_to_recipe.dart';
import 'edit_recipe_page.dart';

// ignore: must_be_immutable
class EditRecipeSelectPage extends HookConsumerWidget {
  EditRecipeSelectPage({super.key});

  AlertWidget alert = AlertWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cultureType = ref.watch(cultureTypeProvider);
    final phaseOption = ref.watch(selectPhaseProvider);
    final recipeOption = ref.watch(recipeProvider);

    final prod1 = ref.watch(prod1Provider);
    final prod2 = ref.watch(prod2Provider);
    final prod3 = ref.watch(prod3Provider);
    final prod4 = ref.watch(prod4Provider);
    final prod5 = ref.watch(prod5Provider);
    final prod6 = ref.watch(prod6Provider);
    final prod7 = ref.watch(prod7Provider);
    final prod8 = ref.watch(prod8Provider);
    final prod9 = ref.watch(prod9Provider);
    final prod10 = ref.watch(prod10Provider);
    final selectedCategory1 = ref.watch(selectedCategory1Provider);
    final selectedCategory2 = ref.watch(selectedCategory2Provider);
    final selectedCategory3 = ref.watch(selectedCategory3Provider);
    final selectedCategory4 = ref.watch(selectedCategory4Provider);
    final selectedCategory5 = ref.watch(selectedCategory5Provider);
    final selectedCategory6 = ref.watch(selectedCategory6Provider);
    final selectedCategory7 = ref.watch(selectedCategory7Provider);
    final selectedCategory8 = ref.watch(selectedCategory8Provider);
    final selectedCategory9 = ref.watch(selectedCategory9Provider);
    final selectedCategory10 = ref.watch(selectedCategory10Provider);
    final adubos1 = ref.watch(adubos1Provider);
    final adubos2 = ref.watch(adubos2Provider);
    final adubos3 = ref.watch(adubos3Provider);
    final adubos4 = ref.watch(adubos4Provider);
    final adubos5 = ref.watch(adubos5Provider);
    final adubos6 = ref.watch(adubos6Provider);
    final adubos7 = ref.watch(adubos7Provider);
    final adubos8 = ref.watch(adubos8Provider);
    final adubos9 = ref.watch(adubos9Provider);
    final adubos10 = ref.watch(adubos10Provider);
    final sementes1 = ref.watch(sementes1Provider);
    final sementes2 = ref.watch(sementes2Provider);
    final sementes3 = ref.watch(sementes3Provider);
    final sementes4 = ref.watch(sementes4Provider);
    final sementes5 = ref.watch(sementes5Provider);
    final sementes6 = ref.watch(sementes6Provider);
    final sementes7 = ref.watch(sementes7Provider);
    final sementes8 = ref.watch(sementes8Provider);
    final sementes9 = ref.watch(sementes9Provider);
    final sementes10 = ref.watch(sementes10Provider);
    final inseticidas1 = ref.watch(inseticidas1Provider);
    final inseticidas2 = ref.watch(inseticidas2Provider);
    final inseticidas3 = ref.watch(inseticidas3Provider);
    final inseticidas4 = ref.watch(inseticidas4Provider);
    final inseticidas5 = ref.watch(inseticidas5Provider);
    final inseticidas6 = ref.watch(inseticidas6Provider);
    final inseticidas7 = ref.watch(inseticidas7Provider);
    final inseticidas8 = ref.watch(inseticidas8Provider);
    final inseticidas9 = ref.watch(inseticidas9Provider);
    final inseticidas10 = ref.watch(inseticidas10Provider);
    final herbicidas1 = ref.watch(herbicidas1Provider);
    final herbicidas2 = ref.watch(herbicidas2Provider);
    final herbicidas3 = ref.watch(herbicidas3Provider);
    final herbicidas4 = ref.watch(herbicidas4Provider);
    final herbicidas5 = ref.watch(herbicidas5Provider);
    final herbicidas6 = ref.watch(herbicidas6Provider);
    final herbicidas7 = ref.watch(herbicidas7Provider);
    final herbicidas8 = ref.watch(herbicidas8Provider);
    final herbicidas9 = ref.watch(herbicidas9Provider);
    final herbicidas10 = ref.watch(herbicidas10Provider);
    final fungicidas1 = ref.watch(fungicidas1Provider);
    final fungicidas2 = ref.watch(fungicidas2Provider);
    final fungicidas3 = ref.watch(fungicidas3Provider);
    final fungicidas4 = ref.watch(fungicidas4Provider);
    final fungicidas5 = ref.watch(fungicidas5Provider);
    final fungicidas6 = ref.watch(fungicidas6Provider);
    final fungicidas7 = ref.watch(fungicidas7Provider);
    final fungicidas8 = ref.watch(fungicidas8Provider);
    final fungicidas9 = ref.watch(fungicidas9Provider);
    final fungicidas10 = ref.watch(fungicidas10Provider);
    final adjuvantes1 = ref.watch(adjuvantes1Provider);
    final adjuvantes2 = ref.watch(adjuvantes2Provider);
    final adjuvantes3 = ref.watch(adjuvantes3Provider);
    final adjuvantes4 = ref.watch(adjuvantes4Provider);
    final adjuvantes5 = ref.watch(adjuvantes5Provider);
    final adjuvantes6 = ref.watch(adjuvantes6Provider);
    final adjuvantes7 = ref.watch(adjuvantes7Provider);
    final adjuvantes8 = ref.watch(adjuvantes8Provider);
    final adjuvantes9 = ref.watch(adjuvantes9Provider);
    final adjuvantes10 = ref.watch(adjuvantes10Provider);
    final inoculantes1 = ref.watch(inoculantes1Provider);
    final inoculantes2 = ref.watch(inoculantes2Provider);
    final inoculantes3 = ref.watch(inoculantes3Provider);
    final inoculantes4 = ref.watch(inoculantes4Provider);
    final inoculantes5 = ref.watch(inoculantes5Provider);
    final inoculantes6 = ref.watch(inoculantes6Provider);
    final inoculantes7 = ref.watch(inoculantes7Provider);
    final inoculantes8 = ref.watch(inoculantes8Provider);
    final inoculantes9 = ref.watch(inoculantes9Provider);
    final inoculantes10 = ref.watch(inoculantes10Provider);
    final diesel1 = ref.watch(diesel1Provider);
    final diesel2 = ref.watch(diesel2Provider);
    final diesel3 = ref.watch(diesel3Provider);
    final diesel4 = ref.watch(diesel4Provider);
    final diesel5 = ref.watch(diesel5Provider);
    final diesel6 = ref.watch(diesel6Provider);
    final diesel7 = ref.watch(diesel7Provider);
    final diesel8 = ref.watch(diesel8Provider);
    final diesel9 = ref.watch(diesel9Provider);
    final diesel10 = ref.watch(diesel10Provider);
    final fertilizantesFoliares1 = ref.watch(fertilizantesFoliares1Provider);
    final fertilizantesFoliares2 = ref.watch(fertilizantesFoliares2Provider);
    final fertilizantesFoliares3 = ref.watch(fertilizantesFoliares3Provider);
    final fertilizantesFoliares4 = ref.watch(fertilizantesFoliares4Provider);
    final fertilizantesFoliares5 = ref.watch(fertilizantesFoliares5Provider);
    final fertilizantesFoliares6 = ref.watch(fertilizantesFoliares6Provider);
    final fertilizantesFoliares7 = ref.watch(fertilizantesFoliares7Provider);
    final fertilizantesFoliares8 = ref.watch(fertilizantesFoliares8Provider);
    final fertilizantesFoliares9 = ref.watch(fertilizantesFoliares9Provider);
    final fertilizantesFoliares10 = ref.watch(fertilizantesFoliares10Provider);
    final addLev1 = ref.watch(addLevel1Provider);
    final addLev2 = ref.watch(addLevel2Provider);
    final addLev3 = ref.watch(addLevel3Provider);
    final addLev4 = ref.watch(addLevel4Provider);
    final addLev5 = ref.watch(addLevel5Provider);
    final addLev6 = ref.watch(addLevel6Provider);
    final addLev7 = ref.watch(addLevel7Provider);
    final addLev8 = ref.watch(addLevel8Provider);
    final addLev9 = ref.watch(addLevel9Provider);
    final addLev10 = ref.watch(addLevel10Provider);
    final amountProducts = ref.watch(amountProductsProvider);

    void resetControlls() {
      phaseOption.resetPhase();
      cultureType.setSoja();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Receita'),
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
          await updateToRecipe(
            prod1,
            prod2,
            prod3,
            prod4,
            prod5,
            prod6,
            prod7,
            prod8,
            prod9,
            prod10,
            selectedCategory1,
            selectedCategory2,
            selectedCategory3,
            selectedCategory4,
            selectedCategory5,
            selectedCategory6,
            selectedCategory7,
            selectedCategory8,
            selectedCategory9,
            selectedCategory10,
            adubos1,
            adubos2,
            adubos3,
            adubos4,
            adubos5,
            adubos6,
            adubos7,
            adubos8,
            adubos9,
            adubos10,
            sementes1,
            sementes2,
            sementes3,
            sementes4,
            sementes5,
            sementes6,
            sementes7,
            sementes8,
            sementes9,
            sementes10,
            inseticidas1,
            inseticidas2,
            inseticidas3,
            inseticidas4,
            inseticidas5,
            inseticidas6,
            inseticidas7,
            inseticidas8,
            inseticidas9,
            inseticidas10,
            herbicidas1,
            herbicidas2,
            herbicidas3,
            herbicidas4,
            herbicidas5,
            herbicidas6,
            herbicidas7,
            herbicidas8,
            herbicidas9,
            herbicidas10,
            fungicidas1,
            fungicidas2,
            fungicidas3,
            fungicidas4,
            fungicidas5,
            fungicidas6,
            fungicidas7,
            fungicidas8,
            fungicidas9,
            fungicidas10,
            adjuvantes1,
            adjuvantes2,
            adjuvantes3,
            adjuvantes4,
            adjuvantes5,
            adjuvantes6,
            adjuvantes7,
            adjuvantes8,
            adjuvantes9,
            adjuvantes10,
            inoculantes1,
            inoculantes2,
            inoculantes3,
            inoculantes4,
            inoculantes5,
            inoculantes6,
            inoculantes7,
            inoculantes8,
            inoculantes9,
            inoculantes10,
            diesel1,
            diesel2,
            diesel3,
            diesel4,
            diesel5,
            diesel6,
            diesel7,
            diesel8,
            diesel9,
            diesel10,
            fertilizantesFoliares1,
            fertilizantesFoliares2,
            fertilizantesFoliares3,
            fertilizantesFoliares4,
            fertilizantesFoliares5,
            fertilizantesFoliares6,
            fertilizantesFoliares7,
            fertilizantesFoliares8,
            fertilizantesFoliares9,
            fertilizantesFoliares10,
            addLev1,
            addLev2,
            addLev3,
            addLev4,
            addLev5,
            addLev6,
            addLev7,
            addLev8,
            addLev9,
            addLev10,
            recipeOption,
            phaseOption,
            cultureType,
            amountProducts,
          );
          // ignore: use_build_context_synchronously
          FocusScope.of(context).requestFocus(FocusNode());
          // ignore: use_build_context_synchronously
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return EditRecipePage();
              },
            ),
          );
        },
        child: const Icon(Icons.arrow_forward_rounded),
      ),
    );
  }
}
