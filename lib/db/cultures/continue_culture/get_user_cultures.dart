import '../../database.dart';

class GetUserCultures extends Database {
  Future<List<Map<String, dynamic>>> getOpenedUser(String userID) async {
    Map<String, dynamic> culture = {};
    List<Map<String, dynamic>> lis = [];

    await db.collection("culturas").get().then((value) {
      for (var doc in value.docs) {
        culture = doc.data();
        if (culture["user"] == userID && culture["opened"] == true) {
          lis.add(culture);
        }
      }

      lis.sort((a, b) {
        int timestampA = a["dateOutput"].millisecondsSinceEpoch;
        int timestampB = b["dateOutput"].millisecondsSinceEpoch;
        return timestampA.compareTo(timestampB);
      });
    });

    return lis;
  }

  Future<List<Map<String, dynamic>>> getAllUser(String userID) async {
    Map<String, dynamic> culture = {};
    List<Map<String, dynamic>> lis = [];

    await db.collection("culturas").get().then((value) {
      for (var doc in value.docs) {
        culture = doc.data();
        if (culture["user"] == userID) {
          lis.add(culture);
        }
      }

      lis.sort((a, b) {
        int timestampA = a["dateOutput"].millisecondsSinceEpoch;
        int timestampB = b["dateOutput"].millisecondsSinceEpoch;
        return timestampA.compareTo(timestampB);
      });
    });
    return lis;
  }

  Future<List<Map<String, dynamic>>> getOpened() async {
    Map<String, dynamic> culture = {};
    List<Map<String, dynamic>> lis = [];

    await db.collection("culturas").get().then((value) {
      for (var doc in value.docs) {
        culture = doc.data();
        if (culture["opened"] == true) {
          lis.add(culture);
        }
      }

      lis.sort((a, b) {
        int timestampA = a["dateOutput"].millisecondsSinceEpoch;
        int timestampB = b["dateOutput"].millisecondsSinceEpoch;
        return timestampA.compareTo(timestampB);
      });
    });

    return lis;
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    List<Map<String, dynamic>> lis = [];

    await db.collection("culturas").get().then((value) {
      for (var doc in value.docs) {
        lis.add(doc.data());
      }

      lis.sort((a, b) {
        int timestampA = a["dateOutput"].millisecondsSinceEpoch;
        int timestampB = b["dateOutput"].millisecondsSinceEpoch;
        return timestampA.compareTo(timestampB);
      });
    });
    return lis;
  }
}
