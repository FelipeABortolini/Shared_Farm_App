import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flv_farm/db/vehicles/fill/fill_vehicle.dart';
import 'package:flv_farm/pages/login/utils/auth_check.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:universal_io/io.dart';

import '../../../../providers/providers.dart';
import '../../../../shared/alert.dart';
import '../../core/auth_service.dart';
import '../../db/products/out_product/get_last_outputs.dart';
import '../../db/products/out_product/out_products.dart';
import '../../db/products/update_quantity/update_quantity.dart';
import '../../db/vehicles/utils/get_diesel_quantity.dart';
import '../../shared/input.dart';
import '../../shared/inputs_report.dart';
import '../../styles/app_text_style.dart';
import '../culture/start_culture/widgets/local_select.dart';
import '../host/vehicles/widgets/drop_down_vehicles.dart';

// ignore: must_be_immutable
class FillVehiclesPage extends HookConsumerWidget {
  FillVehiclesPage({super.key});

  AlertWidget alert = AlertWidget();
  FillVehicles fillVehicles = FillVehicles();
  UpdateQuantity updateQuantity = UpdateQuantity();
  GetDieselQuantity getDieselQuantity = GetDieselQuantity();
  final outProduct = OutProducts();
  final getLastOutputs = GetLastOutputs();

  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  String toCamelCase(String input) {
    if (input.isEmpty) {
      return '';
    }

    List<String> words = input.split(' ');
    String camelCaseText = words[0].toLowerCase();

    for (int i = 1; i < words.length; i++) {
      String firstLetter = words[i][0].toUpperCase();
      String restOfWord = words[i].substring(1).toLowerCase();
      camelCaseText += firstLetter + restOfWord;
    }

    if (camelCaseText == "sãoJoão") {
      camelCaseText = "saoJoao";
    } else if (camelCaseText == "sãoJorge") {
      camelCaseText = "saoJorge";
    }

    return camelCaseText;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicles = ref.watch(vehiclesProvider);
    final local = ref.watch(localProvider);
    final fillVehiclesProv = ref.watch(fillVehicleProvider);
    final auth = ref.watch(authServiceProvider.notifier);
    final dateProv = ref.watch(datePickerProvider);
    final hourProv = ref.watch(hourPickerProvider);
    final loading = ref.watch(loadingCultureProvider);

    TextEditingController dateController =
        TextEditingController(text: formatter.format(dateProv.date));
    TextEditingController hourController = TextEditingController(
        text:
            "${hourProv.hour.hour.toString().padLeft(2, '0')}:${hourProv.hour.minute.toString().padLeft(2, '0')}");

    void resetControlls() {
      fillVehiclesProv.resetQuantity();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Abastecer Veículo"),
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
                      const SizedBox(height: 10),
                      const Text(
                        "Data do abastecimento",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              'Data: ${formatter.format(dateProv.date)}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                locale: const Locale('pt', 'BR'),
                                context: context,
                                initialDate: dateProv.date,
                                firstDate: DateTime(dateProv.date.year),
                                lastDate: DateTime(2100),
                              );
                              if (newDate == null) return;
                              dateProv.setDate(newDate);
                            },
                            icon: const Icon(Icons.date_range),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              'Hora: ${hourProv.hour.format(context)}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                context: context,
                                initialTime: hourProv.hour,
                              );
                              if (pickedTime == null) return;
                              hourProv.setHour(pickedTime);
                            },
                            icon: const Icon(Icons.timer_sharp),
                          ),
                        ],
                      ),
                      const Divider(thickness: 2),
                      const SizedBox(height: 10),
                      const Text(
                        "Veículo",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      DropDownVehicles(
                        vehicles: vehicles.vehicles,
                        selected: vehicles.selected,
                        v: vehicles,
                        edit: false,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 300,
                        child: Input(
                          controller: fillVehiclesProv.quantity,
                          nameField: 'Litros',
                          number: true,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(thickness: 2),
                      const SizedBox(height: 10),
                      LocalSelect(local: local, text: "Local do abastecimento"),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () async {
                          if (!loading.isLoading) {
                            loading.setIsLoading();
                            try {
                              if (vehicles.name.text == "Selecione" || vehicles.name.text == "") {
                                // ignore: use_build_context_synchronously
                                await alert.alert(
                                    context,
                                    "Selecione um veículo.",
                                    "ATENÇÃO!",
                                    AlertType.info);
                                loading.resetIsLoading();
                              } else {
                                double dieselQtd =
                                    await getDieselQuantity.get();
                                double dieselLocalQtd = await getDieselQuantity
                                    .getLocal(local.result);
                                fillVehicles.update(vehicles.selected, {
                                  "tank": vehicles.vehicles[
                                              int.parse(vehicles.selected!)]
                                          ["tank"] +
                                      int.parse(fillVehiclesProv.quantity.text)
                                });

                                updateQuantity.update(
                                    "diesel",
                                    1,
                                    dieselQtd -
                                        double.parse(
                                            fillVehiclesProv.quantity.text),
                                    1,
                                    "quantity");

                                updateQuantity.update(
                                    "diesel",
                                    1,
                                    dieselLocalQtd -
                                        double.parse(
                                            fillVehiclesProv.quantity.text),
                                    1,
                                    toCamelCase(local.result));

                                int lastOutputs = await getLastOutputs.get();
                                int newInputNumber = lastOutputs + 1;

                                List<Map<String, dynamic>> list = [];
                                String vehicleName = "";
                                String vehiclePlate = "";

                                await FirebaseFirestore.instance
                                    .collection("veiculos")
                                    .get()
                                    .then((value) => {
                                          for (var doc in value.docs)
                                            {
                                              if (doc["ID"] ==
                                                  vehicles.selected)
                                                {
                                                  vehicleName = doc["name"],
                                                  vehiclePlate = doc["plate"],
                                                }
                                            }
                                        });

                                outProduct.register(
                                  newInputNumber,
                                  auth,
                                  double.parse(fillVehiclesProv.quantity.text),
                                  "diesel",
                                  dateController.text,
                                  hourController.text,
                                  "1",
                                  "diesel",
                                  dieselQtd -
                                      double.parse(
                                          fillVehiclesProv.quantity.text),
                                  // dieselLocalQtd -
                                  //     double.parse(
                                  //         fillVehiclesProv.quantity.text),
                                  local.result,
                                  "",
                                  "",
                                  "",
                                  "L",
                                  true,
                                  vehicleName,
                                  vehiclePlate,
                                );
                                resetControlls();
                                loading.resetIsLoading();
                                // ignore: use_build_context_synchronously
                                await alert.alert(
                                    context,
                                    "Veículo abastecido com sucesso.",
                                    "SUCESSO!",
                                    AlertType.success);
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
                              alert.alert(context, "Erro ao abastecer veículo.",
                                  "ERRO!", AlertType.error);
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
                                                  'Abastecer',
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
                                                  'Abastecer',
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
                      const SizedBox(height: 70),
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
