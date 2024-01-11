import 'package:flutter/material.dart';

class UserCulturesController extends ChangeNotifier {
  List<Map<String, dynamic>> culturesList = [];
  List<Map<String, dynamic>> cultureExclude = [];
  Map<String, List<int>> names = {};

  void setCulturesList(List<Map<String, dynamic>> cultures) {
    List<String> namesList = [];
    int index = 0;

    for(var m in cultures){
      if(!namesList.contains(m["cultureName"])){
        var myMap = {"${m["cultureName"]}": [index]};
        names.addAll(myMap);
        namesList.add("${m["cultureName"]}");
      } else if(names["${m["cultureName"]}"] != null){
        names["${m["cultureName"]}"]!.add(index);
      }
      index++;
    }

    culturesList = cultures;
    notifyListeners();
  }

  void setCultureExclude(List<Map<String, dynamic>> cultures, String name){
    for(var m in cultures){
      if(m["cultureName"] == name){
        cultureExclude.add(m);
      }
    }
    notifyListeners();
  }

  void resetCultureExclude() {
    cultureExclude.clear();
    notifyListeners();
  }

  void resetList() {
    culturesList.clear();
    cultureExclude.clear();
    notifyListeners();
  }
}
