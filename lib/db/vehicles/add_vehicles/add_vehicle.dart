import '../../database.dart';

class AddVehicle extends Database {
  void addVehicle(Map<String, dynamic> vehicle, int number) async {
    await db.collection("veiculos").doc(number.toString()).set(vehicle);
  }
}
