import '../../database.dart';

class GetLastIdCultures extends Database {
  Future<int> get() async {
    int number = 0;

    await db.collection("culturas").get().then((value) {
      for (var doc in value.docs) {
        if (doc.data().containsKey("id")) {
          int id = doc["id"];
          if (id > number) {
            number = id;
          }
        }
      }
    });

    return number;
  }
}
