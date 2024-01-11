import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flv_farm/pages/login/utils/auth_check.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:universal_io/io.dart';

import '../../../../db/vehicles/delete_vehicles/delete_vehicles.dart';
import '../../../../providers/providers.dart';
import '../../../../shared/alert.dart';
import '../../../../styles/app_text_style.dart';
import '../widgets/drop_down_vehicles.dart';

// ignore: must_be_immutable
class DelVehiclePage extends HookConsumerWidget {
  DelVehiclePage({super.key});

  AlertWidget alert = AlertWidget();
  DeleteVehicles deleteVehicle = DeleteVehicles();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicles = ref.watch(vehiclesProvider);
    final loading = ref.watch(loadingCultureProvider);

    void resetControlls() {
      vehicles.resetControllers();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Excluir Veículo"),
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
                      DropDownVehicles(
                        vehicles: vehicles.vehicles,
                        selected: vehicles.selected,
                        v: vehicles,
                        edit: false,
                      ),
                      const SizedBox(height: 200),
                      GestureDetector(
                        onTap: () async {
                          if (!loading.isLoading) {
                            loading.setIsLoading();
                            try {
                              if (vehicles.name.text == "Selecione") {
                                // ignore: use_build_context_synchronously
                                await alert.alert(
                                    context,
                                    "Selecione um veículo.",
                                    "ATENÇÃO!",
                                    AlertType.info);
                                loading.resetIsLoading();
                              } else {
                                deleteVehicle.del(vehicles.selected);
                                // ignore: use_build_context_synchronously
                                await alert.alert(
                                    context,
                                    "Veículo excluido com sucesso.",
                                    "SUCESSO!",
                                    AlertType.success);
                                resetControlls();
                                loading.resetIsLoading();
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AuthCheck(first: false),
                                  ),
                                );
                              }
                            } catch (e) {
                              loading.resetIsLoading();
                              // ignore: use_build_context_synchronously
                              await alert.alert(
                                  context,
                                  "Erro ao excluir veículo.",
                                  "ERRO!",
                                  AlertType.error);
                            }
                          }
                        },
                        child: Platform.isAndroid
                            ? Container(
                                height: 56,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.green[300]),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Padding(
                                          padding: !loading.isLoading
                                              ? const EdgeInsets.only(left: 32)
                                              : const EdgeInsets.only(left: 0),
                                          child: !loading.isLoading
                                              ? Text(
                                                  'Excluir',
                                                  style: AppTextStyle.style(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              : Lottie.asset(
                                                  'assets/loading.json',
                                                  height: 50,
                                                  width: 50),
                                        ),
                                      ),
                                    ),
                                    !loading.isLoading
                                        ? const Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Icon(Icons.arrow_forward,
                                                color: Colors.white, size: 32),
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                              )
                            : Container(
                                height: 56,
                                width: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.green[300]),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Padding(
                                          padding: !loading.isLoading
                                              ? const EdgeInsets.only(left: 32)
                                              : const EdgeInsets.only(left: 0),
                                          child: !loading.isLoading
                                              ? Text(
                                                  'Excluir',
                                                  style: AppTextStyle.style(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )
                                              : Lottie.asset(
                                                  'assets/loading.json',
                                                  height: 50,
                                                  width: 50),
                                        ),
                                      ),
                                    ),
                                    !loading.isLoading
                                        ? const Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Icon(Icons.arrow_forward,
                                                color: Colors.white, size: 32),
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                              ),
                      ),
                      const SizedBox(height: 200),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
