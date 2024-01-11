// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../controllers/culture/culture_type_controller.dart';

// ignore: must_be_immutable
class CultureTypeSelect extends StatelessWidget {
  CultureTypeSelect({
    Key? key,
    required this.tipoCultura,
     this.recipe,
  }) : super(key: key);

  final CultureTypeController tipoCultura;
  bool? recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            recipe == true
                ? const Text(
                    'Tipo de Receita',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : const Text(
                    'Tipo de Cultura',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Soja'),
            Checkbox(
              value: tipoCultura.soja,
              onChanged: (valueYes) {
                tipoCultura.setSoja();
              },
            ),
            const SizedBox(width: 30),
            const Text('Milho'),
            Checkbox(
              value: tipoCultura.milho,
              onChanged: (valueNot) {
                tipoCultura.setMilho();
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Trigo'),
            Checkbox(
              value: tipoCultura.trigo,
              onChanged: (valueYes) {
                tipoCultura.setTrigo();
              },
            ),
          ],
        ),
      ],
    );
  }
}
