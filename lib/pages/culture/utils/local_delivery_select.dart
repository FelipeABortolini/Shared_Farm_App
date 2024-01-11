import 'package:flutter/material.dart';

import '../../../controllers/culture/colheita_controller.dart';
import '../../../controllers/locals_controller.dart';

class LocalDeliverySelect extends StatelessWidget {
  const LocalDeliverySelect({
    Key? key,
    required this.local,
    required this.colheita,
  }) : super(key: key);

  final LocalsController local;
  final ColheitaController colheita;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Local de Entrega',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            local.locals.isNotEmpty
                ? Row(
                    children: [
                      Text(local.locals[0]["name"]),
                      Checkbox(
                        value: (local.selected == local.locals[0]["name"]),
                        onChanged: (valueYes) {
                          local.setSelected(local.locals[0]["name"]);
                          colheita.setLocalEntrega(local.selected!);
                        },
                      ),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(width: 30),
            local.locals.length >= 2
                ? Row(
                    children: [
                      Text(local.locals[1]["name"]),
                      Checkbox(
                        value: (local.selected == local.locals[1]["name"]),
                        onChanged: (valueYes) {
                          local.setSelected(local.locals[1]["name"]);
                          colheita.setLocalEntrega(local.selected!);
                        },
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            local.locals.length >= 3
                ? Row(
                    children: [
                      Text(local.locals[2]["name"]),
                      Checkbox(
                        value: (local.selected == local.locals[2]["name"]),
                        onChanged: (valueYes) {
                          local.setSelected(local.locals[2]["name"]);
                          colheita.setLocalEntrega(local.selected!);
                        },
                      ),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(width: 30),
            local.locals.length >= 4
                ? Row(
                    children: [
                      Text(local.locals[3]["name"]),
                      Checkbox(
                        value: (local.selected == local.locals[3]["name"]),
                        onChanged: (valueYes) {
                          local.setSelected(local.locals[3]["name"]);
                          colheita.setLocalEntrega(local.selected!);
                        },
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            local.locals.length >= 5
                ? Row(
                    children: [
                      Text(local.locals[4]["name"]),
                      Checkbox(
                        value: (local.selected == local.locals[4]["name"]),
                        onChanged: (valueYes) {
                          local.setSelected(local.locals[4]["name"]);
                          colheita.setLocalEntrega(local.selected!);
                        },
                      ),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(width: 30),
            local.locals.length >= 6
                ? Row(
                    children: [
                      Text(local.locals[5]["name"]),
                      Checkbox(
                        value: (local.selected == local.locals[5]["name"]),
                        onChanged: (valueYes) {
                          local.setSelected(local.locals[5]["name"]);
                          colheita.setLocalEntrega(local.selected!);
                        },
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            local.locals.length >= 7
                ? Row(
                    children: [
                      Text(local.locals[6]["name"]),
                      Checkbox(
                        value: (local.selected == local.locals[6]["name"]),
                        onChanged: (valueYes) {
                          local.setSelected(local.locals[6]["name"]);
                          colheita.setLocalEntrega(local.selected!);
                        },
                      ),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(width: 30),
            local.locals.length >= 8
                ? Row(
                    children: [
                      Text(local.locals[7]["name"]),
                      Checkbox(
                        value: (local.selected == local.locals[7]["name"]),
                        onChanged: (valueYes) {
                          local.setSelected(local.locals[7]["name"]);
                          colheita.setLocalEntrega(local.selected!);
                        },
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            local.locals.length >= 9
                ? Row(
                    children: [
                      Text(local.locals[8]["name"]),
                      Checkbox(
                        value: (local.selected == local.locals[8]["name"]),
                        onChanged: (valueYes) {
                          local.setSelected(local.locals[8]["name"]);
                          colheita.setLocalEntrega(local.selected!);
                        },
                      ),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(width: 30),
            local.locals.length >= 10
                ? Row(
                    children: [
                      Text(local.locals[9]["name"]),
                      Checkbox(
                        value: (local.selected == local.locals[9]["name"]),
                        onChanged: (valueYes) {
                          local.setSelected(local.locals[9]["name"]);
                          colheita.setLocalEntrega(local.selected!);
                        },
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            local.locals.length >= 11
                ? Row(
                    children: [
                      Text(local.locals[10]["name"]),
                      Checkbox(
                        value: (local.selected == local.locals[10]["name"]),
                        onChanged: (valueYes) {
                          local.setSelected(local.locals[10]["name"]);
                          colheita.setLocalEntrega(local.selected!);
                        },
                      ),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(width: 30),
            local.locals.length >= 12
                ? Row(
                    children: [
                      Text(local.locals[11]["name"]),
                      Checkbox(
                        value: (local.selected == local.locals[11]["name"]),
                        onChanged: (valueYes) {
                          local.setSelected(local.locals[11]["name"]);
                          colheita.setLocalEntrega(local.selected!);
                        },
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            local.locals.length >= 13
                ? Row(
                    children: [
                      Text(local.locals[12]["name"]),
                      Checkbox(
                        value: (local.selected == local.locals[12]["name"]),
                        onChanged: (valueYes) {
                          local.setSelected(local.locals[12]["name"]);
                          colheita.setLocalEntrega(local.selected!);
                        },
                      ),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(width: 30),
            local.locals.length >= 14
                ? Row(
                    children: [
                      Text(local.locals[13]["name"]),
                      Checkbox(
                        value: (local.selected == local.locals[13]["name"]),
                        onChanged: (valueYes) {
                          local.setSelected(local.locals[13]["name"]);
                          colheita.setLocalEntrega(local.selected!);
                        },
                      ),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
