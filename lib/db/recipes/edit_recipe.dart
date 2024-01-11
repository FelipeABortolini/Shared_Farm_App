import '../database.dart';

class EditRecipeElement extends Database {
  Future<void> update(String type, List<Map<String, dynamic>> data,
      String phase, int initialAmount) async {
    phase = phase.replaceAll("/", "_");
    if (data.isNotEmpty) {
      await db
          .collection("receitas")
          .doc(type)
          .collection(phase)
          .doc("1")
          .update(data[0]);
    }
    if (data.length >= 2) {
      if (initialAmount >= 2) {
        await db
            .collection("receitas")
            .doc(type)
            .collection(phase)
            .doc("2")
            .update(data[1]);
      } else {
        await db
            .collection("receitas")
            .doc(type)
            .collection(phase)
            .doc("2")
            .set(data[1]);
      }
    }
    if (data.length >= 3) {
      if (initialAmount >= 3) {
        await db
            .collection("receitas")
            .doc(type)
            .collection(phase)
            .doc("3")
            .update(data[2]);
      } else {
        await db
            .collection("receitas")
            .doc(type)
            .collection(phase)
            .doc("3")
            .set(data[2]);
      }
    }
    if (data.length >= 4) {
      if (initialAmount >= 4) {
        await db
            .collection("receitas")
            .doc(type)
            .collection(phase)
            .doc("4")
            .update(data[3]);
      } else {
        await db
            .collection("receitas")
            .doc(type)
            .collection(phase)
            .doc("4")
            .set(data[3]);
      }
    }
    if (data.length >= 5) {
      if (initialAmount >= 5) {
        await db
            .collection("receitas")
            .doc(type)
            .collection(phase)
            .doc("5")
            .update(data[4]);
      } else {
        await db
            .collection("receitas")
            .doc(type)
            .collection(phase)
            .doc("5")
            .set(data[4]);
      }
    }
    if (data.length >= 6) {
      if (initialAmount >= 6) {
        await db
            .collection("receitas")
            .doc(type)
            .collection(phase)
            .doc("6")
            .update(data[5]);
      } else {
        await db
            .collection("receitas")
            .doc(type)
            .collection(phase)
            .doc("6")
            .set(data[5]);
      }
    }
    if (data.length >= 7) {
      if (initialAmount >= 7) {
        await db
            .collection("receitas")
            .doc(type)
            .collection(phase)
            .doc("7")
            .update(data[6]);
      } else {
        await db
            .collection("receitas")
            .doc(type)
            .collection(phase)
            .doc("7")
            .set(data[6]);
      }
    }
    if (data.length >= 8) {
      if (initialAmount >= 8) {
        await db
            .collection("receitas")
            .doc(type)
            .collection(phase)
            .doc("8")
            .update(data[7]);
      } else {
        await db
            .collection("receitas")
            .doc(type)
            .collection(phase)
            .doc("8")
            .set(data[7]);
      }
    }
    if (data.length >= 9) {
      if (initialAmount >= 9) {
        await db
            .collection("receitas")
            .doc(type)
            .collection(phase)
            .doc("9")
            .update(data[8]);
      } else {
        await db
            .collection("receitas")
            .doc(type)
            .collection(phase)
            .doc("9")
            .set(data[8]);
      }
    }
    if (data.length >= 10) {
      if (initialAmount >= 10) {
        await db
            .collection("receitas")
            .doc(type)
            .collection(phase)
            .doc("10")
            .update(data[9]);
      } else {
        await db
            .collection("receitas")
            .doc(type)
            .collection(phase)
            .doc("10")
            .set(data[9]);
      }
    }
  }
}
