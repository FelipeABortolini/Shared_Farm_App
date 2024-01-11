
import '../../database.dart';

class GetDadInfos extends Database{
  Future<Map<String, dynamic>?> get(String? category, int nivel, int numberID) async {
    final docRef = db.collection("insumos").doc(category);

    Map<String, dynamic>? dad = {};

    await docRef.collection("nivel$nivel").doc("$numberID").get().then((value) => dad=value.data());

    return dad;
  }
}