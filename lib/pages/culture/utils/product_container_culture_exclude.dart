import 'package:flutter/material.dart';

import '../../../controllers/culture/user_cultures_controller.dart';

class ProductContainerCultureExclude extends StatelessWidget {
  const ProductContainerCultureExclude({
    super.key,
    required this.userCultures,
    required this.seq,
  });

  final UserCulturesController userCultures;
  final int seq;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: userCultures.cultureExclude[seq - 1]['products'].length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int indexS) {
        return Column(
          children: [
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border:
                    Border.all(color: const Color.fromARGB(255, 177, 176, 176)),
              ),
              child: Column(
                children: [
                  Text(
                    "Produto: ${userCultures.cultureExclude[seq - 1]["products"][indexS]["product"]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Princípio Ativo: ${userCultures.cultureExclude[seq - 1]["products"][indexS]["active_principle"]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Quantidade: ${userCultures.cultureExclude[seq - 1]["products"][indexS]["quantity"]} ${userCultures.cultureExclude[seq - 1]["products"][indexS]["unity"]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
