// import 'package:cloud_firestore/cloud_firestore.dart';

import '../../database.dart';

class GetLastVehicleID extends Database {
  Future<int> get() async {
    // List<Map<String, dynamic>> list = [];
    int number = 0;
    // QuerySnapshot<Map<String, dynamic>>? query;

    // await db.collection("veiculos").get().then((value) => query = value);
    // if (query != null) {
    //   list = query!.docs.map((doc) => doc.data()).toList();
    // }

    await db.collection("veiculos").get().then((value) {
      for (var doc in value.docs) {
        if (int.parse(doc.id) > number) {
          number = int.parse(doc.id);
        }
      }
    });

    return number;
  }
}
