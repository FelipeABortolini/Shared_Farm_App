import '../../database.dart';

class DeleteProducts extends Database{
  void delProduct(String? category, int nivel, int number) async {
    final docRef = db.collection("insumos").doc(category);

    await docRef.collection("nivel$nivel").doc(number.toString()).delete();
  }
}
