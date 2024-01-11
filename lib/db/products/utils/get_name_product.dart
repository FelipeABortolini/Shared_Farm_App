import '../../database.dart';

class GetNameProduct extends Database {
  Future<String> get(String? category, String dadCode, int nivel) async {
    final docRef = db.collection("insumos").doc(category);

    String n = "";

    await docRef
        .collection("nivel$nivel")
        .get()
        .then((value) {
      for (var doc in value.docs) {
        if (doc.data()["code"] == dadCode) {
          n = doc.data()["name"];
        }
      }
    });

    return n;
  }
}
