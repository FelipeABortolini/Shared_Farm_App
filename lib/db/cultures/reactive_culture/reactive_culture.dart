import '../../database.dart';

class ReactiveCulturePhases extends Database {
  Future<void> reactive(int id) async {
    try {
      await db
          .collection("culturas")
          .doc(id.toString())
          .update({"opened": true});
    } catch (e) {}
  }

  Future<List<int>> getCultureIds(String cultureName) async {
    List<int> l = [];
    await db
        .collection("culturas")
        .where("cultureName", isEqualTo: cultureName)
        .get()
        .then((value) {
      for (var doc in value.docs) {
        l.add(doc.data()["id"]);
      }
    });
    return l;
  }
}
