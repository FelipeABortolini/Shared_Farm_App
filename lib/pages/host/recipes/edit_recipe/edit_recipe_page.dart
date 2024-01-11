import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../db/recipes/edit_recipe.dart';
import '../../../../providers/providers.dart';
import '../../../../shared/alert.dart';
import '../../../culture/utils/product_widget.dart';
import '../../../login/utils/auth_check.dart';

// ignore: must_be_immutable
class EditRecipePage extends HookConsumerWidget {
  EditRecipePage({super.key});

  AlertWidget alert = AlertWidget();
  EditRecipeElement editRecipeElement = EditRecipeElement();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cultureType = ref.watch(cultureTypeProvider);
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
    final phaseOption = ref.watch(selectPhaseProvider);
    final amountProducts = ref.watch(amountProductsProvider);
    final isLoading = ref.watch(loadingCultureProvider);

    void resetControlls() {
      amountProducts.setAmount(1);
      phaseOption.resetPhase();
      cultureType.setSoja();

      addLev1.resetLevel();
      addLev2.resetLevel();
      addLev3.resetLevel();
      addLev4.resetLevel();
      addLev5.resetLevel();
      addLev6.resetLevel();
      addLev7.resetLevel();
      addLev8.resetLevel();
      addLev9.resetLevel();
      addLev10.resetLevel();

      adubos1.setNoSelection();
      adubos2.setNoSelection();
      adubos3.setNoSelection();
      adubos4.setNoSelection();
      adubos5.setNoSelection();
      adubos6.setNoSelection();
      adubos7.setNoSelection();
      adubos8.setNoSelection();
      adubos9.setNoSelection();
      adubos10.setNoSelection();
      sementes1.setNoSelection();
      sementes2.setNoSelection();
      sementes3.setNoSelection();
      sementes4.setNoSelection();
      sementes5.setNoSelection();
      sementes6.setNoSelection();
      sementes7.setNoSelection();
      sementes8.setNoSelection();
      sementes9.setNoSelection();
      sementes10.setNoSelection();
      inseticidas1.setNoSelection();
      inseticidas2.setNoSelection();
      inseticidas3.setNoSelection();
      inseticidas4.setNoSelection();
      inseticidas5.setNoSelection();
      inseticidas6.setNoSelection();
      inseticidas7.setNoSelection();
      inseticidas8.setNoSelection();
      inseticidas9.setNoSelection();
      inseticidas10.setNoSelection();
      herbicidas1.setNoSelection();
      herbicidas2.setNoSelection();
      herbicidas3.setNoSelection();
      herbicidas4.setNoSelection();
      herbicidas5.setNoSelection();
      herbicidas6.setNoSelection();
      herbicidas7.setNoSelection();
      herbicidas8.setNoSelection();
      herbicidas9.setNoSelection();
      herbicidas10.setNoSelection();
      fungicidas1.setNoSelection();
      fungicidas2.setNoSelection();
      fungicidas3.setNoSelection();
      fungicidas4.setNoSelection();
      fungicidas5.setNoSelection();
      fungicidas6.setNoSelection();
      fungicidas7.setNoSelection();
      fungicidas8.setNoSelection();
      fungicidas9.setNoSelection();
      fungicidas10.setNoSelection();
      adjuvantes1.setNoSelection();
      adjuvantes2.setNoSelection();
      adjuvantes3.setNoSelection();
      adjuvantes4.setNoSelection();
      adjuvantes5.setNoSelection();
      adjuvantes6.setNoSelection();
      adjuvantes7.setNoSelection();
      adjuvantes8.setNoSelection();
      adjuvantes9.setNoSelection();
      adjuvantes10.setNoSelection();
      inoculantes1.setNoSelection();
      inoculantes2.setNoSelection();
      inoculantes3.setNoSelection();
      inoculantes4.setNoSelection();
      inoculantes5.setNoSelection();
      inoculantes6.setNoSelection();
      inoculantes7.setNoSelection();
      inoculantes8.setNoSelection();
      inoculantes9.setNoSelection();
      inoculantes10.setNoSelection();
      diesel1.setNoSelection();
      diesel2.setNoSelection();
      diesel3.setNoSelection();
      diesel4.setNoSelection();
      diesel5.setNoSelection();
      diesel6.setNoSelection();
      diesel7.setNoSelection();
      diesel8.setNoSelection();
      diesel9.setNoSelection();
      diesel10.setNoSelection();
      fertilizantesFoliares1.setNoSelection();
      fertilizantesFoliares2.setNoSelection();
      fertilizantesFoliares3.setNoSelection();
      fertilizantesFoliares4.setNoSelection();
      fertilizantesFoliares5.setNoSelection();
      fertilizantesFoliares6.setNoSelection();
      fertilizantesFoliares7.setNoSelection();
      fertilizantesFoliares8.setNoSelection();
      fertilizantesFoliares9.setNoSelection();
      fertilizantesFoliares10.setNoSelection();

      adubos1.resetAll();
      adubos2.resetAll();
      adubos3.resetAll();
      adubos4.resetAll();
      adubos5.resetAll();
      adubos6.resetAll();
      adubos7.resetAll();
      adubos8.resetAll();
      adubos9.resetAll();
      adubos10.resetAll();
      sementes1.resetAll();
      sementes2.resetAll();
      sementes3.resetAll();
      sementes4.resetAll();
      sementes5.resetAll();
      sementes6.resetAll();
      sementes7.resetAll();
      sementes8.resetAll();
      sementes9.resetAll();
      sementes10.resetAll();
      inseticidas1.resetAll();
      inseticidas2.resetAll();
      inseticidas3.resetAll();
      inseticidas4.resetAll();
      inseticidas5.resetAll();
      inseticidas6.resetAll();
      inseticidas7.resetAll();
      inseticidas8.resetAll();
      inseticidas9.resetAll();
      inseticidas10.resetAll();
      herbicidas1.resetAll();
      herbicidas2.resetAll();
      herbicidas3.resetAll();
      herbicidas4.resetAll();
      herbicidas5.resetAll();
      herbicidas6.resetAll();
      herbicidas7.resetAll();
      herbicidas8.resetAll();
      herbicidas9.resetAll();
      herbicidas10.resetAll();
      fungicidas1.resetAll();
      fungicidas2.resetAll();
      fungicidas3.resetAll();
      fungicidas4.resetAll();
      fungicidas5.resetAll();
      fungicidas6.resetAll();
      fungicidas7.resetAll();
      fungicidas8.resetAll();
      fungicidas9.resetAll();
      fungicidas10.resetAll();
      adjuvantes1.resetAll();
      adjuvantes2.resetAll();
      adjuvantes3.resetAll();
      adjuvantes4.resetAll();
      adjuvantes5.resetAll();
      adjuvantes6.resetAll();
      adjuvantes7.resetAll();
      adjuvantes8.resetAll();
      adjuvantes9.resetAll();
      adjuvantes10.resetAll();
      inoculantes1.resetAll();
      inoculantes2.resetAll();
      inoculantes3.resetAll();
      inoculantes4.resetAll();
      inoculantes5.resetAll();
      inoculantes6.resetAll();
      inoculantes7.resetAll();
      inoculantes8.resetAll();
      inoculantes9.resetAll();
      inoculantes10.resetAll();
      diesel1.resetAll();
      diesel2.resetAll();
      diesel3.resetAll();
      diesel4.resetAll();
      diesel5.resetAll();
      diesel6.resetAll();
      diesel7.resetAll();
      diesel8.resetAll();
      diesel9.resetAll();
      diesel10.resetAll();
      fertilizantesFoliares1.resetAll();
      fertilizantesFoliares2.resetAll();
      fertilizantesFoliares3.resetAll();
      fertilizantesFoliares4.resetAll();
      fertilizantesFoliares5.resetAll();
      fertilizantesFoliares6.resetAll();
      fertilizantesFoliares7.resetAll();
      fertilizantesFoliares8.resetAll();
      fertilizantesFoliares9.resetAll();
      fertilizantesFoliares10.resetAll();

      prod1.resetControllers();
      prod2.resetControllers();
      prod3.resetControllers();
      prod4.resetControllers();
      prod5.resetControllers();
      prod6.resetControllers();
      prod7.resetControllers();
      prod8.resetControllers();
      prod9.resetControllers();
      prod10.resetControllers();
      selectedCategory1.resetControllers();
      selectedCategory2.resetControllers();
      selectedCategory3.resetControllers();
      selectedCategory4.resetControllers();
      selectedCategory5.resetControllers();
      selectedCategory6.resetControllers();
      selectedCategory7.resetControllers();
      selectedCategory8.resetControllers();
      selectedCategory9.resetControllers();
      selectedCategory10.resetControllers();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Editar Receita',
        ),
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
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          "${cultureType.result.toUpperCase()} - ${phaseOption.phase}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ProductWidget(
                        selectedCategory: selectedCategory1,
                        selectedCategory1: selectedCategory1,
                        selectedCategory2: selectedCategory2,
                        selectedCategory3: selectedCategory3,
                        selectedCategory4: selectedCategory4,
                        selectedCategory5: selectedCategory5,
                        selectedCategory6: selectedCategory6,
                        selectedCategory7: selectedCategory7,
                        selectedCategory8: selectedCategory8,
                        selectedCategory9: selectedCategory9,
                        selectedCategory10: selectedCategory10,
                        adubos1: adubos1,
                        adubos2: adubos2,
                        adubos3: adubos3,
                        adubos4: adubos4,
                        adubos5: adubos5,
                        adubos6: adubos6,
                        adubos7: adubos7,
                        adubos8: adubos8,
                        adubos9: adubos9,
                        sementes1: sementes1,
                        sementes2: sementes2,
                        sementes3: sementes3,
                        sementes4: sementes4,
                        sementes5: sementes5,
                        sementes6: sementes6,
                        sementes7: sementes7,
                        sementes8: sementes8,
                        sementes9: sementes9,
                        inseticidas1: inseticidas1,
                        inseticidas2: inseticidas2,
                        inseticidas3: inseticidas3,
                        inseticidas4: inseticidas4,
                        inseticidas5: inseticidas5,
                        inseticidas6: inseticidas6,
                        inseticidas7: inseticidas7,
                        inseticidas8: inseticidas8,
                        inseticidas9: inseticidas9,
                        herbicidas1: herbicidas1,
                        herbicidas2: herbicidas2,
                        herbicidas3: herbicidas3,
                        herbicidas4: herbicidas4,
                        herbicidas5: herbicidas5,
                        herbicidas6: herbicidas6,
                        herbicidas7: herbicidas7,
                        herbicidas8: herbicidas8,
                        herbicidas9: herbicidas9,
                        fungicidas1: fungicidas1,
                        fungicidas2: fungicidas2,
                        fungicidas3: fungicidas3,
                        fungicidas4: fungicidas4,
                        fungicidas5: fungicidas5,
                        fungicidas6: fungicidas6,
                        fungicidas7: fungicidas7,
                        fungicidas8: fungicidas8,
                        fungicidas9: fungicidas9,
                        adjuvantes1: adjuvantes1,
                        adjuvantes2: adjuvantes2,
                        adjuvantes3: adjuvantes3,
                        adjuvantes4: adjuvantes4,
                        adjuvantes5: adjuvantes5,
                        adjuvantes6: adjuvantes6,
                        adjuvantes7: adjuvantes7,
                        adjuvantes8: adjuvantes8,
                        adjuvantes9: adjuvantes9,
                        inoculantes1: inoculantes1,
                        inoculantes2: inoculantes2,
                        inoculantes3: inoculantes3,
                        inoculantes4: inoculantes4,
                        inoculantes5: inoculantes5,
                        inoculantes6: inoculantes6,
                        inoculantes7: inoculantes7,
                        inoculantes8: inoculantes8,
                        inoculantes9: inoculantes9,
                        diesel1: diesel1,
                        diesel2: diesel2,
                        diesel3: diesel3,
                        diesel4: diesel4,
                        diesel5: diesel5,
                        diesel6: diesel6,
                        diesel7: diesel7,
                        diesel8: diesel8,
                        diesel9: diesel9,
                        fertilizantesFoliares1: fertilizantesFoliares1,
                        fertilizantesFoliares2: fertilizantesFoliares2,
                        fertilizantesFoliares3: fertilizantesFoliares3,
                        fertilizantesFoliares4: fertilizantesFoliares4,
                        fertilizantesFoliares5: fertilizantesFoliares5,
                        fertilizantesFoliares6: fertilizantesFoliares6,
                        fertilizantesFoliares7: fertilizantesFoliares7,
                        fertilizantesFoliares8: fertilizantesFoliares8,
                        fertilizantesFoliares9: fertilizantesFoliares9,
                        prod: "Produto 1",
                        product: prod1,
                        prod1: prod1,
                        prod2: prod2,
                        prod3: prod3,
                        prod4: prod4,
                        prod5: prod5,
                        prod6: prod6,
                        prod7: prod7,
                        prod8: prod8,
                        prod9: prod9,
                        prod10: prod10,
                        adjuvantes: adjuvantes1,
                        adubos: adubos1,
                        fungicidas: fungicidas1,
                        herbicidas: herbicidas1,
                        inseticidas: inseticidas1,
                        sementes: sementes1,
                        inoculantes: inoculantes1,
                        diesel: diesel1,
                        fertilizantesFoliares: fertilizantesFoliares1,
                        num: 1,
                        addLev: addLev1,
                        amount: amountProducts,
                        recipe: true,
                      ),
                      Visibility(
                        visible: (amountProducts.amount >= 2),
                        child: ProductWidget(
                          selectedCategory: selectedCategory2,
                          selectedCategory1: selectedCategory1,
                          selectedCategory2: selectedCategory2,
                          selectedCategory3: selectedCategory3,
                          selectedCategory4: selectedCategory4,
                          selectedCategory5: selectedCategory5,
                          selectedCategory6: selectedCategory6,
                          selectedCategory7: selectedCategory7,
                          selectedCategory8: selectedCategory8,
                          selectedCategory9: selectedCategory9,
                          selectedCategory10: selectedCategory10,
                          adubos1: adubos1,
                          adubos2: adubos2,
                          adubos3: adubos3,
                          adubos4: adubos4,
                          adubos5: adubos5,
                          adubos6: adubos6,
                          adubos7: adubos7,
                          adubos8: adubos8,
                          adubos9: adubos9,
                          sementes1: sementes1,
                          sementes2: sementes2,
                          sementes3: sementes3,
                          sementes4: sementes4,
                          sementes5: sementes5,
                          sementes6: sementes6,
                          sementes7: sementes7,
                          sementes8: sementes8,
                          sementes9: sementes9,
                          inseticidas1: inseticidas1,
                          inseticidas2: inseticidas2,
                          inseticidas3: inseticidas3,
                          inseticidas4: inseticidas4,
                          inseticidas5: inseticidas5,
                          inseticidas6: inseticidas6,
                          inseticidas7: inseticidas7,
                          inseticidas8: inseticidas8,
                          inseticidas9: inseticidas9,
                          herbicidas1: herbicidas1,
                          herbicidas2: herbicidas2,
                          herbicidas3: herbicidas3,
                          herbicidas4: herbicidas4,
                          herbicidas5: herbicidas5,
                          herbicidas6: herbicidas6,
                          herbicidas7: herbicidas7,
                          herbicidas8: herbicidas8,
                          herbicidas9: herbicidas9,
                          fungicidas1: fungicidas1,
                          fungicidas2: fungicidas2,
                          fungicidas3: fungicidas3,
                          fungicidas4: fungicidas4,
                          fungicidas5: fungicidas5,
                          fungicidas6: fungicidas6,
                          fungicidas7: fungicidas7,
                          fungicidas8: fungicidas8,
                          fungicidas9: fungicidas9,
                          adjuvantes1: adjuvantes1,
                          adjuvantes2: adjuvantes2,
                          adjuvantes3: adjuvantes3,
                          adjuvantes4: adjuvantes4,
                          adjuvantes5: adjuvantes5,
                          adjuvantes6: adjuvantes6,
                          adjuvantes7: adjuvantes7,
                          adjuvantes8: adjuvantes8,
                          adjuvantes9: adjuvantes9,
                          inoculantes1: inoculantes1,
                          inoculantes2: inoculantes2,
                          inoculantes3: inoculantes3,
                          inoculantes4: inoculantes4,
                          inoculantes5: inoculantes5,
                          inoculantes6: inoculantes6,
                          inoculantes7: inoculantes7,
                          inoculantes8: inoculantes8,
                          inoculantes9: inoculantes9,
                          diesel1: diesel1,
                          diesel2: diesel2,
                          diesel3: diesel3,
                          diesel4: diesel4,
                          diesel5: diesel5,
                          diesel6: diesel6,
                          diesel7: diesel7,
                          diesel8: diesel8,
                          diesel9: diesel9,
                          fertilizantesFoliares1: fertilizantesFoliares1,
                          fertilizantesFoliares2: fertilizantesFoliares2,
                          fertilizantesFoliares3: fertilizantesFoliares3,
                          fertilizantesFoliares4: fertilizantesFoliares4,
                          fertilizantesFoliares5: fertilizantesFoliares5,
                          fertilizantesFoliares6: fertilizantesFoliares6,
                          fertilizantesFoliares7: fertilizantesFoliares7,
                          fertilizantesFoliares8: fertilizantesFoliares8,
                          fertilizantesFoliares9: fertilizantesFoliares9,
                          prod: "Produto 2",
                          product: prod2,
                          prod1: prod1,
                          prod2: prod2,
                          prod3: prod3,
                          prod4: prod4,
                          prod5: prod5,
                          prod6: prod6,
                          prod7: prod7,
                          prod8: prod8,
                          prod9: prod9,
                          prod10: prod10,
                          adjuvantes: adjuvantes2,
                          adubos: adubos2,
                          fungicidas: fungicidas2,
                          herbicidas: herbicidas2,
                          inseticidas: inseticidas2,
                          sementes: sementes2,
                          inoculantes: inoculantes2,
                          diesel: diesel2,
                          fertilizantesFoliares: fertilizantesFoliares2,
                          num: 2,
                          addLev: addLev2,
                          amount: amountProducts,
                          recipe: true,
                        ),
                      ),
                      Visibility(
                        visible: (amountProducts.amount >= 3),
                        child: ProductWidget(
                          selectedCategory: selectedCategory3,
                          selectedCategory1: selectedCategory1,
                          selectedCategory2: selectedCategory2,
                          selectedCategory3: selectedCategory3,
                          selectedCategory4: selectedCategory4,
                          selectedCategory5: selectedCategory5,
                          selectedCategory6: selectedCategory6,
                          selectedCategory7: selectedCategory7,
                          selectedCategory8: selectedCategory8,
                          selectedCategory9: selectedCategory9,
                          selectedCategory10: selectedCategory10,
                          adubos1: adubos1,
                          adubos2: adubos2,
                          adubos3: adubos3,
                          adubos4: adubos4,
                          adubos5: adubos5,
                          adubos6: adubos6,
                          adubos7: adubos7,
                          adubos8: adubos8,
                          adubos9: adubos9,
                          sementes1: sementes1,
                          sementes2: sementes2,
                          sementes3: sementes3,
                          sementes4: sementes4,
                          sementes5: sementes5,
                          sementes6: sementes6,
                          sementes7: sementes7,
                          sementes8: sementes8,
                          sementes9: sementes9,
                          inseticidas1: inseticidas1,
                          inseticidas2: inseticidas2,
                          inseticidas3: inseticidas3,
                          inseticidas4: inseticidas4,
                          inseticidas5: inseticidas5,
                          inseticidas6: inseticidas6,
                          inseticidas7: inseticidas7,
                          inseticidas8: inseticidas8,
                          inseticidas9: inseticidas9,
                          herbicidas1: herbicidas1,
                          herbicidas2: herbicidas2,
                          herbicidas3: herbicidas3,
                          herbicidas4: herbicidas4,
                          herbicidas5: herbicidas5,
                          herbicidas6: herbicidas6,
                          herbicidas7: herbicidas7,
                          herbicidas8: herbicidas8,
                          herbicidas9: herbicidas9,
                          fungicidas1: fungicidas1,
                          fungicidas2: fungicidas2,
                          fungicidas3: fungicidas3,
                          fungicidas4: fungicidas4,
                          fungicidas5: fungicidas5,
                          fungicidas6: fungicidas6,
                          fungicidas7: fungicidas7,
                          fungicidas8: fungicidas8,
                          fungicidas9: fungicidas9,
                          adjuvantes1: adjuvantes1,
                          adjuvantes2: adjuvantes2,
                          adjuvantes3: adjuvantes3,
                          adjuvantes4: adjuvantes4,
                          adjuvantes5: adjuvantes5,
                          adjuvantes6: adjuvantes6,
                          adjuvantes7: adjuvantes7,
                          adjuvantes8: adjuvantes8,
                          adjuvantes9: adjuvantes9,
                          inoculantes1: inoculantes1,
                          inoculantes2: inoculantes2,
                          inoculantes3: inoculantes3,
                          inoculantes4: inoculantes4,
                          inoculantes5: inoculantes5,
                          inoculantes6: inoculantes6,
                          inoculantes7: inoculantes7,
                          inoculantes8: inoculantes8,
                          inoculantes9: inoculantes9,
                          diesel1: diesel1,
                          diesel2: diesel2,
                          diesel3: diesel3,
                          diesel4: diesel4,
                          diesel5: diesel5,
                          diesel6: diesel6,
                          diesel7: diesel7,
                          diesel8: diesel8,
                          diesel9: diesel9,
                          fertilizantesFoliares1: fertilizantesFoliares1,
                          fertilizantesFoliares2: fertilizantesFoliares2,
                          fertilizantesFoliares3: fertilizantesFoliares3,
                          fertilizantesFoliares4: fertilizantesFoliares4,
                          fertilizantesFoliares5: fertilizantesFoliares5,
                          fertilizantesFoliares6: fertilizantesFoliares6,
                          fertilizantesFoliares7: fertilizantesFoliares7,
                          fertilizantesFoliares8: fertilizantesFoliares8,
                          fertilizantesFoliares9: fertilizantesFoliares9,
                          prod: "Produto 3",
                          product: prod3,
                          prod1: prod1,
                          prod2: prod2,
                          prod3: prod3,
                          prod4: prod4,
                          prod5: prod5,
                          prod6: prod6,
                          prod7: prod7,
                          prod8: prod8,
                          prod9: prod9,
                          prod10: prod10,
                          adjuvantes: adjuvantes3,
                          adubos: adubos3,
                          fungicidas: fungicidas3,
                          herbicidas: herbicidas3,
                          inseticidas: inseticidas3,
                          sementes: sementes3,
                          inoculantes: inoculantes3,
                          diesel: diesel3,
                          fertilizantesFoliares: fertilizantesFoliares3,
                          num: 3,
                          addLev: addLev3,
                          amount: amountProducts,
                        ),
                      ),
                      Visibility(
                        visible: (amountProducts.amount >= 4),
                        child: ProductWidget(
                          selectedCategory: selectedCategory4,
                          selectedCategory1: selectedCategory1,
                          selectedCategory2: selectedCategory2,
                          selectedCategory3: selectedCategory3,
                          selectedCategory4: selectedCategory4,
                          selectedCategory5: selectedCategory5,
                          selectedCategory6: selectedCategory6,
                          selectedCategory7: selectedCategory7,
                          selectedCategory8: selectedCategory8,
                          selectedCategory9: selectedCategory9,
                          selectedCategory10: selectedCategory10,
                          adubos1: adubos1,
                          adubos2: adubos2,
                          adubos3: adubos3,
                          adubos4: adubos4,
                          adubos5: adubos5,
                          adubos6: adubos6,
                          adubos7: adubos7,
                          adubos8: adubos8,
                          adubos9: adubos9,
                          sementes1: sementes1,
                          sementes2: sementes2,
                          sementes3: sementes3,
                          sementes4: sementes4,
                          sementes5: sementes5,
                          sementes6: sementes6,
                          sementes7: sementes7,
                          sementes8: sementes8,
                          sementes9: sementes9,
                          inseticidas1: inseticidas1,
                          inseticidas2: inseticidas2,
                          inseticidas3: inseticidas3,
                          inseticidas4: inseticidas4,
                          inseticidas5: inseticidas5,
                          inseticidas6: inseticidas6,
                          inseticidas7: inseticidas7,
                          inseticidas8: inseticidas8,
                          inseticidas9: inseticidas9,
                          herbicidas1: herbicidas1,
                          herbicidas2: herbicidas2,
                          herbicidas3: herbicidas3,
                          herbicidas4: herbicidas4,
                          herbicidas5: herbicidas5,
                          herbicidas6: herbicidas6,
                          herbicidas7: herbicidas7,
                          herbicidas8: herbicidas8,
                          herbicidas9: herbicidas9,
                          fungicidas1: fungicidas1,
                          fungicidas2: fungicidas2,
                          fungicidas3: fungicidas3,
                          fungicidas4: fungicidas4,
                          fungicidas5: fungicidas5,
                          fungicidas6: fungicidas6,
                          fungicidas7: fungicidas7,
                          fungicidas8: fungicidas8,
                          fungicidas9: fungicidas9,
                          adjuvantes1: adjuvantes1,
                          adjuvantes2: adjuvantes2,
                          adjuvantes3: adjuvantes3,
                          adjuvantes4: adjuvantes4,
                          adjuvantes5: adjuvantes5,
                          adjuvantes6: adjuvantes6,
                          adjuvantes7: adjuvantes7,
                          adjuvantes8: adjuvantes8,
                          adjuvantes9: adjuvantes9,
                          inoculantes1: inoculantes1,
                          inoculantes2: inoculantes2,
                          inoculantes3: inoculantes3,
                          inoculantes4: inoculantes4,
                          inoculantes5: inoculantes5,
                          inoculantes6: inoculantes6,
                          inoculantes7: inoculantes7,
                          inoculantes8: inoculantes8,
                          inoculantes9: inoculantes9,
                          diesel1: diesel1,
                          diesel2: diesel2,
                          diesel3: diesel3,
                          diesel4: diesel4,
                          diesel5: diesel5,
                          diesel6: diesel6,
                          diesel7: diesel7,
                          diesel8: diesel8,
                          diesel9: diesel9,
                          fertilizantesFoliares1: fertilizantesFoliares1,
                          fertilizantesFoliares2: fertilizantesFoliares2,
                          fertilizantesFoliares3: fertilizantesFoliares3,
                          fertilizantesFoliares4: fertilizantesFoliares4,
                          fertilizantesFoliares5: fertilizantesFoliares5,
                          fertilizantesFoliares6: fertilizantesFoliares6,
                          fertilizantesFoliares7: fertilizantesFoliares7,
                          fertilizantesFoliares8: fertilizantesFoliares8,
                          fertilizantesFoliares9: fertilizantesFoliares9,
                          prod: "Produto 4",
                          product: prod4,
                          prod1: prod1,
                          prod2: prod2,
                          prod3: prod3,
                          prod4: prod4,
                          prod5: prod5,
                          prod6: prod6,
                          prod7: prod7,
                          prod8: prod8,
                          prod9: prod9,
                          prod10: prod10,
                          adjuvantes: adjuvantes4,
                          adubos: adubos4,
                          fungicidas: fungicidas4,
                          herbicidas: herbicidas4,
                          inseticidas: inseticidas4,
                          sementes: sementes4,
                          inoculantes: inoculantes4,
                          diesel: diesel4,
                          fertilizantesFoliares: fertilizantesFoliares4,
                          num: 4,
                          addLev: addLev4,
                          amount: amountProducts,
                          recipe: true,
                        ),
                      ),
                      Visibility(
                        visible: (amountProducts.amount >= 5),
                        child: ProductWidget(
                          selectedCategory: selectedCategory5,
                          selectedCategory1: selectedCategory1,
                          selectedCategory2: selectedCategory2,
                          selectedCategory3: selectedCategory3,
                          selectedCategory4: selectedCategory4,
                          selectedCategory5: selectedCategory5,
                          selectedCategory6: selectedCategory6,
                          selectedCategory7: selectedCategory7,
                          selectedCategory8: selectedCategory8,
                          selectedCategory9: selectedCategory9,
                          selectedCategory10: selectedCategory10,
                          adubos1: adubos1,
                          adubos2: adubos2,
                          adubos3: adubos3,
                          adubos4: adubos4,
                          adubos5: adubos5,
                          adubos6: adubos6,
                          adubos7: adubos7,
                          adubos8: adubos8,
                          adubos9: adubos9,
                          sementes1: sementes1,
                          sementes2: sementes2,
                          sementes3: sementes3,
                          sementes4: sementes4,
                          sementes5: sementes5,
                          sementes6: sementes6,
                          sementes7: sementes7,
                          sementes8: sementes8,
                          sementes9: sementes9,
                          inseticidas1: inseticidas1,
                          inseticidas2: inseticidas2,
                          inseticidas3: inseticidas3,
                          inseticidas4: inseticidas4,
                          inseticidas5: inseticidas5,
                          inseticidas6: inseticidas6,
                          inseticidas7: inseticidas7,
                          inseticidas8: inseticidas8,
                          inseticidas9: inseticidas9,
                          herbicidas1: herbicidas1,
                          herbicidas2: herbicidas2,
                          herbicidas3: herbicidas3,
                          herbicidas4: herbicidas4,
                          herbicidas5: herbicidas5,
                          herbicidas6: herbicidas6,
                          herbicidas7: herbicidas7,
                          herbicidas8: herbicidas8,
                          herbicidas9: herbicidas9,
                          fungicidas1: fungicidas1,
                          fungicidas2: fungicidas2,
                          fungicidas3: fungicidas3,
                          fungicidas4: fungicidas4,
                          fungicidas5: fungicidas5,
                          fungicidas6: fungicidas6,
                          fungicidas7: fungicidas7,
                          fungicidas8: fungicidas8,
                          fungicidas9: fungicidas9,
                          adjuvantes1: adjuvantes1,
                          adjuvantes2: adjuvantes2,
                          adjuvantes3: adjuvantes3,
                          adjuvantes4: adjuvantes4,
                          adjuvantes5: adjuvantes5,
                          adjuvantes6: adjuvantes6,
                          adjuvantes7: adjuvantes7,
                          adjuvantes8: adjuvantes8,
                          adjuvantes9: adjuvantes9,
                          inoculantes1: inoculantes1,
                          inoculantes2: inoculantes2,
                          inoculantes3: inoculantes3,
                          inoculantes4: inoculantes4,
                          inoculantes5: inoculantes5,
                          inoculantes6: inoculantes6,
                          inoculantes7: inoculantes7,
                          inoculantes8: inoculantes8,
                          inoculantes9: inoculantes9,
                          diesel1: diesel1,
                          diesel2: diesel2,
                          diesel3: diesel3,
                          diesel4: diesel4,
                          diesel5: diesel5,
                          diesel6: diesel6,
                          diesel7: diesel7,
                          diesel8: diesel8,
                          diesel9: diesel9,
                          fertilizantesFoliares1: fertilizantesFoliares1,
                          fertilizantesFoliares2: fertilizantesFoliares2,
                          fertilizantesFoliares3: fertilizantesFoliares3,
                          fertilizantesFoliares4: fertilizantesFoliares4,
                          fertilizantesFoliares5: fertilizantesFoliares5,
                          fertilizantesFoliares6: fertilizantesFoliares6,
                          fertilizantesFoliares7: fertilizantesFoliares7,
                          fertilizantesFoliares8: fertilizantesFoliares8,
                          fertilizantesFoliares9: fertilizantesFoliares9,
                          prod: "Produto 5",
                          product: prod5,
                          prod1: prod1,
                          prod2: prod2,
                          prod3: prod3,
                          prod4: prod4,
                          prod5: prod5,
                          prod6: prod6,
                          prod7: prod7,
                          prod8: prod8,
                          prod9: prod9,
                          prod10: prod10,
                          adjuvantes: adjuvantes5,
                          adubos: adubos5,
                          fungicidas: fungicidas5,
                          herbicidas: herbicidas5,
                          inseticidas: inseticidas5,
                          sementes: sementes5,
                          inoculantes: inoculantes5,
                          diesel: diesel5,
                          fertilizantesFoliares: fertilizantesFoliares5,
                          num: 5,
                          addLev: addLev5,
                          amount: amountProducts,
                          recipe: true,
                        ),
                      ),
                      Visibility(
                        visible: (amountProducts.amount >= 6),
                        child: ProductWidget(
                          selectedCategory: selectedCategory6,
                          selectedCategory1: selectedCategory1,
                          selectedCategory2: selectedCategory2,
                          selectedCategory3: selectedCategory3,
                          selectedCategory4: selectedCategory4,
                          selectedCategory5: selectedCategory5,
                          selectedCategory6: selectedCategory6,
                          selectedCategory7: selectedCategory7,
                          selectedCategory8: selectedCategory8,
                          selectedCategory9: selectedCategory9,
                          selectedCategory10: selectedCategory10,
                          adubos1: adubos1,
                          adubos2: adubos2,
                          adubos3: adubos3,
                          adubos4: adubos4,
                          adubos5: adubos5,
                          adubos6: adubos6,
                          adubos7: adubos7,
                          adubos8: adubos8,
                          adubos9: adubos9,
                          sementes1: sementes1,
                          sementes2: sementes2,
                          sementes3: sementes3,
                          sementes4: sementes4,
                          sementes5: sementes5,
                          sementes6: sementes6,
                          sementes7: sementes7,
                          sementes8: sementes8,
                          sementes9: sementes9,
                          inseticidas1: inseticidas1,
                          inseticidas2: inseticidas2,
                          inseticidas3: inseticidas3,
                          inseticidas4: inseticidas4,
                          inseticidas5: inseticidas5,
                          inseticidas6: inseticidas6,
                          inseticidas7: inseticidas7,
                          inseticidas8: inseticidas8,
                          inseticidas9: inseticidas9,
                          herbicidas1: herbicidas1,
                          herbicidas2: herbicidas2,
                          herbicidas3: herbicidas3,
                          herbicidas4: herbicidas4,
                          herbicidas5: herbicidas5,
                          herbicidas6: herbicidas6,
                          herbicidas7: herbicidas7,
                          herbicidas8: herbicidas8,
                          herbicidas9: herbicidas9,
                          fungicidas1: fungicidas1,
                          fungicidas2: fungicidas2,
                          fungicidas3: fungicidas3,
                          fungicidas4: fungicidas4,
                          fungicidas5: fungicidas5,
                          fungicidas6: fungicidas6,
                          fungicidas7: fungicidas7,
                          fungicidas8: fungicidas8,
                          fungicidas9: fungicidas9,
                          adjuvantes1: adjuvantes1,
                          adjuvantes2: adjuvantes2,
                          adjuvantes3: adjuvantes3,
                          adjuvantes4: adjuvantes4,
                          adjuvantes5: adjuvantes5,
                          adjuvantes6: adjuvantes6,
                          adjuvantes7: adjuvantes7,
                          adjuvantes8: adjuvantes8,
                          adjuvantes9: adjuvantes9,
                          inoculantes1: inoculantes1,
                          inoculantes2: inoculantes2,
                          inoculantes3: inoculantes3,
                          inoculantes4: inoculantes4,
                          inoculantes5: inoculantes5,
                          inoculantes6: inoculantes6,
                          inoculantes7: inoculantes7,
                          inoculantes8: inoculantes8,
                          inoculantes9: inoculantes9,
                          diesel1: diesel1,
                          diesel2: diesel2,
                          diesel3: diesel3,
                          diesel4: diesel4,
                          diesel5: diesel5,
                          diesel6: diesel6,
                          diesel7: diesel7,
                          diesel8: diesel8,
                          diesel9: diesel9,
                          fertilizantesFoliares1: fertilizantesFoliares1,
                          fertilizantesFoliares2: fertilizantesFoliares2,
                          fertilizantesFoliares3: fertilizantesFoliares3,
                          fertilizantesFoliares4: fertilizantesFoliares4,
                          fertilizantesFoliares5: fertilizantesFoliares5,
                          fertilizantesFoliares6: fertilizantesFoliares6,
                          fertilizantesFoliares7: fertilizantesFoliares7,
                          fertilizantesFoliares8: fertilizantesFoliares8,
                          fertilizantesFoliares9: fertilizantesFoliares9,
                          prod: "Produto 6",
                          product: prod6,
                          prod1: prod1,
                          prod2: prod2,
                          prod3: prod3,
                          prod4: prod4,
                          prod5: prod5,
                          prod6: prod6,
                          prod7: prod7,
                          prod8: prod8,
                          prod9: prod9,
                          prod10: prod10,
                          adjuvantes: adjuvantes6,
                          adubos: adubos6,
                          fungicidas: fungicidas6,
                          herbicidas: herbicidas6,
                          inseticidas: inseticidas6,
                          sementes: sementes6,
                          inoculantes: inoculantes6,
                          diesel: diesel6,
                          fertilizantesFoliares: fertilizantesFoliares6,
                          num: 6,
                          addLev: addLev6,
                          amount: amountProducts,
                          recipe: true,
                        ),
                      ),
                      Visibility(
                        visible: (amountProducts.amount >= 7),
                        child: ProductWidget(
                          selectedCategory: selectedCategory7,
                          selectedCategory1: selectedCategory1,
                          selectedCategory2: selectedCategory2,
                          selectedCategory3: selectedCategory3,
                          selectedCategory4: selectedCategory4,
                          selectedCategory5: selectedCategory5,
                          selectedCategory6: selectedCategory6,
                          selectedCategory7: selectedCategory7,
                          selectedCategory8: selectedCategory8,
                          selectedCategory9: selectedCategory9,
                          selectedCategory10: selectedCategory10,
                          adubos1: adubos1,
                          adubos2: adubos2,
                          adubos3: adubos3,
                          adubos4: adubos4,
                          adubos5: adubos5,
                          adubos6: adubos6,
                          adubos7: adubos7,
                          adubos8: adubos8,
                          adubos9: adubos9,
                          sementes1: sementes1,
                          sementes2: sementes2,
                          sementes3: sementes3,
                          sementes4: sementes4,
                          sementes5: sementes5,
                          sementes6: sementes6,
                          sementes7: sementes7,
                          sementes8: sementes8,
                          sementes9: sementes9,
                          inseticidas1: inseticidas1,
                          inseticidas2: inseticidas2,
                          inseticidas3: inseticidas3,
                          inseticidas4: inseticidas4,
                          inseticidas5: inseticidas5,
                          inseticidas6: inseticidas6,
                          inseticidas7: inseticidas7,
                          inseticidas8: inseticidas8,
                          inseticidas9: inseticidas9,
                          herbicidas1: herbicidas1,
                          herbicidas2: herbicidas2,
                          herbicidas3: herbicidas3,
                          herbicidas4: herbicidas4,
                          herbicidas5: herbicidas5,
                          herbicidas6: herbicidas6,
                          herbicidas7: herbicidas7,
                          herbicidas8: herbicidas8,
                          herbicidas9: herbicidas9,
                          fungicidas1: fungicidas1,
                          fungicidas2: fungicidas2,
                          fungicidas3: fungicidas3,
                          fungicidas4: fungicidas4,
                          fungicidas5: fungicidas5,
                          fungicidas6: fungicidas6,
                          fungicidas7: fungicidas7,
                          fungicidas8: fungicidas8,
                          fungicidas9: fungicidas9,
                          adjuvantes1: adjuvantes1,
                          adjuvantes2: adjuvantes2,
                          adjuvantes3: adjuvantes3,
                          adjuvantes4: adjuvantes4,
                          adjuvantes5: adjuvantes5,
                          adjuvantes6: adjuvantes6,
                          adjuvantes7: adjuvantes7,
                          adjuvantes8: adjuvantes8,
                          adjuvantes9: adjuvantes9,
                          inoculantes1: inoculantes1,
                          inoculantes2: inoculantes2,
                          inoculantes3: inoculantes3,
                          inoculantes4: inoculantes4,
                          inoculantes5: inoculantes5,
                          inoculantes6: inoculantes6,
                          inoculantes7: inoculantes7,
                          inoculantes8: inoculantes8,
                          inoculantes9: inoculantes9,
                          diesel1: diesel1,
                          diesel2: diesel2,
                          diesel3: diesel3,
                          diesel4: diesel4,
                          diesel5: diesel5,
                          diesel6: diesel6,
                          diesel7: diesel7,
                          diesel8: diesel8,
                          diesel9: diesel9,
                          fertilizantesFoliares1: fertilizantesFoliares1,
                          fertilizantesFoliares2: fertilizantesFoliares2,
                          fertilizantesFoliares3: fertilizantesFoliares3,
                          fertilizantesFoliares4: fertilizantesFoliares4,
                          fertilizantesFoliares5: fertilizantesFoliares5,
                          fertilizantesFoliares6: fertilizantesFoliares6,
                          fertilizantesFoliares7: fertilizantesFoliares7,
                          fertilizantesFoliares8: fertilizantesFoliares8,
                          fertilizantesFoliares9: fertilizantesFoliares9,
                          prod: "Produto 7",
                          product: prod7,
                          prod1: prod1,
                          prod2: prod2,
                          prod3: prod3,
                          prod4: prod4,
                          prod5: prod5,
                          prod6: prod6,
                          prod7: prod7,
                          prod8: prod8,
                          prod9: prod9,
                          prod10: prod10,
                          adjuvantes: adjuvantes7,
                          adubos: adubos7,
                          fungicidas: fungicidas7,
                          herbicidas: herbicidas7,
                          inseticidas: inseticidas7,
                          sementes: sementes7,
                          inoculantes: inoculantes7,
                          diesel: diesel7,
                          fertilizantesFoliares: fertilizantesFoliares7,
                          num: 7,
                          addLev: addLev7,
                          amount: amountProducts,
                          recipe: true,
                        ),
                      ),
                      Visibility(
                        visible: (amountProducts.amount >= 8),
                        child: ProductWidget(
                          selectedCategory: selectedCategory8,
                          selectedCategory1: selectedCategory1,
                          selectedCategory2: selectedCategory2,
                          selectedCategory3: selectedCategory3,
                          selectedCategory4: selectedCategory4,
                          selectedCategory5: selectedCategory5,
                          selectedCategory6: selectedCategory6,
                          selectedCategory7: selectedCategory7,
                          selectedCategory8: selectedCategory8,
                          selectedCategory9: selectedCategory9,
                          selectedCategory10: selectedCategory10,
                          adubos1: adubos1,
                          adubos2: adubos2,
                          adubos3: adubos3,
                          adubos4: adubos4,
                          adubos5: adubos5,
                          adubos6: adubos6,
                          adubos7: adubos7,
                          adubos8: adubos8,
                          adubos9: adubos9,
                          sementes1: sementes1,
                          sementes2: sementes2,
                          sementes3: sementes3,
                          sementes4: sementes4,
                          sementes5: sementes5,
                          sementes6: sementes6,
                          sementes7: sementes7,
                          sementes8: sementes8,
                          sementes9: sementes9,
                          inseticidas1: inseticidas1,
                          inseticidas2: inseticidas2,
                          inseticidas3: inseticidas3,
                          inseticidas4: inseticidas4,
                          inseticidas5: inseticidas5,
                          inseticidas6: inseticidas6,
                          inseticidas7: inseticidas7,
                          inseticidas8: inseticidas8,
                          inseticidas9: inseticidas9,
                          herbicidas1: herbicidas1,
                          herbicidas2: herbicidas2,
                          herbicidas3: herbicidas3,
                          herbicidas4: herbicidas4,
                          herbicidas5: herbicidas5,
                          herbicidas6: herbicidas6,
                          herbicidas7: herbicidas7,
                          herbicidas8: herbicidas8,
                          herbicidas9: herbicidas9,
                          fungicidas1: fungicidas1,
                          fungicidas2: fungicidas2,
                          fungicidas3: fungicidas3,
                          fungicidas4: fungicidas4,
                          fungicidas5: fungicidas5,
                          fungicidas6: fungicidas6,
                          fungicidas7: fungicidas7,
                          fungicidas8: fungicidas8,
                          fungicidas9: fungicidas9,
                          adjuvantes1: adjuvantes1,
                          adjuvantes2: adjuvantes2,
                          adjuvantes3: adjuvantes3,
                          adjuvantes4: adjuvantes4,
                          adjuvantes5: adjuvantes5,
                          adjuvantes6: adjuvantes6,
                          adjuvantes7: adjuvantes7,
                          adjuvantes8: adjuvantes8,
                          adjuvantes9: adjuvantes9,
                          inoculantes1: inoculantes1,
                          inoculantes2: inoculantes2,
                          inoculantes3: inoculantes3,
                          inoculantes4: inoculantes4,
                          inoculantes5: inoculantes5,
                          inoculantes6: inoculantes6,
                          inoculantes7: inoculantes7,
                          inoculantes8: inoculantes8,
                          inoculantes9: inoculantes9,
                          diesel1: diesel1,
                          diesel2: diesel2,
                          diesel3: diesel3,
                          diesel4: diesel4,
                          diesel5: diesel5,
                          diesel6: diesel6,
                          diesel7: diesel7,
                          diesel8: diesel8,
                          diesel9: diesel9,
                          fertilizantesFoliares1: fertilizantesFoliares1,
                          fertilizantesFoliares2: fertilizantesFoliares2,
                          fertilizantesFoliares3: fertilizantesFoliares3,
                          fertilizantesFoliares4: fertilizantesFoliares4,
                          fertilizantesFoliares5: fertilizantesFoliares5,
                          fertilizantesFoliares6: fertilizantesFoliares6,
                          fertilizantesFoliares7: fertilizantesFoliares7,
                          fertilizantesFoliares8: fertilizantesFoliares8,
                          fertilizantesFoliares9: fertilizantesFoliares9,
                          prod: "Produto 8",
                          product: prod8,
                          prod1: prod1,
                          prod2: prod2,
                          prod3: prod3,
                          prod4: prod4,
                          prod5: prod5,
                          prod6: prod6,
                          prod7: prod7,
                          prod8: prod8,
                          prod9: prod9,
                          prod10: prod10,
                          adjuvantes: adjuvantes8,
                          adubos: adubos8,
                          fungicidas: fungicidas8,
                          herbicidas: herbicidas8,
                          inseticidas: inseticidas8,
                          sementes: sementes8,
                          inoculantes: inoculantes8,
                          diesel: diesel8,
                          fertilizantesFoliares: fertilizantesFoliares8,
                          num: 8,
                          addLev: addLev8,
                          amount: amountProducts,
                          recipe: true,
                        ),
                      ),
                      Visibility(
                        visible: (amountProducts.amount >= 9),
                        child: ProductWidget(
                          selectedCategory: selectedCategory9,
                          selectedCategory1: selectedCategory1,
                          selectedCategory2: selectedCategory2,
                          selectedCategory3: selectedCategory3,
                          selectedCategory4: selectedCategory4,
                          selectedCategory5: selectedCategory5,
                          selectedCategory6: selectedCategory6,
                          selectedCategory7: selectedCategory7,
                          selectedCategory8: selectedCategory8,
                          selectedCategory9: selectedCategory9,
                          selectedCategory10: selectedCategory10,
                          adubos1: adubos1,
                          adubos2: adubos2,
                          adubos3: adubos3,
                          adubos4: adubos4,
                          adubos5: adubos5,
                          adubos6: adubos6,
                          adubos7: adubos7,
                          adubos8: adubos8,
                          adubos9: adubos9,
                          sementes1: sementes1,
                          sementes2: sementes2,
                          sementes3: sementes3,
                          sementes4: sementes4,
                          sementes5: sementes5,
                          sementes6: sementes6,
                          sementes7: sementes7,
                          sementes8: sementes8,
                          sementes9: sementes9,
                          inseticidas1: inseticidas1,
                          inseticidas2: inseticidas2,
                          inseticidas3: inseticidas3,
                          inseticidas4: inseticidas4,
                          inseticidas5: inseticidas5,
                          inseticidas6: inseticidas6,
                          inseticidas7: inseticidas7,
                          inseticidas8: inseticidas8,
                          inseticidas9: inseticidas9,
                          herbicidas1: herbicidas1,
                          herbicidas2: herbicidas2,
                          herbicidas3: herbicidas3,
                          herbicidas4: herbicidas4,
                          herbicidas5: herbicidas5,
                          herbicidas6: herbicidas6,
                          herbicidas7: herbicidas7,
                          herbicidas8: herbicidas8,
                          herbicidas9: herbicidas9,
                          fungicidas1: fungicidas1,
                          fungicidas2: fungicidas2,
                          fungicidas3: fungicidas3,
                          fungicidas4: fungicidas4,
                          fungicidas5: fungicidas5,
                          fungicidas6: fungicidas6,
                          fungicidas7: fungicidas7,
                          fungicidas8: fungicidas8,
                          fungicidas9: fungicidas9,
                          adjuvantes1: adjuvantes1,
                          adjuvantes2: adjuvantes2,
                          adjuvantes3: adjuvantes3,
                          adjuvantes4: adjuvantes4,
                          adjuvantes5: adjuvantes5,
                          adjuvantes6: adjuvantes6,
                          adjuvantes7: adjuvantes7,
                          adjuvantes8: adjuvantes8,
                          adjuvantes9: adjuvantes9,
                          inoculantes1: inoculantes1,
                          inoculantes2: inoculantes2,
                          inoculantes3: inoculantes3,
                          inoculantes4: inoculantes4,
                          inoculantes5: inoculantes5,
                          inoculantes6: inoculantes6,
                          inoculantes7: inoculantes7,
                          inoculantes8: inoculantes8,
                          inoculantes9: inoculantes9,
                          diesel1: diesel1,
                          diesel2: diesel2,
                          diesel3: diesel3,
                          diesel4: diesel4,
                          diesel5: diesel5,
                          diesel6: diesel6,
                          diesel7: diesel7,
                          diesel8: diesel8,
                          diesel9: diesel9,
                          fertilizantesFoliares1: fertilizantesFoliares1,
                          fertilizantesFoliares2: fertilizantesFoliares2,
                          fertilizantesFoliares3: fertilizantesFoliares3,
                          fertilizantesFoliares4: fertilizantesFoliares4,
                          fertilizantesFoliares5: fertilizantesFoliares5,
                          fertilizantesFoliares6: fertilizantesFoliares6,
                          fertilizantesFoliares7: fertilizantesFoliares7,
                          fertilizantesFoliares8: fertilizantesFoliares8,
                          fertilizantesFoliares9: fertilizantesFoliares9,
                          prod: "Produto 9",
                          product: prod9,
                          prod1: prod1,
                          prod2: prod2,
                          prod3: prod3,
                          prod4: prod4,
                          prod5: prod5,
                          prod6: prod6,
                          prod7: prod7,
                          prod8: prod8,
                          prod9: prod9,
                          prod10: prod10,
                          adjuvantes: adjuvantes9,
                          adubos: adubos9,
                          fungicidas: fungicidas9,
                          herbicidas: herbicidas9,
                          inseticidas: inseticidas9,
                          sementes: sementes9,
                          inoculantes: inoculantes9,
                          diesel: diesel9,
                          fertilizantesFoliares: fertilizantesFoliares9,
                          num: 9,
                          addLev: addLev9,
                          amount: amountProducts,
                          recipe: true,
                        ),
                      ),
                      Visibility(
                        visible: (amountProducts.amount >= 10),
                        child: ProductWidget(
                          selectedCategory: selectedCategory10,
                          selectedCategory1: selectedCategory1,
                          selectedCategory2: selectedCategory2,
                          selectedCategory3: selectedCategory3,
                          selectedCategory4: selectedCategory4,
                          selectedCategory5: selectedCategory5,
                          selectedCategory6: selectedCategory6,
                          selectedCategory7: selectedCategory7,
                          selectedCategory8: selectedCategory8,
                          selectedCategory9: selectedCategory9,
                          selectedCategory10: selectedCategory10,
                          adubos1: adubos1,
                          adubos2: adubos2,
                          adubos3: adubos3,
                          adubos4: adubos4,
                          adubos5: adubos5,
                          adubos6: adubos6,
                          adubos7: adubos7,
                          adubos8: adubos8,
                          adubos9: adubos9,
                          sementes1: sementes1,
                          sementes2: sementes2,
                          sementes3: sementes3,
                          sementes4: sementes4,
                          sementes5: sementes5,
                          sementes6: sementes6,
                          sementes7: sementes7,
                          sementes8: sementes8,
                          sementes9: sementes9,
                          inseticidas1: inseticidas1,
                          inseticidas2: inseticidas2,
                          inseticidas3: inseticidas3,
                          inseticidas4: inseticidas4,
                          inseticidas5: inseticidas5,
                          inseticidas6: inseticidas6,
                          inseticidas7: inseticidas7,
                          inseticidas8: inseticidas8,
                          inseticidas9: inseticidas9,
                          herbicidas1: herbicidas1,
                          herbicidas2: herbicidas2,
                          herbicidas3: herbicidas3,
                          herbicidas4: herbicidas4,
                          herbicidas5: herbicidas5,
                          herbicidas6: herbicidas6,
                          herbicidas7: herbicidas7,
                          herbicidas8: herbicidas8,
                          herbicidas9: herbicidas9,
                          fungicidas1: fungicidas1,
                          fungicidas2: fungicidas2,
                          fungicidas3: fungicidas3,
                          fungicidas4: fungicidas4,
                          fungicidas5: fungicidas5,
                          fungicidas6: fungicidas6,
                          fungicidas7: fungicidas7,
                          fungicidas8: fungicidas8,
                          fungicidas9: fungicidas9,
                          adjuvantes1: adjuvantes1,
                          adjuvantes2: adjuvantes2,
                          adjuvantes3: adjuvantes3,
                          adjuvantes4: adjuvantes4,
                          adjuvantes5: adjuvantes5,
                          adjuvantes6: adjuvantes6,
                          adjuvantes7: adjuvantes7,
                          adjuvantes8: adjuvantes8,
                          adjuvantes9: adjuvantes9,
                          inoculantes1: inoculantes1,
                          inoculantes2: inoculantes2,
                          inoculantes3: inoculantes3,
                          inoculantes4: inoculantes4,
                          inoculantes5: inoculantes5,
                          inoculantes6: inoculantes6,
                          inoculantes7: inoculantes7,
                          inoculantes8: inoculantes8,
                          inoculantes9: inoculantes9,
                          diesel1: diesel1,
                          diesel2: diesel2,
                          diesel3: diesel3,
                          diesel4: diesel4,
                          diesel5: diesel5,
                          diesel6: diesel6,
                          diesel7: diesel7,
                          diesel8: diesel8,
                          diesel9: diesel9,
                          fertilizantesFoliares1: fertilizantesFoliares1,
                          fertilizantesFoliares2: fertilizantesFoliares2,
                          fertilizantesFoliares3: fertilizantesFoliares3,
                          fertilizantesFoliares4: fertilizantesFoliares4,
                          fertilizantesFoliares5: fertilizantesFoliares5,
                          fertilizantesFoliares6: fertilizantesFoliares6,
                          fertilizantesFoliares7: fertilizantesFoliares7,
                          fertilizantesFoliares8: fertilizantesFoliares8,
                          fertilizantesFoliares9: fertilizantesFoliares9,
                          prod: "Produto 10",
                          product: prod10,
                          prod1: prod1,
                          prod2: prod2,
                          prod3: prod3,
                          prod4: prod4,
                          prod5: prod5,
                          prod6: prod6,
                          prod7: prod7,
                          prod8: prod8,
                          prod9: prod9,
                          prod10: prod10,
                          adjuvantes: adjuvantes10,
                          adubos: adubos10,
                          fungicidas: fungicidas10,
                          herbicidas: herbicidas10,
                          inseticidas: inseticidas10,
                          sementes: sementes10,
                          inoculantes: inoculantes10,
                          diesel: diesel10,
                          fertilizantesFoliares: fertilizantesFoliares10,
                          num: 10,
                          addLev: addLev10,
                          amount: amountProducts,
                          recipe: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (!isLoading.isLoading) {
            isLoading.setIsLoading();
          try {
            if ((amountProducts.amount >= 1 && prod1.quantity.text.isEmpty) ||
                (amountProducts.amount >= 2 && prod2.quantity.text.isEmpty) ||
                (amountProducts.amount >= 3 && prod3.quantity.text.isEmpty) ||
                (amountProducts.amount >= 4 && prod4.quantity.text.isEmpty) ||
                (amountProducts.amount >= 5 && prod5.quantity.text.isEmpty) ||
                (amountProducts.amount >= 6 && prod6.quantity.text.isEmpty) ||
                (amountProducts.amount >= 7 && prod7.quantity.text.isEmpty) ||
                (amountProducts.amount >= 8 && prod8.quantity.text.isEmpty) ||
                (amountProducts.amount >= 9 && prod9.quantity.text.isEmpty) ||
                (amountProducts.amount >= 10 && prod10.quantity.text.isEmpty)) {
                  isLoading.resetIsLoading();
              alert.alert(context, "Todos os campos devem ser preenchidos.",
                  "ATENÇÃO!", AlertType.info);
            } else {
              List<Map<String, dynamic>> allProds = [];

              if (amountProducts.amount >= 1) {
                allProds.add({
                  "product": prod1.name.text,
                  "category": prod1.category.text,
                  "code": prod1.code.text,
                  "quantity": prod1.quantity.text,
                  "unity": prod1.unity.text,
                  "level": addLev1.level,
                  "dad": prod1.dad.text,
                });
              }
              if (amountProducts.amount >= 2) {
                allProds.add({
                  "product": prod2.name.text,
                  "category": prod2.category.text,
                  "code": prod2.code.text,
                  "quantity": prod2.quantity.text,
                  "unity": prod2.unity.text,
                  "level": addLev2.level,
                  "dad": prod2.dad.text,
                });
              }
              if (amountProducts.amount >= 3) {
                allProds.add({
                  "product": prod3.name.text,
                  "category": prod3.category.text,
                  "code": prod3.code.text,
                  "quantity": prod3.quantity.text,
                  "unity": prod3.unity.text,
                  "level": addLev3.level,
                  "dad": prod3.dad.text,
                });
              }
              if (amountProducts.amount >= 4) {
                allProds.add({
                  "product": prod4.name.text,
                  "category": prod4.category.text,
                  "code": prod4.code.text,
                  "quantity": prod4.quantity.text,
                  "unity": prod4.unity.text,
                  "level": addLev4.level,
                  "dad": prod4.dad.text,
                });
              }
              if (amountProducts.amount >= 5) {
                allProds.add({
                  "product": prod5.name.text,
                  "category": prod5.category.text,
                  "code": prod5.code.text,
                  "quantity": prod5.quantity.text,
                  "unity": prod5.unity.text,
                  "level": addLev5.level,
                  "dad": prod5.dad.text,
                });
              }
              if (amountProducts.amount >= 6) {
                allProds.add({
                  "product": prod6.name.text,
                  "category": prod6.category.text,
                  "code": prod6.code.text,
                  "quantity": prod6.quantity.text,
                  "unity": prod6.unity.text,
                  "level": addLev6.level,
                  "dad": prod6.dad.text,
                });
              }
              if (amountProducts.amount >= 7) {
                allProds.add({
                  "product": prod7.name.text,
                  "category": prod7.category.text,
                  "code": prod7.code.text,
                  "quantity": prod7.quantity.text,
                  "unity": prod7.unity.text,
                  "level": addLev7.level,
                  "dad": prod7.dad.text,
                });
              }
              if (amountProducts.amount >= 8) {
                allProds.add({
                  "product": prod8.name.text,
                  "category": prod8.category.text,
                  "code": prod8.code.text,
                  "quantity": prod8.quantity.text,
                  "unity": prod8.unity.text,
                  "level": addLev8.level,
                  "dad": prod8.dad.text,
                });
              }
              if (amountProducts.amount >= 9) {
                allProds.add({
                  "product": prod9.name.text,
                  "category": prod9.category.text,
                  "code": prod9.code.text,
                  "quantity": prod9.quantity.text,
                  "unity": prod9.unity.text,
                  "level": addLev9.level,
                  "dad": prod9.dad.text,
                });
              }
              if (amountProducts.amount >= 10) {
                allProds.add({
                  "product": prod10.name.text,
                  "category": prod10.category.text,
                  "code": prod10.code.text,
                  "quantity": prod10.quantity.text,
                  "unity": prod10.unity.text,
                  "level": addLev10.level,
                  "dad": prod10.dad.text,
                });
              }

              await editRecipeElement.update(
                cultureType.result.toLowerCase(),
                allProds,
                phaseOption.phase,
                amountProducts.initialAmount,
              );

              resetControlls();
              isLoading.resetIsLoading();
              // ignore: use_build_context_synchronously
              FocusScope.of(context).requestFocus(FocusNode());
              // ignore: use_build_context_synchronously
              await alert.alert(context, "Receita editada com sucesso.",
                  "SUCESSO!", AlertType.success);
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => AuthCheck(first: true),
                ),
              );
            }
          } catch (e) {
            isLoading.resetIsLoading();
            // ignore: use_build_context_synchronously
            alert.alert(
                context, "Erro ao editar receita.", "ERRO!", AlertType.error);
          }}
        },
        child: isLoading.isLoading
            ? Lottie.asset('assets/loading.json', height: 50, width: 50)
            : const Icon(Icons.arrow_forward_rounded),
      ),
    );
  }
}
