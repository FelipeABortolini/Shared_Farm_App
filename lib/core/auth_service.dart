import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/user_controller.dart';
import '../db/user_register.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

final authServiceProvider = ChangeNotifierProvider((ref) => AuthService());

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserRegister userRegister = UserRegister();
  User? usuario;
  bool isLoading = true;
  bool userRegistered = false;

  AuthService() {
    _AuthCheck();
  }

  _AuthCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;

    _AuthCheck();
    debugPrint("user $usuario");
    notifyListeners();
  }

  login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        throw AuthException('Email não encontrado. Cadastre-se.');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta. Tente novamente');
      } else if (e.code == 'network-request-failed') {
        throw AuthException('Sem acesso à internet.');
      }
    }
  }

  registrar(String hostEmail, String hostSenha, String email, String senha,
      String name, String? permission) async {
    try {
      if(permission == "Host"){
        senha = "@host2023@";
      }
      await _auth
          .createUserWithEmailAndPassword(email: email, password: senha)
          .then((UserCredential userCredential) {
        userCredential.user!.updateDisplayName(name);
        userRegister.register(
            userCredential.user!.uid, name, permission, email);
      });
      await _auth.signInWithEmailAndPassword(
          email: hostEmail, password: hostSenha);
      _getUser();
      userRegistered = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        userRegistered = false;
        throw AuthException('A senha é muito fraca!');
      } else if (e.code == 'email-already-in-use') {
        userRegistered = false;
        throw AuthException('Este email já está cadastrado');
      }
    }
  }

  logout(UserController user) async {
    user.resetAll();
    await _auth.signOut();
    _getUser();
  }
}
