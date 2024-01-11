import '../../database.dart';

class GetRecipe extends Database {
  Future<List<Map<String, dynamic>>> get(
      String cultureType, String phase) async {
    List<Map<String, dynamic>> recipe = [];

    phase = phase.replaceAll("/", "_");

    await db
        .collection("receitas")
        .doc(cultureType.toLowerCase())
        .collection(phase)
        .get()
        .then((value) {
      recipe = value.docs.map((doc) => doc.data()).toList();
    });

    return recipe;
  }
}
