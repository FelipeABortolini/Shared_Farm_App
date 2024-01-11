// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

import '../../../../controllers/vehicles/vehicles_controller.dart';

// ignore: must_be_immutable
class DropDownVehicles extends StatelessWidget {
  List<Map<String, dynamic>> vehicles;
  String? selected;
  VehiclesController v;
  bool edit;

  DropDownVehicles({
    Key? key,
    required this.vehicles,
    this.selected,
    required this.v,
    required this.edit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Platform.isAndroid ? const EdgeInsets.symmetric(horizontal: 10) : const EdgeInsets.symmetric(horizontal: 450),
      child: Column(
        children: [
          const SizedBox(height: 10),
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField2(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              isExpanded: true,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 30,
              buttonHeight: 50,
              buttonPadding: const EdgeInsets.only(left: 20, right: 10),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              hint: const Text(
                'Escolha',
                style: TextStyle(fontSize: 14),
              ),
              value: selected,
              onChanged: (value) {
                v.setSelected(value);
                // if (edit) {
                  for (var veh in vehicles) {
                    if (veh["ID"] == value) {
                      v.setName(veh["name"]);
                      v.setPlate(veh["plate"]);
                      v.setTank(veh["tank"].toString());
                    }
                  }
                // }
              },
              items: vehicles
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item["ID"].toString(),
                      child: item["plate"].toString() != "" ? Text(
                        "${item["name"].toString()} - ${item["plate"].toString()}",
                        style: const TextStyle(fontSize: 14),
                      ) : Text(
                        item["name"].toString(),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  )
                  .toList(),
              buttonWidth: 150,
              itemHeight: 50,
            ),
          ),
        ],
      ),
    );
  }
}
