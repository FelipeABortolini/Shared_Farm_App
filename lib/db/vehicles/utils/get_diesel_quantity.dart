import 'package:cloud_firestore/cloud_firestore.dart';

import '../../database.dart';

class GetDieselQuantity extends Database {
  Future<double> get() async {
    DocumentSnapshot<Map<String, dynamic>>? query;
    double qtd = 0.0;

    await db
        .collection("insumos")
        .doc("diesel")
        .collection("nivel1")
        .doc("1")
        .get()
        .then((value) => query = value);
    if (query != null) {
      qtd =  double.parse(query!.data()!["quantity"].toString());
    }

    return qtd;
  }

  String toCamelCase(String input) {
    if (input.isEmpty) {
      return '';
    }

    List<String> words = input.split(' ');
    String camelCaseText = words[0].toLowerCase();

    for (int i = 1; i < words.length; i++) {
      String firstLetter = words[i][0].toUpperCase();
      String restOfWord = words[i].substring(1).toLowerCase();
      camelCaseText += firstLetter + restOfWord;
    }

    if (camelCaseText == "sãoJoão") {
      camelCaseText = "saoJoao";
    } else if (camelCaseText == "sãoJorge") {
      camelCaseText = "saoJorge";
    }

    return camelCaseText;
  }

  Future<double> getLocal(String local) async {
    DocumentSnapshot<Map<String, dynamic>>? query;
    double qtd = 0.0;

    await db
        .collection("insumos")
        .doc("diesel")
        .collection("nivel1")
        .doc("1")
        .get()
        .then((value) => query = value);
    if (query != null) {
      qtd = double.parse(query!.data()![toCamelCase(local)].toString());
    }

    return qtd;
  }
}
