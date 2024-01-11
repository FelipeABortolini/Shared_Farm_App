import '../../database.dart';

class DeleteLocals extends Database{
  void del(String? code) async {
    await db.collection("locais").doc(code).delete();
  }
}
