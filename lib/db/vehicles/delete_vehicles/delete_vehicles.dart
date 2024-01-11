import '../../database.dart';

class DeleteVehicles extends Database{
  void del(String? code) async {
    await db.collection("veiculos").doc(code).delete();
  }
}
