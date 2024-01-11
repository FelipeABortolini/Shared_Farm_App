import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../../core/auth_service.dart';
import '../../database.dart';

class InProducts extends Database {
  void register(
      int number,
      AuthService auth,
      double quantity,
      String product,
      String code,
      String date,
      String level,
      String category,
      double newQtt,
      // double newLocalQtt,
      String local,
      String activePrinciple,
      String unity) async {
    DateTime dateTime = DateFormat('dd/MM/yyyy').parse(date);
    Timestamp timestamp = Timestamp.fromMillisecondsSinceEpoch(
        dateTime.millisecondsSinceEpoch + 10800000);
    await db.collection("entradas").doc(number.toString()).set({
      "category": category,
      "level": level,
      "product": product,
      "code": code,
      "user": auth.usuario!.uid,
      "dateRegister": FieldValue.serverTimestamp(),
      "dateInput": timestamp,
      "quantity": quantity,
      "newQtt": newQtt,
      // "newLocalQtt": newLocalQtt,
      "local": local,
      "activePrinciple": activePrinciple,
      "unity": unity,
      "ID": number,
    });
  }
}
