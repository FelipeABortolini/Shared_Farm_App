import '../../database.dart';

class GetLastInputs extends Database{
  Future<int> get() async {
    int number = 0;

    // await db.collection("entradas").get().then((value) => number = value.docs.length);
    await db.collection("entradas").get().then((value) {
      for (var doc in value.docs) {
        if (int.parse(doc.id) > number) {
          number = int.parse(doc.id);
        }
      }
    });

    return number;
  }
}