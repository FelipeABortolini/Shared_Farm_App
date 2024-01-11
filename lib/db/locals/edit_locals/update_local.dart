import '../../database.dart';

class EditLocals extends Database{
  void update(String? num, Map<String, dynamic> local) async {
    await db.collection("locais").doc(num).update(local);
  }
}
