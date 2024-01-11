import '../../../../../db/database.dart';

class DeleteDadsSon extends Database {
  void delDadsSon(
      String? category, int nivel, int? number, List<dynamic> dadSons, String numProd) async {
    final docRef = db.collection("insumos").doc(category);

    dadSons.remove(numProd);

    await docRef
        .collection("nivel$nivel")
        .doc(number.toString())
        .update({"sons": dadSons});
  }
}
