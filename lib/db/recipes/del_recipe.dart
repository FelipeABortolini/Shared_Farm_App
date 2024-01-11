import 'package:cloud_firestore/cloud_firestore.dart';

import '../database.dart';

class DelRecipeElement extends Database {
  Future<void> delete(
      String type, String phase) async {
    CollectionReference collectionRef =
        db.collection("receitas").doc(type.toLowerCase()).collection(phase);

    QuerySnapshot querySnapshot = await collectionRef.get();

    for (DocumentSnapshot docSnapshot in querySnapshot.docs) {
      await docSnapshot.reference.delete();
    }
  }
}
