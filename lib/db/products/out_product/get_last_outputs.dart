import '../../database.dart';

class GetLastOutputs extends Database {
  Future<int> get() async {
    int number = 0;

    // await db.collection("saidas").get().then((value) => number = value.docs.length);
    await db.collection("saidas").get().then((value) {
      for (var doc in value.docs) {
        if (int.parse(doc.id) > number) {
          number = int.parse(doc.id);
        }
      }
    });

    return number;
  }
}
