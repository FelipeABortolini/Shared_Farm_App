import 'package:flutter/material.dart';

import '../../../controllers/culture/index_culture_selected_controller.dart';
import '../../../controllers/culture/user_cultures_controller.dart';

class ProductContainerCulture extends StatelessWidget {
  const ProductContainerCulture({
    super.key,
    required this.indexCultureSelected,
    required this.index,
    required this.userCultures,
    required this.seq,
    required this.phaseSeq,
    required this.historic,
  });

  final IndexCultureSelectedController indexCultureSelected;
  final int index;
  final UserCulturesController userCultures;
  final int seq;
  final int phaseSeq;
  final bool historic;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: userCultures
              .culturesList[userCultures.names[
                      "${userCultures.culturesList[index]['cultureName']}"]![
                  phaseSeq - 1]]['products']
              .length >=
          seq,
      child: Column(
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
                      ? const Color.fromARGB(255, 177, 176, 176)
                      : Colors.black12),
            ),
            child: Column(
              children: [
                Text(
                  // (userCultures.culturesList[index]['products'].length >= seq && (userCultures.culturesList[index]['cultureName'] != null && seq <= userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![phaseSeq - 1]]['products'].length))
                  (userCultures
                                  .culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![phaseSeq - 1]]
                                      ['products']
                                  .length >=
                              seq &&
                          (userCultures.culturesList[userCultures
                                          .names["${userCultures.culturesList[index]['cultureName']}"]![phaseSeq - 1]]
                                      ['cultureName'] !=
                                  null &&
                              seq <=
                                  userCultures
                                      .culturesList[userCultures
                                              .names["${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![phaseSeq - 1]]['cultureName']}"]![
                                          phaseSeq - 1]]['products']
                                      .length))
                      ? "Produto: ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![phaseSeq - 1]]['products'][seq - 1]?["product"]}"
                      : "",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: (indexCultureSelected.index == index || historic)
                        ? Colors.black
                        : Colors.black26,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  (userCultures
                                  .culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![phaseSeq - 1]]
                                      ['products']
                                  .length >=
                              seq &&
                          (userCultures.culturesList[userCultures
                                          .names["${userCultures.culturesList[index]['cultureName']}"]![phaseSeq - 1]]
                                      ['cultureName'] !=
                                  null &&
                              seq <=
                                  userCultures
                                      .culturesList[userCultures
                                              .names["${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![phaseSeq - 1]]['cultureName']}"]![
                                          phaseSeq - 1]]['products']
                                      .length))
                      ? "Princípio Ativo: ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![phaseSeq - 1]]['cultureName']}"]![phaseSeq - 1]]['products'][seq - 1]?["active_principle"]}"
                      : "",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: (indexCultureSelected.index == index || historic)
                        ? Colors.black
                        : Colors.black26,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  (userCultures
                                  .culturesList[userCultures
                                          .names["${userCultures.culturesList[index]['cultureName']}"]![phaseSeq - 1]]
                                      ['products']
                                  .length >=
                              seq &&
                          userCultures.culturesList[userCultures
                                      .names["${userCultures.culturesList[index]['cultureName']}"]![phaseSeq - 1]]
                                  ['cultureName'] !=
                              null &&
                          seq <=
                              userCultures
                                  .culturesList[userCultures
                                          .names["${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![phaseSeq - 1]]['cultureName']}"]![phaseSeq - 1]]
                                      ['products']
                                  .length)
                      ? "Quantidade: ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![phaseSeq - 1]]['cultureName']}"]![phaseSeq - 1]]['products'][seq - 1]?["quantity"]} ${userCultures.culturesList[userCultures.names["${userCultures.culturesList[userCultures.names["${userCultures.culturesList[index]['cultureName']}"]![phaseSeq - 1]]['cultureName']}"]![phaseSeq - 1]]['products'][seq - 1]?["unity"]}"
                      : "",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: (indexCultureSelected.index == index || historic)
                        ? Colors.black
                        : Colors.black26,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
