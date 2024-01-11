import '../../database.dart';

class EditVehicles extends Database{
  void update(String? num, Map<String, dynamic> vehicle) async {
    await db.collection("veiculos").doc(num).update(vehicle);
  }
}
