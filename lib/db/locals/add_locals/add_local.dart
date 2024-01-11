import '../../database.dart';

class AddLocal extends Database {
  void addLocal(Map<String, dynamic> local, int number) async {
    await db.collection("locais").doc(number.toString()).set(local);
  }
}
