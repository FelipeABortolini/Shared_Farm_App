import 'package:cloud_firestore/cloud_firestore.dart';

import '../../database.dart';

class DeletePhase extends Database {
  Future<void> del(String? id) async {
    await db.collection("culturas").doc(id).delete();
  }

  Future<Map<String, dynamic>?> getCurrentProd(
      String? category, int nivel, String code) async {
    Map<String, dynamic>? prod = {};

    final docRef = db.collection("insumos").doc(category);

    await docRef
        .collection("nivel$nivel")
        .where("code", isEqualTo: code)
        .get()
        .then((value) {
      for (var doc in value.docs) {
        prod = doc.data();
      }
    });

    return prod;
  }

  Future<int> delOuts(String prod, String phase, String culture,
      String quantity, DateTime date) async {
    await db
        .collection("saidas")
        .where("product", isEqualTo: prod)
        .where("phase", isEqualTo: phase)
        .where("culture", isEqualTo: culture)
        .where("quantity", isEqualTo: double.parse(quantity))
        .where("dateInput", isEqualTo: Timestamp.fromDate(date))
        .get()
        .then((value) async {
      for (var doc in value.docs) {
        await delOut(doc.id);
      }
    });
    return 0;
  }

  Future<void> delOut(String? id) async {
    await db.collection("saidas").doc(id).delete();
  }
}
