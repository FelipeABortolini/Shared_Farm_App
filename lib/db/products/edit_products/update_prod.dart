import '../../database.dart';

class EditProducts extends Database{
  void update(String? category, int? numProd, Map<String, dynamic> product, int nivel) async {
    final docRef = db.collection("insumos").doc(category);

    await docRef.collection("nivel$nivel").doc("$numProd").update(product);
  }
}
