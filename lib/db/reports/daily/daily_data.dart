import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../controllers/culture/local_controller.dart';
import '../../../controllers/report/daily/daily_report_controller.dart';
import '../../../controllers/report/daily/daily_table_controller.dart';
import '../../database.dart';
import '../user_name.dart';

class DailyData extends Database {
  List<Map<String, dynamic>> filterByDate(
      List<Map<String, dynamic>> list, int date) {
    List<Map<String, dynamic>> filteredList = [];

    double secProvidedDate = date - (date % 86400000);

    secProvidedDate = secProvidedDate / 1000;
    double secRegisteredDate = 0;

    Timestamp time;

    for (var doc in list) {
      time = doc["dateInput"];
      secRegisteredDate = time.millisecondsSinceEpoch / 1000;
      if (secProvidedDate <= secRegisteredDate &&
          secProvidedDate + 86400 > secRegisteredDate) {
        filteredList.add(doc);
      }
    }

    return filteredList;
  }

  List<Map<String, dynamic>> filterByLocal(
      List<Map<String, dynamic>> list, List<String> locals) {
    List<Map<String, dynamic>> filteredList = [];

    for (var doc in list) {
      if (locals.contains(doc["local"])) {
        filteredList.add(doc);
      }
    }

    return filteredList;
  }

  Future<void> get(DailyReportController dailyReport, int date,
      LocalController local) async {
    UserName userName = UserName();
    int idIn = 1;
    int idOut = 1;

    DateTime day = DateTime.fromMillisecondsSinceEpoch(date);
    dailyReport.setDate(
        "${day.day.toString().padLeft(2, '0')}/${day.month.toString().padLeft(2, '0')}/${day.year}");

    if (local.santaTerezinha) {
      dailyReport.locals.add("Santa Terezinha");
    }
    if (local.real) {
      dailyReport.locals.add("Real");
    }
    if (local.saoJoao) {
      dailyReport.locals.add("São João");
    }
    if (local.saoJorge) {
      dailyReport.locals.add("São Jorge");
    }
    if (local.cruzeiro) {
      dailyReport.locals.add("Cruzeiro");
    }
    if (local.campinho) {
      dailyReport.locals.add("Campinho");
    }

    List<Map<String, dynamic>> ins = [];
    await db.collection("entradas").get().then((value) {
      for (var doc in value.docs) {
        if (doc.data().isNotEmpty) {
          ins.add(doc.data());
        }
      }
      ins.sort((a, b) {
        int timestampA = a["dateInput"].millisecondsSinceEpoch;
        int timestampB = b["dateInput"].millisecondsSinceEpoch;
        return timestampA.compareTo(timestampB);
      });
    });

    List<Map<String, dynamic>> filterInsDate = filterByDate(ins, date);

    List<Map<String, dynamic>> filterIns =
        filterByLocal(filterInsDate, dailyReport.locals);

    List<Map<String, dynamic>> outs = [];

    await db.collection("saidas").get().then((value) {
      for (var doc in value.docs) {
        if (doc.data().isNotEmpty) {
          outs.add(doc.data());
        }
      }
      outs.sort((a, b) {
        int timestampA = a["dateInput"].millisecondsSinceEpoch;
        int timestampB = b["dateInput"].millisecondsSinceEpoch;
        return timestampA.compareTo(timestampB);
      });
    });

    List<Map<String, dynamic>> filterOutsDate = filterByDate(outs, date);

    List<Map<String, dynamic>> filterOuts =
        filterByLocal(filterOutsDate, dailyReport.locals);

    for (var doc in filterIns) {
      DailyTableController tableModel = DailyTableController();
      tableModel.setId(idIn++);
      tableModel.setProduct(doc["product"]);
      tableModel.setActivePrinciple(doc["activePrinciple"]);
      tableModel.setQuantity(double.parse(doc["quantity"].toString()));
      tableModel.setNewQtt(double.parse(doc["newQtt"].toString()));
      // tableModel.setNewLocalQtt(double.parse(doc["newLocalQtt"].toString()));
      tableModel.setHour(
          "${DateTime.fromMillisecondsSinceEpoch(doc["dateInput"].millisecondsSinceEpoch - 10800000).hour.toString().padLeft(2, '0')}:${DateTime.fromMillisecondsSinceEpoch(doc["dateInput"].millisecondsSinceEpoch - 10800000).minute.toString().padLeft(2, '0')}");
      tableModel.setUser(await userName.get(doc["user"]));
      tableModel.setLocal(doc["local"]);
      tableModel.setOp("in");
      tableModel.setUnity(doc["unity"]);
      dailyReport.table.add(tableModel);
    }

    for (var doc in filterOuts) {
      DailyTableController tableModel = DailyTableController();
      tableModel.setId(idOut++);
      tableModel.setProduct(doc["product"]);
      tableModel.setActivePrinciple(doc["activePrinciple"]);
      tableModel.setCulture(doc["culture"]);
      tableModel.setPhase(doc["phase"]);
      tableModel.setVehicle(doc["vehicle"]);
      tableModel.setPlate(doc["plate"]);
      tableModel.setQuantity(double.parse(doc["quantity"].toString()));
      tableModel.setNewQtt(double.parse(doc["newQtt"].toString()));
      // tableModel.setNewLocalQtt(double.parse(doc["newLocalQtt"].toString()));
      tableModel.setHour(
          "${DateTime.fromMillisecondsSinceEpoch(doc["dateInput"].millisecondsSinceEpoch - 10800000).hour.toString().padLeft(2, '0')}:${DateTime.fromMillisecondsSinceEpoch(doc["dateInput"].millisecondsSinceEpoch - 10800000).minute.toString().padLeft(2, '0')}");
      tableModel.setUser(await userName.get(doc["user"]));
      tableModel.setLocal(doc["local"]);
      tableModel.setOp("out");
      tableModel.setUnity(doc["unity"]);
      dailyReport.table.add(tableModel);
    }
  }
}
