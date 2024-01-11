import 'package:cloud_firestore/cloud_firestore.dart';

import '../../database.dart';

class GetLocals extends Database{

  Future<List<Map<String, dynamic>>> get() async {
    List<Map<String, dynamic>> list = [];
    QuerySnapshot<Map<String, dynamic>>? query;

    await db.collection("locais").get().then((value) => query=value);
    if(query != null){
      list = query!.docs.map((doc) => doc.data()).toList();
    }

    return list;
  }
}