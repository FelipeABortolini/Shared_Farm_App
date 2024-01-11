import '../../database.dart';

class FillVehicles extends Database{
  void update(String? num, Map<String, dynamic> vehicle) async {
    await db.collection("veiculos").doc(num).update(vehicle);
  }
}
