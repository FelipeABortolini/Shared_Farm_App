import 'database.dart';

class UserRegister extends Database {
  Future<void> register(
      String uid, String? userName, String? permission, String email) async {
    await db
        .collection("usuarios")
        .add({"uid": uid, "name": userName, "permission": permission, "email": email});
  }

  Future<String> getPermission(String name) async {
    String permission = "";

    await db
        .collection("usuarios")
        .where("name", isEqualTo: name)
        .get()
        .then((value) => {
              for (var doc in value.docs)
                {permission = doc.data()["permission"]}
            });

    return permission;
  }

  Future<List<String>> getHosts() async {
    List<String> hosts = [];

    await db
        .collection("usuarios")
        .where("permission", isEqualTo: "Host")
        .get()
        .then((value) => {
              for (var doc in value.docs)
                {hosts.add(doc.data()["email"])}
            });

    return hosts;
  }
}
