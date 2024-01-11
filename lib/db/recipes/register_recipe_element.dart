
import '../database.dart';

class RegisterRecipeElement extends Database{
  Future<void> register(String type, List<Map<String,dynamic>> data, String phase) async {
    phase = phase.replaceAll("/", "_");
    if(data.isNotEmpty){
      await db.collection("receitas").doc(type).collection(phase).doc("1").set(data[0]);
    } if (data.length >= 2){
      await db.collection("receitas").doc(type).collection(phase).doc("2").set(data[1]);
    } if (data.length >= 3){
      await db.collection("receitas").doc(type).collection(phase).doc("3").set(data[2]);
    } if (data.length >= 4){
      await db.collection("receitas").doc(type).collection(phase).doc("4").set(data[3]);
    } if (data.length >= 5){
      await db.collection("receitas").doc(type).collection(phase).doc("5").set(data[4]);
    } if (data.length >= 6){
      await db.collection("receitas").doc(type).collection(phase).doc("6").set(data[5]);
    } if (data.length >= 7){
      await db.collection("receitas").doc(type).collection(phase).doc("7").set(data[6]);
    } if (data.length >= 8){
      await db.collection("receitas").doc(type).collection(phase).doc("8").set(data[7]);
    } if (data.length >= 9){
      await db.collection("receitas").doc(type).collection(phase).doc("9").set(data[8]);
    } if (data.length >= 10){
      await db.collection("receitas").doc(type).collection(phase).doc("10").set(data[9]);
    }
  }
}
