import '../../database.dart';

class ExcludeInProduct extends Database {
  Future<void> delInProd(String id) async {
    await db.collection("entradas").doc(id).delete();
  }

  // Future<void> decrementProd(double newQtt, double newLocalQtt, String local,
  //     String id, int nivel, String category) async {
  //   await db
  //       .collection("insumos")
  //       .doc(category)
  //       .collection("nivel$nivel")
  //       .doc(id)
  //       .update({"quantity": newQtt, local: newLocalQtt});
  // }

  Future<void> decrementProd(double newQtt, String local,
      String id, int nivel, String category) async {
    await db
        .collection("insumos")
        .doc(category)
        .collection("nivel$nivel")
        .doc(id)
        .update({"quantity": newQtt});
  }

  Future<List<Map<String, dynamic>>> getIns() async {
    List<Map<String, dynamic>> l = [];
    await db.collection("entradas").get().then((value) {
      for (var doc in value.docs) {
        l.add(doc.data());
      }
    });
    return l;
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
}
