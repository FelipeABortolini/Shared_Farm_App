import '../../database.dart';

class ExcludeFill extends Database {
  Future<List<Map<String, dynamic>>> getFills() async {
    List<Map<String, dynamic>> l = [];
    await db
        .collection("saidas")
        .where("category", isEqualTo: "diesel")
        .get()
        .then((value) {
      for (var doc in value.docs) {
        l.add(doc.data());
      }
      l.sort((a, b) {
        int timestampA = a["dateInput"].millisecondsSinceEpoch;
        int timestampB = b["dateInput"].millisecondsSinceEpoch;
        return timestampA.compareTo(timestampB);
      });
    });
    return l;
  }

  Future<Map<String, dynamic>?> getInfoDiesel() async {
    Map<String, dynamic>? diesel = {};
    await db
        .collection("insumos")
        .doc("diesel")
        .collection("nivel1")
        .doc("1")
        .get()
        .then((value) {
      diesel = value.data();
    });
    return diesel;
  }

  // Future<void> updateDiesel(
  //     double newQtt, double newLocalQtt, String local) async {
  //   await db
  //       .collection("insumos")
  //       .doc("diesel")
  //       .collection("nivel1")
  //       .doc("1")
  //       .update({"quantity": newQtt, local: newLocalQtt});
  // }

  Future<void> updateDiesel(
      double newQtt) async {
    await db
        .collection("insumos")
        .doc("diesel")
        .collection("nivel1")
        .doc("1")
        .update({"quantity": newQtt});
  }

  Future<void> delOut(String? id) async {
    await db.collection("saidas").doc(id).delete();
  }

  Future<double> getVehicleTank(String vehicleID) async {
    double vehicleTank = 0;
    await db.collection("veiculos").doc(vehicleID).get().then((value) {
      if (value.data() != null) {
        vehicleTank = double.parse(value.data()!["tank"].toString());
      }
    });
    return vehicleTank;
  }

  Future<void> decrementVehicle(String vehicleID, double newQtt) async {
    await db.collection("veiculos").doc(vehicleID).update({"tank": newQtt});
  }

  Future<String> getVehicleID(String name, String plate) async {
    String id = "0";
    await db
        .collection("veiculos")
        .where("name", isEqualTo: name)
        .where("plate", isEqualTo: plate)
        .get()
        .then((value) {
      for (var doc in value.docs) {
        id = doc["ID"].toString();
      }
    });
    return id;
  }
}
