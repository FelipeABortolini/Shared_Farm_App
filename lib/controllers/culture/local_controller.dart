import 'package:flutter/material.dart';

class LocalController extends ChangeNotifier {
  bool santaTerezinha = true;
  bool real = false;
  bool saoJoao = false;
  bool saoJorge = false;
  bool cruzeiro = false;
  bool campinho = false;
  String result = 'Santa Terezinha';

  bool hasSeleted() {
    bool result = false;
    if (santaTerezinha || real || saoJoao || saoJorge || cruzeiro || campinho) {
      result = true;
    }
    return result;
  }

  void allSelected() {
    santaTerezinha = true;
    real = true;
    saoJoao = true;
    saoJorge = true;
    cruzeiro = true;
    campinho = true;
    notifyListeners();
  }

  void allUnselected() {
    santaTerezinha = false;
    real = false;
    saoJoao = false;
    saoJorge = false;
    cruzeiro = false;
    campinho = false;
    notifyListeners();
  }

  void toggleSantaTerezinha() {
    santaTerezinha = !santaTerezinha;
    notifyListeners();
  }

  void toggleReal() {
    real = !real;
    notifyListeners();
  }

  void toggleSaoJoao() {
    saoJoao = !saoJoao;
    notifyListeners();
  }

  void toggleSaoJorge() {
    saoJorge = !saoJorge;
    notifyListeners();
  }

  void toggleCruzeiro() {
    cruzeiro = !cruzeiro;
    notifyListeners();
  }

  void toggleCampinho() {
    campinho = !campinho;
    notifyListeners();
  }

  void setSantaTerezinha() {
    santaTerezinha = true;
    real = false;
    saoJoao = false;
    saoJorge = false;
    cruzeiro = false;
    campinho = false;
    result = 'Santa Terezinha';
    notifyListeners();
  }

  void setReal() {
    santaTerezinha = false;
    real = true;
    saoJoao = false;
    saoJorge = false;
    cruzeiro = false;
    campinho = false;
    result = 'Real';
    notifyListeners();
  }

  void setSaoJoao() {
    santaTerezinha = false;
    real = false;
    saoJoao = true;
    saoJorge = false;
    cruzeiro = false;
    campinho = false;
    result = 'São João';
    notifyListeners();
  }

  void setSaoJorge() {
    santaTerezinha = false;
    real = false;
    saoJoao = false;
    saoJorge = true;
    cruzeiro = false;
    campinho = false;
    result = 'São Jorge';
    notifyListeners();
  }

  void setCruzeiro() {
    santaTerezinha = false;
    real = false;
    saoJoao = false;
    saoJorge = false;
    cruzeiro = true;
    campinho = false;
    result = 'Cruzeiro';
    notifyListeners();
  }

  void setCampinho() {
    santaTerezinha = false;
    real = false;
    saoJoao = false;
    saoJorge = false;
    cruzeiro = false;
    campinho = true;
    result = 'Campinho';
    notifyListeners();
  }
}
