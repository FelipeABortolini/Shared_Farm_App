import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';
import '../../../../controllers/user_controller.dart';

// ignore: non_constant_identifier_names
Widget DropDownUsersTypes(
  UserController user,
  String? selected,
  TextEditingController passwordController,
) {
  return Padding(
    padding: Platform.isAndroid
        ? const EdgeInsets.symmetric(horizontal: 10)
        : const EdgeInsets.symmetric(horizontal: 450),
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
            items: <String>[
              'Consulta',
              'Operacional Básico',
              'Operacional',
              'Gerencial',
              'Host',
            ]
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            value: selected,
            onChanged: (String? value) {
              user.setSelectedPermissionToNewUser(value);
              if(user.selectedPermissionToNewUser == "Host"){
                passwordController.text = "@host2023@";
              } else {
                passwordController.text = "";
              }
            },
            buttonWidth: 150,
            itemHeight: 50,
          ),
        ),
      ],
    ),
  );
}
