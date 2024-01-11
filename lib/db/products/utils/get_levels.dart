import 'package:cloud_firestore/cloud_firestore.dart';

import '../../database.dart';

class GetLevels extends Database{

  Future<List<Map<String, dynamic>>> getLevel(String classe, int nivel) async {
    List<Map<String, dynamic>> list = [];
    QuerySnapshot<Map<String, dynamic>>? query;

    await db.collectionGroup("nivel$nivel").where("category", isEqualTo: classe).get().then((value) => query=value);
    if(query != null){
      list = query!.docs.map((doc) => doc.data()).toList();
    }

    return list;
  }
}