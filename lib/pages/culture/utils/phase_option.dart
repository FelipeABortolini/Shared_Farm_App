import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/providers.dart';

// ignore: must_be_immutable
class PhaseOption extends HookConsumerWidget {
  String phase;

  PhaseOption({
    Key? key,
    required this.phase,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phaseSelected = ref.watch(selectPhaseProvider);

    return GestureDetector(
      child: Container(
        height: 40,
        width: 350,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.amber,
        ),
        child: Center(
          child: Text(
            phase,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      onTap: () {
        phaseSelected.setPhase(phase);
      },
    );
  }
}
