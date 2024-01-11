import '../../database.dart';

class UpdateDad extends Database{
  void updateDad(String? category, int numDad, List<dynamic> dadSons, int nivel) async {
    final docRef = db.collection("insumos").doc(category);

    await docRef.collection("nivel$nivel").doc("$numDad").update({"sons": dadSons});
  }
}
