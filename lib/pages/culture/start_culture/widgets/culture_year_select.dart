import 'package:flutter/material.dart';

import '../../../../controllers/culture/culture_year_controller.dart';


class CultureYearSelect extends StatelessWidget {
  const CultureYearSelect({
    Key? key,
    required this.anoCultura,
  }) : super(key: key);

  final CultureYearController anoCultura;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Período da Cultura',
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
            Text('${anoCultura.currentYear-1}/${anoCultura.currentYear}'),
            Checkbox(
              value: anoCultura.lastCurrent,
              onChanged: (valueYes) {
                anoCultura.setLastCurrent();
              },
            ),
            const SizedBox(width: 30),
            Text('${anoCultura.currentYear}'),
            Checkbox(
              value: anoCultura.current,
              onChanged: (valueNot) {
                anoCultura.setCurrent();
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${anoCultura.currentYear}/${anoCultura.currentYear+1}'),
            Checkbox(
              value: anoCultura.currentNext,
              onChanged: (valueYes) {
                anoCultura.setCurrentNext();
              },
            ),
            const SizedBox(width: 30),
            Text('${anoCultura.currentYear+1}'),
            Checkbox(
              value: anoCultura.next,
              onChanged: (valueNot) {
                anoCultura.setNext();
              },
            ),
          ],
        ),
      ],
    );
  }
}
