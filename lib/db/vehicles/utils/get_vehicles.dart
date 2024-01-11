import 'package:cloud_firestore/cloud_firestore.dart';

import '../../database.dart';

class GetVehicles extends Database {
  Future<List<Map<String, dynamic>>> get() async {
    List<Map<String, dynamic>> list = [];
    QuerySnapshot<Map<String, dynamic>>? query;

    await db.collection("veiculos").get().then((value) => query = value);
    if (query != null) {
      list = query!.docs.map((doc) => doc.data()).toList();
    }

    list.sort((a, b) {
      int timestampA = int.parse(a["ID"]);
      int timestampB = int.parse(b["ID"]);
      return timestampA.compareTo(timestampB);
    });

    return list;
  }
}
