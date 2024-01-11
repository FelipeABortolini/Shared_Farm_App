import '../../database.dart';

class GetQuantity extends Database {
  Future<double> get(
      String? category, int? num, int nivel) async {
    double qtt = 0;
    final docRef = db.collection("insumos").doc(category);

    await docRef.collection("nivel$nivel").doc("$num").get().then((value) {
      if (value.exists) {
        Map<String, dynamic> data = value.data()!;
        if (data.containsKey("quantity")) {
          qtt = double.parse(data["quantity"].toString());
        }
      }
    });

    return qtt;
  }

  Future<double> getLocal(
      String? category, int? num, int nivel, String local) async {
    double qtt = 0;
    final docRef = db.collection("insumos").doc(category);

    await docRef.collection("nivel$nivel").doc("$num").get().then((value) {
      if (value.exists) {
        Map<String, dynamic> data = value.data()!;
        if (data.containsKey(local)) {
          qtt = double.parse(data[local].toString());
        }
      }
    });

    return qtt;
  }
}