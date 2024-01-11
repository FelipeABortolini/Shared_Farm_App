import '../database.dart';

class UserName extends Database {
  Future<String> get(String uid) async {
    String name = "";
    await db.collection("usuarios").get().then((value) {
      for (var doc in value.docs) {
        if (doc["uid"] == uid) {
          name = doc["name"];
          break;
        }
      }
    });

    return name;
  }
}
