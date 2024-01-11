import '../../database.dart';

class GetCultures extends Database {
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
    });

    return lis;
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    List<Map<String, dynamic>> lis = [];

    await db.collection("culturas").get().then((value) {
      for (var doc in value.docs) {
        if (doc.data().isNotEmpty) {
          lis.add(doc.data());
        }
      }
    });

    return lis;
  }

  Future<List<String>> getNames() async {
    List<String> names = [];

    await db.collection("culturas").get().then((value) {
      for (var doc in value.docs) {
        if (doc.data().isNotEmpty) {
          if (!names.contains(doc.data()["cultureName"])) {
            names.add(doc.data()["cultureName"]);
          }
        }
      }
    });

    return names;
  }

  Future<List<String>> getNamesOpened() async {
    List<String> names = [];

    await db.collection("culturas").get().then((value) {
      for (var doc in value.docs) {
        if (doc.data()["opened"] == true) {
          if (doc.data().isNotEmpty) {
            if (!names.contains(doc.data()["cultureName"])) {
              names.add(doc.data()["cultureName"]);
            }
          }
        }
      }
    });

    return names;
  }

  Future<List<String>> getClosedNames() async {
    List<String> names = [];

    await db.collection("culturas").get().then((value) {
      for (var doc in value.docs) {
        if (doc.data()["opened"] == false) {
          if (doc.data().isNotEmpty) {
            if (!names.contains(doc.data()["cultureName"])) {
              names.add(doc.data()["cultureName"]);
            }
          }
        }
      }
    });

    return names;
  }
}
