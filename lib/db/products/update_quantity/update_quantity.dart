import '../../database.dart';

class UpdateQuantity extends Database{
  Future<void> update(String? category, int? num, double quantity, int nivel, String local) async {
    final docRef = db.collection("insumos").doc(category);

    await docRef.collection("nivel$nivel").doc("$num").update({local: quantity});
  }
}
