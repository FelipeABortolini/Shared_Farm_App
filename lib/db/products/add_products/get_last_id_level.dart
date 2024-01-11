import '../../database.dart';

class GetLastIdLevels extends Database {
  Future<int> get(String? category, int nivel) async {
    final docRef = db.collection("insumos").doc(category);

    int number = 0;

    await docRef.collection("nivel$nivel").get().then((value) {
      for (var doc in value.docs) {
        if (doc.data().containsKey("ID")) {
          int id = doc["ID"];
          if (id > number) {
            number = id;
          }
        }
      }
    });

    return number;
  }
}
