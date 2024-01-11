import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../controllers/culture/delete_phase_controller.dart';
import '../../../controllers/culture/index_culture_selected_controller.dart';
import '../../../controllers/culture/user_cultures_controller.dart';
import 'product_container_culture.dart';

class PhaseContainerCulture extends StatelessWidget {
  const PhaseContainerCulture({
    super.key,
    required this.userCultures,
    required this.index,
    required this.indexCultureSelected,
    required this.indexesRepeted,
    required this.seq,
    required this.historic,
    this.deleteController,
    this.isExcluded,
  });

  final UserCulturesController userCultures;
  final int index;
  final IndexCultureSelectedController indexCultureSelected;
  final List<int> indexesRepeted;
  final int seq;
  final bool historic;
  final bool? isExcluded;
  final DeletePhaseController? deleteController;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: indexesRepeted.length >= seq || seq == 1,
      child: isExcluded != null
          ? InkWell(
              onTap: () {
                deleteController!.setPhaseId(userCultures
                    .culturesList[userCultures.names[
                        "${userCultures.culturesList[index]['cultureName']}"]![
                    seq - 1]]['id']);
              },
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: deleteController!.phaseId.toString() == userCultures
                    .culturesList[userCultures.names[
                        "${userCultures.culturesList[index]['cultureName']}"]![
                    seq - 1]]['id'] ? Color.fromARGB(190, 143, 232, 146) : const Color.fromARGB(0, 255, 193, 7),
                      border: Border.all(
                          color:
                              (indexCultureSelected.index == index || historic)
                                  ? const Color.fromARGB(255, 99, 97, 97)
                                  : Colors.black12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          (userCultures.culturesList[index]['cultureName'] !=
                                      null &&
                                  seq <=
                                      userCultures
                                          .names[
                                              "${userCultures.culturesList[index]['cultureName']}"]!
                                          .length)
                              ? "${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['phase']}"
                              : "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: (indexCultureSelected.index == index ||
                                    historic)
                                ? Colors.black
                                : Colors.black26,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          (userCultures.culturesList[index]['cultureName'] !=
                                      null &&
                                  seq <=
                                      userCultures
                                          .names[
                                              "${userCultures.culturesList[index]['cultureName']}"]!
                                          .length)
                              ? DateFormat('dd/MM/yyyy, HH:mm').format(DateTime
                                  .fromMillisecondsSinceEpoch((userCultures
                                              .culturesList[userCultures.names[
                                                      "${userCultures.culturesList[index]['cultureName']}"]![
                                                  seq - 1]]['dateOutput']
                                              .seconds *
                                          1000) -
                                      10800 * 1000))
                              : "",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 13,
                            color: (indexCultureSelected.index == index ||
                                    historic)
                                ? Colors.black
                                : Colors.black26,
                          ),
                        ),
                        const SizedBox(height: 10),
                        (userCultures.culturesList[index]['cultureName'] !=
                                    null &&
                                seq <=
                                    userCultures
                                        .names[
                                            "${userCultures.culturesList[index]['cultureName']}"]!
                                        .length)
                            ? (userCultures.culturesList[userCultures.names[
                                            "${userCultures.culturesList[index]['cultureName']}"]![
                                        seq - 1]]['phase'] ==
                                    "COLHEITA")
                                ? Column(
                                    children: [
                                      // const SizedBox(height: 10),
                                      // Text(
                                      //   (userCultures.culturesList[index]
                                      //                   ['cultureName'] !=
                                      //               null &&
                                      //           seq <=
                                      //               userCultures
                                      //                   .names[
                                      //                       "${userCultures.culturesList[index]['cultureName']}"]!
                                      //                   .length)
                                      //       ? "Quantidade Bruta: ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['grossQuantity']} KG"
                                      //       : "",
                                      //   style: TextStyle(
                                      //     fontWeight: FontWeight.normal,
                                      //     fontSize: 13,
                                      //     color: (indexCultureSelected.index == index ||
                                      //             historic)
                                      //         ? Colors.black
                                      //         : Colors.black26,
                                      //   ),
                                      // ),
                                      const SizedBox(height: 10),
                                      Text(
                                        (userCultures.culturesList[index]
                                                        ['cultureName'] !=
                                                    null &&
                                                seq <=
                                                    userCultures
                                                        .names[
                                                            "${userCultures.culturesList[index]['cultureName']}"]!
                                                        .length)
                                            ? "Quantidade Líquida: ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['netQuantity']} kg"
                                            : "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13,
                                          color: (indexCultureSelected.index ==
                                                      index ||
                                                  historic)
                                              ? Colors.black
                                              : Colors.black26,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        (userCultures.culturesList[index]
                                                        ['cultureName'] !=
                                                    null &&
                                                seq <=
                                                    userCultures
                                                        .names[
                                                            "${userCultures.culturesList[index]['cultureName']}"]!
                                                        .length)
                                            ? userCultures
                                                        .culturesList[userCultures
                                                                .names[
                                                            "${userCultures.culturesList[index]['cultureName']}"]![
                                                        seq - 1]]['moisture'] ==
                                                    ""
                                                ? "Umidade: N/A"
                                                : "Umidade: ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['moisture']} kg"
                                            : "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13,
                                          color: (indexCultureSelected.index ==
                                                      index ||
                                                  historic)
                                              ? Colors.black
                                              : Colors.black26,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        (userCultures.culturesList[index]
                                                        ['cultureName'] !=
                                                    null &&
                                                seq <=
                                                    userCultures
                                                        .names[
                                                            "${userCultures.culturesList[index]['cultureName']}"]!
                                                        .length)
                                            ? userCultures
                                                        .culturesList[userCultures
                                                                .names[
                                                            "${userCultures.culturesList[index]['cultureName']}"]![
                                                        seq - 1]]['impurity'] ==
                                                    ""
                                                ? "Impureza: N/A"
                                                : "Impureza: ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['impurity']} kg"
                                            : "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13,
                                          color: (indexCultureSelected.index ==
                                                      index ||
                                                  historic)
                                              ? Colors.black
                                              : Colors.black26,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        (userCultures.culturesList[index]
                                                        ['cultureName'] !=
                                                    null &&
                                                seq <=
                                                    userCultures
                                                        .names[
                                                            "${userCultures.culturesList[index]['cultureName']}"]!
                                                        .length)
                                            ? userCultures
                                                        .culturesList[userCultures
                                                                .names[
                                                            "${userCultures.culturesList[index]['cultureName']}"]![
                                                        seq - 1]]['damaged'] ==
                                                    ""
                                                ? "Avariado: N/A"
                                                : "Avariado: ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['damaged']} kg"
                                            : "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13,
                                          color: (indexCultureSelected.index ==
                                                      index ||
                                                  historic)
                                              ? Colors.black
                                              : Colors.black26,
                                        ),
                                      ),

                                      const SizedBox(height: 10),
                                      Text(
                                        (userCultures.culturesList[index]
                                                        ['cultureName'] !=
                                                    null &&
                                                seq <=
                                                    userCultures
                                                        .names[
                                                            "${userCultures.culturesList[index]['cultureName']}"]!
                                                        .length)
                                            ? "Quantidade Classificada (kg): ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['classifiedQttKg']} kg"
                                            : "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13,
                                          color: (indexCultureSelected.index ==
                                                      index ||
                                                  historic)
                                              ? Colors.black
                                              : Colors.black26,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        (userCultures.culturesList[index]
                                                        ['cultureName'] !=
                                                    null &&
                                                seq <=
                                                    userCultures
                                                        .names[
                                                            "${userCultures.culturesList[index]['cultureName']}"]!
                                                        .length)
                                            ? "Quantidade Classificada (scs): ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['classifiedQttBags']} scs"
                                            : "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13,
                                          color: (indexCultureSelected.index ==
                                                      index ||
                                                  historic)
                                              ? Colors.black
                                              : Colors.black26,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        (userCultures.culturesList[index]
                                                        ['cultureName'] !=
                                                    null &&
                                                seq <=
                                                    userCultures
                                                        .names[
                                                            "${userCultures.culturesList[index]['cultureName']}"]!
                                                        .length)
                                            ? "Diferença: ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['percentualDifference']} %"
                                            : "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13,
                                          color: (indexCultureSelected.index ==
                                                      index ||
                                                  historic)
                                              ? Colors.black
                                              : Colors.black26,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        (userCultures.culturesList[index]
                                                        ['cultureName'] !=
                                                    null &&
                                                seq <=
                                                    userCultures
                                                        .names[
                                                            "${userCultures.culturesList[index]['cultureName']}"]!
                                                        .length)
                                            ? "Veículo: ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['vehicle']} - ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['plate']}"
                                            : "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 13,
                                          color: (indexCultureSelected.index ==
                                                      index ||
                                                  historic)
                                              ? Colors.black
                                              : Colors.black26,
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      ProductContainerCulture(
                                        indexCultureSelected:
                                            indexCultureSelected,
                                        index: index,
                                        userCultures: userCultures,
                                        seq: 1,
                                        phaseSeq: seq,
                                        historic: historic,
                                      ),
                                      ProductContainerCulture(
                                        indexCultureSelected:
                                            indexCultureSelected,
                                        index: index,
                                        userCultures: userCultures,
                                        seq: 2,
                                        phaseSeq: seq,
                                        historic: historic,
                                      ),
                                      ProductContainerCulture(
                                        indexCultureSelected:
                                            indexCultureSelected,
                                        index: index,
                                        userCultures: userCultures,
                                        seq: 3,
                                        phaseSeq: seq,
                                        historic: historic,
                                      ),
                                      ProductContainerCulture(
                                        indexCultureSelected:
                                            indexCultureSelected,
                                        index: index,
                                        userCultures: userCultures,
                                        seq: 4,
                                        phaseSeq: seq,
                                        historic: historic,
                                      ),
                                      ProductContainerCulture(
                                        indexCultureSelected:
                                            indexCultureSelected,
                                        index: index,
                                        userCultures: userCultures,
                                        seq: 5,
                                        phaseSeq: seq,
                                        historic: historic,
                                      ),
                                      ProductContainerCulture(
                                        indexCultureSelected:
                                            indexCultureSelected,
                                        index: index,
                                        userCultures: userCultures,
                                        seq: 6,
                                        phaseSeq: seq,
                                        historic: historic,
                                      ),
                                      ProductContainerCulture(
                                        indexCultureSelected:
                                            indexCultureSelected,
                                        index: index,
                                        userCultures: userCultures,
                                        seq: 7,
                                        phaseSeq: seq,
                                        historic: historic,
                                      ),
                                      ProductContainerCulture(
                                        indexCultureSelected:
                                            indexCultureSelected,
                                        index: index,
                                        userCultures: userCultures,
                                        seq: 8,
                                        phaseSeq: seq,
                                        historic: historic,
                                      ),
                                      ProductContainerCulture(
                                        indexCultureSelected:
                                            indexCultureSelected,
                                        index: index,
                                        userCultures: userCultures,
                                        seq: 9,
                                        phaseSeq: seq,
                                        historic: historic,
                                      ),
                                      ProductContainerCulture(
                                        indexCultureSelected:
                                            indexCultureSelected,
                                        index: index,
                                        userCultures: userCultures,
                                        seq: 10,
                                        phaseSeq: seq,
                                        historic: historic,
                                      ),
                                    ],
                                  )
                            : Column(
                                children: [
                                  ProductContainerCulture(
                                    indexCultureSelected: indexCultureSelected,
                                    index: index,
                                    userCultures: userCultures,
                                    seq: 1,
                                    phaseSeq: seq,
                                    historic: historic,
                                  ),
                                  ProductContainerCulture(
                                    indexCultureSelected: indexCultureSelected,
                                    index: index,
                                    userCultures: userCultures,
                                    seq: 2,
                                    phaseSeq: seq,
                                    historic: historic,
                                  ),
                                  ProductContainerCulture(
                                    indexCultureSelected: indexCultureSelected,
                                    index: index,
                                    userCultures: userCultures,
                                    seq: 3,
                                    phaseSeq: seq,
                                    historic: historic,
                                  ),
                                  ProductContainerCulture(
                                    indexCultureSelected: indexCultureSelected,
                                    index: index,
                                    userCultures: userCultures,
                                    seq: 4,
                                    phaseSeq: seq,
                                    historic: historic,
                                  ),
                                  ProductContainerCulture(
                                    indexCultureSelected: indexCultureSelected,
                                    index: index,
                                    userCultures: userCultures,
                                    seq: 5,
                                    phaseSeq: seq,
                                    historic: historic,
                                  ),
                                  ProductContainerCulture(
                                    indexCultureSelected: indexCultureSelected,
                                    index: index,
                                    userCultures: userCultures,
                                    seq: 6,
                                    phaseSeq: seq,
                                    historic: historic,
                                  ),
                                  ProductContainerCulture(
                                    indexCultureSelected: indexCultureSelected,
                                    index: index,
                                    userCultures: userCultures,
                                    seq: 7,
                                    phaseSeq: seq,
                                    historic: historic,
                                  ),
                                  ProductContainerCulture(
                                    indexCultureSelected: indexCultureSelected,
                                    index: index,
                                    userCultures: userCultures,
                                    seq: 8,
                                    phaseSeq: seq,
                                    historic: historic,
                                  ),
                                  ProductContainerCulture(
                                    indexCultureSelected: indexCultureSelected,
                                    index: index,
                                    userCultures: userCultures,
                                    seq: 9,
                                    phaseSeq: seq,
                                    historic: historic,
                                  ),
                                  ProductContainerCulture(
                                    indexCultureSelected: indexCultureSelected,
                                    index: index,
                                    userCultures: userCultures,
                                    seq: 10,
                                    phaseSeq: seq,
                                    historic: historic,
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        color: (indexCultureSelected.index == index || historic)
                            ? const Color.fromARGB(255, 99, 97, 97)
                            : Colors.black12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (userCultures.culturesList[index]['cultureName'] !=
                                    null &&
                                seq <=
                                    userCultures
                                        .names[
                                            "${userCultures.culturesList[index]['cultureName']}"]!
                                        .length)
                            ? "${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['phase']}"
                            : "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color:
                              (indexCultureSelected.index == index || historic)
                                  ? Colors.black
                                  : Colors.black26,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        (userCultures.culturesList[index]['cultureName'] !=
                                    null &&
                                seq <=
                                    userCultures
                                        .names[
                                            "${userCultures.culturesList[index]['cultureName']}"]!
                                        .length)
                            ? DateFormat('dd/MM/yyyy, HH:mm').format(DateTime
                                .fromMillisecondsSinceEpoch((userCultures
                                            .culturesList[userCultures.names[
                                                    "${userCultures.culturesList[index]['cultureName']}"]![
                                                seq - 1]]['dateOutput']
                                            .seconds *
                                        1000) -
                                    10800 * 1000))
                            : "",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color:
                              (indexCultureSelected.index == index || historic)
                                  ? Colors.black
                                  : Colors.black26,
                        ),
                      ),
                      const SizedBox(height: 10),
                      (userCultures.culturesList[index]['cultureName'] !=
                                  null &&
                              seq <=
                                  userCultures
                                      .names[
                                          "${userCultures.culturesList[index]['cultureName']}"]!
                                      .length)
                          ? (userCultures.culturesList[userCultures.names[
                                          "${userCultures.culturesList[index]['cultureName']}"]![
                                      seq - 1]]['phase'] ==
                                  "COLHEITA")
                              ? Column(
                                  children: [
                                    // const SizedBox(height: 10),
                                    // Text(
                                    //   (userCultures.culturesList[index]
                                    //                   ['cultureName'] !=
                                    //               null &&
                                    //           seq <=
                                    //               userCultures
                                    //                   .names[
                                    //                       "${userCultures.culturesList[index]['cultureName']}"]!
                                    //                   .length)
                                    //       ? "Quantidade Bruta: ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['grossQuantity']} KG"
                                    //       : "",
                                    //   style: TextStyle(
                                    //     fontWeight: FontWeight.normal,
                                    //     fontSize: 13,
                                    //     color: (indexCultureSelected.index == index ||
                                    //             historic)
                                    //         ? Colors.black
                                    //         : Colors.black26,
                                    //   ),
                                    // ),
                                    const SizedBox(height: 10),
                                    Text(
                                      (userCultures.culturesList[index]
                                                      ['cultureName'] !=
                                                  null &&
                                              seq <=
                                                  userCultures
                                                      .names[
                                                          "${userCultures.culturesList[index]['cultureName']}"]!
                                                      .length)
                                          ? "Quantidade Líquida: ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['netQuantity']} kg"
                                          : "",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        color: (indexCultureSelected.index ==
                                                    index ||
                                                historic)
                                            ? Colors.black
                                            : Colors.black26,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      (userCultures.culturesList[index]
                                                      ['cultureName'] !=
                                                  null &&
                                              seq <=
                                                  userCultures
                                                      .names[
                                                          "${userCultures.culturesList[index]['cultureName']}"]!
                                                      .length)
                                          ? userCultures
                                                      .culturesList[userCultures
                                                              .names[
                                                          "${userCultures.culturesList[index]['cultureName']}"]![
                                                      seq - 1]]['moisture'] ==
                                                  ""
                                              ? "Umidade: N/A"
                                              : "Umidade: ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['moisture']} kg"
                                          : "",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        color: (indexCultureSelected.index ==
                                                    index ||
                                                historic)
                                            ? Colors.black
                                            : Colors.black26,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      (userCultures.culturesList[index]
                                                      ['cultureName'] !=
                                                  null &&
                                              seq <=
                                                  userCultures
                                                      .names[
                                                          "${userCultures.culturesList[index]['cultureName']}"]!
                                                      .length)
                                          ? userCultures
                                                      .culturesList[userCultures
                                                              .names[
                                                          "${userCultures.culturesList[index]['cultureName']}"]![
                                                      seq - 1]]['impurity'] ==
                                                  ""
                                              ? "Impureza: N/A"
                                              : "Impureza: ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['impurity']} kg"
                                          : "",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        color: (indexCultureSelected.index ==
                                                    index ||
                                                historic)
                                            ? Colors.black
                                            : Colors.black26,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      (userCultures.culturesList[index]
                                                      ['cultureName'] !=
                                                  null &&
                                              seq <=
                                                  userCultures
                                                      .names[
                                                          "${userCultures.culturesList[index]['cultureName']}"]!
                                                      .length)
                                          ? userCultures
                                                      .culturesList[userCultures
                                                              .names[
                                                          "${userCultures.culturesList[index]['cultureName']}"]![
                                                      seq - 1]]['damaged'] ==
                                                  ""
                                              ? "Avariado: N/A"
                                              : "Avariado: ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['damaged']} kg"
                                          : "",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        color: (indexCultureSelected.index ==
                                                    index ||
                                                historic)
                                            ? Colors.black
                                            : Colors.black26,
                                      ),
                                    ),

                                    const SizedBox(height: 10),
                                    Text(
                                      (userCultures.culturesList[index]
                                                      ['cultureName'] !=
                                                  null &&
                                              seq <=
                                                  userCultures
                                                      .names[
                                                          "${userCultures.culturesList[index]['cultureName']}"]!
                                                      .length)
                                          ? "Quantidade Classificada (kg): ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['classifiedQttKg']} kg"
                                          : "",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        color: (indexCultureSelected.index ==
                                                    index ||
                                                historic)
                                            ? Colors.black
                                            : Colors.black26,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      (userCultures.culturesList[index]
                                                      ['cultureName'] !=
                                                  null &&
                                              seq <=
                                                  userCultures
                                                      .names[
                                                          "${userCultures.culturesList[index]['cultureName']}"]!
                                                      .length)
                                          ? "Quantidade Classificada (scs): ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['classifiedQttBags']} scs"
                                          : "",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        color: (indexCultureSelected.index ==
                                                    index ||
                                                historic)
                                            ? Colors.black
                                            : Colors.black26,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      (userCultures.culturesList[index]
                                                      ['cultureName'] !=
                                                  null &&
                                              seq <=
                                                  userCultures
                                                      .names[
                                                          "${userCultures.culturesList[index]['cultureName']}"]!
                                                      .length)
                                          ? "Diferença: ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['percentualDifference']} %"
                                          : "",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        color: (indexCultureSelected.index ==
                                                    index ||
                                                historic)
                                            ? Colors.black
                                            : Colors.black26,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      (userCultures.culturesList[index]
                                                      ['cultureName'] !=
                                                  null &&
                                              seq <=
                                                  userCultures
                                                      .names[
                                                          "${userCultures.culturesList[index]['cultureName']}"]!
                                                      .length)
                                          ? "Veículo: ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['vehicle']} - ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![seq - 1]]['plate']}"
                                          : "",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        color: (indexCultureSelected.index ==
                                                    index ||
                                                historic)
                                            ? Colors.black
                                            : Colors.black26,
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    ProductContainerCulture(
                                      indexCultureSelected:
                                          indexCultureSelected,
                                      index: index,
                                      userCultures: userCultures,
                                      seq: 1,
                                      phaseSeq: seq,
                                      historic: historic,
                                    ),
                                    ProductContainerCulture(
                                      indexCultureSelected:
                                          indexCultureSelected,
                                      index: index,
                                      userCultures: userCultures,
                                      seq: 2,
                                      phaseSeq: seq,
                                      historic: historic,
                                    ),
                                    ProductContainerCulture(
                                      indexCultureSelected:
                                          indexCultureSelected,
                                      index: index,
                                      userCultures: userCultures,
                                      seq: 3,
                                      phaseSeq: seq,
                                      historic: historic,
                                    ),
                                    ProductContainerCulture(
                                      indexCultureSelected:
                                          indexCultureSelected,
                                      index: index,
                                      userCultures: userCultures,
                                      seq: 4,
                                      phaseSeq: seq,
                                      historic: historic,
                                    ),
                                    ProductContainerCulture(
                                      indexCultureSelected:
                                          indexCultureSelected,
                                      index: index,
                                      userCultures: userCultures,
                                      seq: 5,
                                      phaseSeq: seq,
                                      historic: historic,
                                    ),
                                    ProductContainerCulture(
                                      indexCultureSelected:
                                          indexCultureSelected,
                                      index: index,
                                      userCultures: userCultures,
                                      seq: 6,
                                      phaseSeq: seq,
                                      historic: historic,
                                    ),
                                    ProductContainerCulture(
                                      indexCultureSelected:
                                          indexCultureSelected,
                                      index: index,
                                      userCultures: userCultures,
                                      seq: 7,
                                      phaseSeq: seq,
                                      historic: historic,
                                    ),
                                    ProductContainerCulture(
                                      indexCultureSelected:
                                          indexCultureSelected,
                                      index: index,
                                      userCultures: userCultures,
                                      seq: 8,
                                      phaseSeq: seq,
                                      historic: historic,
                                    ),
                                    ProductContainerCulture(
                                      indexCultureSelected:
                                          indexCultureSelected,
                                      index: index,
                                      userCultures: userCultures,
                                      seq: 9,
                                      phaseSeq: seq,
                                      historic: historic,
                                    ),
                                    ProductContainerCulture(
                                      indexCultureSelected:
                                          indexCultureSelected,
                                      index: index,
                                      userCultures: userCultures,
                                      seq: 10,
                                      phaseSeq: seq,
                                      historic: historic,
                                    ),
                                  ],
                                )
                          : Column(
                              children: [
                                ProductContainerCulture(
                                  indexCultureSelected: indexCultureSelected,
                                  index: index,
                                  userCultures: userCultures,
                                  seq: 1,
                                  phaseSeq: seq,
                                  historic: historic,
                                ),
                                ProductContainerCulture(
                                  indexCultureSelected: indexCultureSelected,
                                  index: index,
                                  userCultures: userCultures,
                                  seq: 2,
                                  phaseSeq: seq,
                                  historic: historic,
                                ),
                                ProductContainerCulture(
                                  indexCultureSelected: indexCultureSelected,
                                  index: index,
                                  userCultures: userCultures,
                                  seq: 3,
                                  phaseSeq: seq,
                                  historic: historic,
                                ),
                                ProductContainerCulture(
                                  indexCultureSelected: indexCultureSelected,
                                  index: index,
                                  userCultures: userCultures,
                                  seq: 4,
                                  phaseSeq: seq,
                                  historic: historic,
                                ),
                                ProductContainerCulture(
                                  indexCultureSelected: indexCultureSelected,
                                  index: index,
                                  userCultures: userCultures,
                                  seq: 5,
                                  phaseSeq: seq,
                                  historic: historic,
                                ),
                                ProductContainerCulture(
                                  indexCultureSelected: indexCultureSelected,
                                  index: index,
                                  userCultures: userCultures,
                                  seq: 6,
                                  phaseSeq: seq,
                                  historic: historic,
                                ),
                                ProductContainerCulture(
                                  indexCultureSelected: indexCultureSelected,
                                  index: index,
                                  userCultures: userCultures,
                                  seq: 7,
                                  phaseSeq: seq,
                                  historic: historic,
                                ),
                                ProductContainerCulture(
                                  indexCultureSelected: indexCultureSelected,
                                  index: index,
                                  userCultures: userCultures,
                                  seq: 8,
                                  phaseSeq: seq,
                                  historic: historic,
                                ),
                                ProductContainerCulture(
                                  indexCultureSelected: indexCultureSelected,
                                  index: index,
                                  userCultures: userCultures,
                                  seq: 9,
                                  phaseSeq: seq,
                                  historic: historic,
                                ),
                                ProductContainerCulture(
                                  indexCultureSelected: indexCultureSelected,
                                  index: index,
                                  userCultures: userCultures,
                                  seq: 10,
                                  phaseSeq: seq,
                                  historic: historic,
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
