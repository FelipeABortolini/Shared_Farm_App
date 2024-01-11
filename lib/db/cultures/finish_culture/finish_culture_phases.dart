import '../../database.dart';

class FinishCulturePhases extends Database {
  void finish(int id) async {
    try {
      await db.collection("culturas").doc(id.toString()).update({"opened": false});
    } catch (e) {}
  }
}
