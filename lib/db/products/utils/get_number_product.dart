import '../../database.dart';

class GetNumberProduct extends Database {
  Future<int?> get(String? category, String dadCode, int nivel) async {
    final docRef = db.collection("insumos").doc(category);

    int? n = 0;

    await docRef
        .collection("nivel$nivel")
        .where("code", isEqualTo: dadCode)
        .get()
        .then((value) {
      for (var doc in value.docs) {
        if (doc.data()["code"] == dadCode) {
          n = doc.data()["ID"];
        }
      }
    });

    return n;
  }
}
