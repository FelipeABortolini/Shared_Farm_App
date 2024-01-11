import 'package:flutter/material.dart';

import '../../../../controllers/culture/local_controller.dart';

class LocalSelect extends StatelessWidget {
  const LocalSelect({
    Key? key,
    required this.local,
    this.multi,
    this.text,
  }) : super(key: key);

  final LocalController local;
  final bool? multi;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return multi == null
        ? Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text == null
                      ? const Text(
                          'Local da Cultura',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          text!,
                          style: const TextStyle(
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
                  const Text('Santa Terezinha'),
                  Checkbox(
                    value: local.santaTerezinha,
                    onChanged: (valueYes) {
                      local.setSantaTerezinha();
                    },
                  ),
                  const SizedBox(width: 30),
                  const Text('Real'),
                  Checkbox(
                    value: local.real,
                    onChanged: (valueNot) {
                      local.setReal();
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('São João'),
                  Checkbox(
                    value: local.saoJoao,
                    onChanged: (valueYes) {
                      local.setSaoJoao();
                    },
                  ),
                  const SizedBox(width: 30),
                  const Text('São Jorge'),
                  Checkbox(
                    value: local.saoJorge,
                    onChanged: (valueNot) {
                      local.setSaoJorge();
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Cruzeiro'),
                  Checkbox(
                    value: local.cruzeiro,
                    onChanged: (valueYes) {
                      local.setCruzeiro();
                    },
                  ),
                  const SizedBox(width: 30),
                  const Text('Campinho'),
                  Checkbox(
                    value: local.campinho,
                    onChanged: (valueNot) {
                      local.setCampinho();
                    },
                  ),
                ],
              ),
            ],
          )
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text == null
                      ? const Text(
                          'Local da Cultura',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          text!,
                          style: const TextStyle(
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
                  const Text('Santa Terezinha'),
                  Checkbox(
                    value: local.santaTerezinha,
                    onChanged: (valueYes) {
                      local.toggleSantaTerezinha();
                    },
                  ),
                  const SizedBox(width: 30),
                  const Text('Real'),
                  Checkbox(
                    value: local.real,
                    onChanged: (valueNot) {
                      local.toggleReal();
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('São João'),
                  Checkbox(
                    value: local.saoJoao,
                    onChanged: (valueYes) {
                      local.toggleSaoJoao();
                    },
                  ),
                  const SizedBox(width: 30),
                  const Text('São Jorge'),
                  Checkbox(
                    value: local.saoJorge,
                    onChanged: (valueNot) {
                      local.toggleSaoJorge();
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Cruzeiro'),
                  Checkbox(
                    value: local.cruzeiro,
                    onChanged: (valueYes) {
                      local.toggleCruzeiro();
                    },
                  ),
                  const SizedBox(width: 30),
                  const Text('Campinho'),
                  Checkbox(
                    value: local.campinho,
                    onChanged: (valueNot) {
                      local.toggleCampinho();
                    },
                  ),
                ],
              ),
            ],
          );
  }
}
