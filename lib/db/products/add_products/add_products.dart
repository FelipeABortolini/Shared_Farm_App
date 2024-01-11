import '../../database.dart';

class AddProducts extends Database{
  void addProduct(String? category, Map<String, dynamic> product, int nivel, int number) async {
    final docRef = db.collection("insumos").doc(category);

    await docRef.collection("nivel$nivel").doc(number.toString()).set(product);
  }
}
