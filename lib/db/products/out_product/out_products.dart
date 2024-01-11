import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import '../../../core/auth_service.dart';
import '../../database.dart';

class OutProducts extends Database {
  void register(
    int number,
    AuthService auth,
    double quantity,
    String product,
    String date,
    String hour,
    String level,
    String category,
    double newQtt,
    // double newLocalQtt,
    String local,
    String activePrinciple,
    String culture,
    String phase,
    String unity,
    bool fill,
    String vehicle,
    String plate,
  ) async {
    date = "$date $hour";
    DateTime dateTime = DateFormat('dd/MM/yyyy hh:mm').parse(date);
    Timestamp timestamp = Timestamp.fromMillisecondsSinceEpoch(
        dateTime.millisecondsSinceEpoch + 10800000);
    await db.collection("saidas").doc(number.toString()).set({
      "category": category,
      "level": level,
      "product": product,
      "user": auth.usuario!.uid,
      "dateRegister": FieldValue.serverTimestamp(),
      "dateInput": timestamp,
      "quantity": quantity,
      "newQtt": newQtt,
      // "newLocalQtt": newLocalQtt,
      "local": local,
      "activePrinciple": activePrinciple,
      "culture": culture,
      "phase": phase,
      "unity": unity,
      "fill": fill,
      "vehicle": vehicle,
      "plate": plate,
      "ID": number,
    });
  }
}
