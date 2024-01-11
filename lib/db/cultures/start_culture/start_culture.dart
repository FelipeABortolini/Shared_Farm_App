import '../../database.dart';

class RegisterCulture extends Database{
  Future<void> register(int number, Map<String,dynamic> data) async {
    await db.collection("culturas").doc(number.toString()).set(data);
  }
}
