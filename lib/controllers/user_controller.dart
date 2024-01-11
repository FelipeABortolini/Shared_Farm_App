import 'package:flutter/material.dart';

class UserController extends ChangeNotifier {
  Map<String, dynamic> currentUser = {};
  String currentPermissions = "";
  String? selectedPermissionToNewUser = "Operacional";

  void setCurrentUser(Map<String, dynamic> user) {
    currentUser = user;
    notifyListeners();
  }

  void setCurrentPermissions(String permissions) {
    currentPermissions = permissions;
    notifyListeners();
  }

  void setSelectedPermissionToNewUser(String? permission) {
    selectedPermissionToNewUser = permission;
    notifyListeners();
  }

  void resetAll() {
    currentUser.clear();
    currentPermissions = "";
    selectedPermissionToNewUser = "Operacional";
    notifyListeners();
  }
}
