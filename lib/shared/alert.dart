import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertWidget {
  Future<bool?> alert(BuildContext context, String msg, String title, AlertType type) {
    return Alert(
      context: context,
      type: type,
      title: title,
      desc: msg,
      buttons: [
        DialogButton(
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
        )
      ],
    ).show();
  }
}