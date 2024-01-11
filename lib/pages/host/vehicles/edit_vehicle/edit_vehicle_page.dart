import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:universal_io/io.dart';

import '../../../../db/vehicles/add_vehicles/add_vehicle.dart';
import '../../../../db/vehicles/edit_vehicles/update_vehicle.dart';
import '../../../../providers/providers.dart';
import '../../../../shared/alert.dart';
import '../../../../shared/input.dart';
import '../../../../styles/app_text_style.dart';
import '../../../login/utils/auth_check.dart';
import '../widgets/drop_down_vehicles.dart';

// ignore: must_be_immutable
class EditVehiclePage extends HookConsumerWidget {
  EditVehiclePage({super.key});

  AlertWidget alert = AlertWidget();
  AddVehicle addVehicle = AddVehicle();
  EditVehicles editVehicles = EditVehicles();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicles = ref.watch(vehiclesProvider);
    final loading = ref.watch(loadingCultureProvider);

    void resetControlls() {
      vehicles.resetControllers();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Veículo"),
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
                        edit: true,
                      ),
                      const SizedBox(height: 20),
                      Platform.isAndroid
                          ? Input(
                              controller: vehicles.name,
                              nameField: 'Nome',
                              number: false,
                            )
                          : Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 450),
                              child: Input(
                                controller: vehicles.name,
                                nameField: 'Nome',
                                number: false,
                              ),
                            ),
                      Platform.isAndroid
                          ? Input(
                              controller: vehicles.plate,
                              nameField: 'Placa',
                              number: false,
                            )
                          : Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 450),
                              child: Input(
                                controller: vehicles.plate,
                                nameField: 'Placa',
                                number: false,
                              ),
                            ),
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
                                editVehicles.update(vehicles.selected, {
                                  "ID": vehicles.selected.toString(),
                                  "name": vehicles.name.text.toUpperCase(),
                                  "plate": vehicles.plate.text.toUpperCase(),
                                });
                                // ignore: use_build_context_synchronously
                                await alert.alert(
                                    context,
                                    "Veículo editado com sucesso.",
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
                                  "Erro ao editar o veículo.",
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
                                                  'Editar',
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
                                                  'Editar',
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
