import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:universal_io/io.dart';

import '../../../providers/providers.dart';
import '../../../shared/alert.dart';
import '../utils/phase_container_culture.dart';

// ignore: must_be_immutable
class HistoricCulturesPage extends HookConsumerWidget {
  HistoricCulturesPage({super.key});

  AlertWidget alert = AlertWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCultures = ref.watch(userCulturesProvider);
    final indexCultureSelected = ref.watch(indexCultureSelectedProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Culturas'),
      ),
      body: ListView.builder(
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
              indexesRepeted = userCultures
                  .names["${userCultures.culturesList[index]['cultureName']}"]!;
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
                      indexCultureSelected.setIndex(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 211, 210, 210),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 200, 199, 199)
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
                              color: Colors.green,
                              border: Border.all(color: Colors.white),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 211, 211, 211)
                                          .withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(1, 1),
                                ),
                              ],
                            ),
                            child: Text(
                              "${userCultures.culturesList[index]['cultureName']}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Visibility(
                            visible: indexCultureSelected.index == index,
                            child: ListView.builder(
                              itemCount: userCultures
                                  .names[
                                      "${userCultures.culturesList[index]['cultureName']}"]!
                                  .length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder:
                                  (BuildContext context, int indexSec) {
                                return PhaseContainerCulture(
                                  userCultures: userCultures,
                                  index: index,
                                  indexCultureSelected: indexCultureSelected,
                                  indexesRepeted: indexesRepeted,
                                  seq: indexSec + 1,
                                  historic: true,
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
                              historic: true,
                            ),
                          ),
                          // PhaseContainerCulture(
                          //   userCultures: userCultures,
                          //   index: index,
                          //   indexCultureSelected: indexCultureSelected,
                          //   indexesRepeted: indexesRepeted,
                          //   seq: 1,
                          //   historic: true,
                          // ),
                          // PhaseContainerCulture(
                          //   userCultures: userCultures,
                          //   index: index,
                          //   indexCultureSelected: indexCultureSelected,
                          //   indexesRepeted: indexesRepeted,
                          //   seq: 2,
                          //   historic: true,
                          // ),
                          // PhaseContainerCulture(
                          //   userCultures: userCultures,
                          //   index: index,
                          //   indexCultureSelected: indexCultureSelected,
                          //   indexesRepeted: indexesRepeted,
                          //   seq: 3,
                          //   historic: true,
                          // ),
                          // PhaseContainerCulture(
                          //   userCultures: userCultures,
                          //   index: index,
                          //   indexCultureSelected: indexCultureSelected,
                          //   indexesRepeted: indexesRepeted,
                          //   seq: 4,
                          //   historic: true,
                          // ),
                          // PhaseContainerCulture(
                          //   userCultures: userCultures,
                          //   index: index,
                          //   indexCultureSelected: indexCultureSelected,
                          //   indexesRepeted: indexesRepeted,
                          //   seq: 5,
                          //   historic: true,
                          // ),
                          // PhaseContainerCulture(
                          //   userCultures: userCultures,
                          //   index: index,
                          //   indexCultureSelected: indexCultureSelected,
                          //   indexesRepeted: indexesRepeted,
                          //   seq: 6,
                          //   historic: true,
                          // ),
                          // PhaseContainerCulture(
                          //   userCultures: userCultures,
                          //   index: index,
                          //   indexCultureSelected: indexCultureSelected,
                          //   indexesRepeted: indexesRepeted,
                          //   seq: 7,
                          //   historic: true,
                          // ),
                          // PhaseContainerCulture(
                          //   userCultures: userCultures,
                          //   index: index,
                          //   indexCultureSelected: indexCultureSelected,
                          //   indexesRepeted: indexesRepeted,
                          //   seq: 8,
                          //   historic: true,
                          // ),
                          // PhaseContainerCulture(
                          //   userCultures: userCultures,
                          //   index: index,
                          //   indexCultureSelected: indexCultureSelected,
                          //   indexesRepeted: indexesRepeted,
                          //   seq: 9,
                          //   historic: true,
                          // ),
                          // PhaseContainerCulture(
                          //   userCultures: userCultures,
                          //   index: index,
                          //   indexCultureSelected: indexCultureSelected,
                          //   indexesRepeted: indexesRepeted,
                          //   seq: 10,
                          //   historic: true,
                          // ),
                          // PhaseContainerCulture(
                          //   userCultures: userCultures,
                          //   index: index,
                          //   indexCultureSelected: indexCultureSelected,
                          //   indexesRepeted: indexesRepeted,
                          //   seq: 11,
                          //   historic: true,
                          // ),
                          // PhaseContainerCulture(
                          //   userCultures: userCultures,
                          //   index: index,
                          //   indexCultureSelected: indexCultureSelected,
                          //   indexesRepeted: indexesRepeted,
                          //   seq: 12,
                          //   historic: true,
                          // ),
                          // PhaseContainerCulture(
                          //   userCultures: userCultures,
                          //   index: index,
                          //   indexCultureSelected: indexCultureSelected,
                          //   indexesRepeted: indexesRepeted,
                          //   seq: 13,
                          //   historic: true,
                          // ),
                          // PhaseContainerCulture(
                          //   userCultures: userCultures,
                          //   index: index,
                          //   indexCultureSelected: indexCultureSelected,
                          //   indexesRepeted: indexesRepeted,
                          //   seq: 14,
                          //   historic: true,
                          // ),
                          // PhaseContainerCulture(
                          //   userCultures: userCultures,
                          //   index: index,
                          //   indexCultureSelected: indexCultureSelected,
                          //   indexesRepeted: indexesRepeted,
                          //   seq: 15,
                          //   historic: true,
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
