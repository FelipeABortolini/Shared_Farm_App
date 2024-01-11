import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../controllers/culture/local_controller.dart';
import '../../../controllers/report/fill/fill_report_controller.dart';
import '../../../controllers/report/fill/fill_table_controller.dart';
import '../../../controllers/report/fill/fill_table_ins_controller.dart';
import '../../database.dart';
import '../user_name.dart';

class FillReportData extends Database {
  List<Map<String, dynamic>> filterByDate(
      List<Map<String, dynamic>> list, int startDate, int endDate) {
    List<Map<String, dynamic>> filteredList = [];

    double secProvidedStartDate = startDate - (startDate % 86400000);
    double secProvidedEndDate = endDate - (endDate % 86400000);

    secProvidedStartDate = startDate / 1000;
    secProvidedEndDate = endDate / 1000;
    double secRegisteredDate = 0;

    Timestamp time;

    for (var doc in list) {
      if (doc.isNotEmpty) {
        time = doc["dateInput"];
        secRegisteredDate = time.millisecondsSinceEpoch / 1000;
        if (secProvidedStartDate < secRegisteredDate &&
            secProvidedEndDate + 86400 > secRegisteredDate) {
          filteredList.add(doc);
        }
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

  Future<void> get(
    FillReportController fillReport,
    int startDate,
    int endDate,
    LocalController local,
    bool fullHistory,
  ) async {
    UserName userName = UserName();
    int id = 1;
    int idIns = 1;
    double dieselCentral = 0;
    double dieselCruzeiro = 0;
    double dieselCampinho = 0;
    double dieselSantaTerezinha = 0;
    double dieselReal = 0;
    double dieselSaoJoao = 0;
    double dieselSaoJorge = 0;

    if (local.santaTerezinha) {
      fillReport.locals.add("Santa Terezinha");
    }
    if (local.real) {
      fillReport.locals.add("Real");
    }
    if (local.saoJoao) {
      fillReport.locals.add("São João");
    }
    if (local.saoJorge) {
      fillReport.locals.add("São Jorge");
    }
    if (local.cruzeiro) {
      fillReport.locals.add("Cruzeiro");
    }
    if (local.campinho) {
      fillReport.locals.add("Campinho");
    }

    List<Map<String, dynamic>> ins = [];
    await db.collection("entradas").get().then((value) {
      for (var doc in value.docs) {
        if (doc.data().isNotEmpty) {
          if (doc.data()["product"] == "DIESEL") {
            ins.add(doc.data());
          }
        }
      }
    });

    List<Map<String, dynamic>> fills = [];
    await db.collection("saidas").get().then((value) {
      for (var doc in value.docs) {
        if (doc.data()["vehicle"] != "") {
          fills.add(doc.data());
        }
      }

      fills.sort((a, b) {
        int timestampA = a["dateInput"].millisecondsSinceEpoch;
        int timestampB = b["dateInput"].millisecondsSinceEpoch;
        return timestampA.compareTo(timestampB);
      });
    });

    List<Map<String, dynamic>> filterIns = [];
    List<Map<String, dynamic>> filterFills = [];

    if (fullHistory) {
      filterIns = ins;
      filterFills = fills;
    } else {
      filterIns = filterByDate(ins, startDate, endDate);
      filterFills = filterByDate(fills, startDate, endDate);
    }

    for (var doc in filterIns) {
      FillTableInsController tableModel = FillTableInsController();
      tableModel.setId(idIns++);
      tableModel.setQuantity(double.parse(doc["quantity"].toString()));
      tableModel.setNewQtt(double.parse(doc["newQtt"].toString()));

      dieselCentral += double.parse(doc["quantity"].toString());

      DateTime day = DateTime.fromMillisecondsSinceEpoch(
          doc["dateInput"].millisecondsSinceEpoch);
      tableModel.setDate(
          "${day.day.toString().padLeft(2, '0')}/${day.month.toString().padLeft(2, '0')}/${day.year}");

      fillReport.addTableInsElement(tableModel);
    }

    for (var doc in filterFills) {
      FillTableController tableModel = FillTableController();
      tableModel.setId(id++);
      tableModel.setUser(await userName.get(doc["user"]));
      tableModel.setProduct(doc["product"]);
      tableModel.setActivePrinciple(doc["activePrinciple"]);
      tableModel.setQuantity(double.parse(doc["quantity"].toString()));
      tableModel.setNewQtt(double.parse(doc["newQtt"].toString()));
      // tableModel.setNewLocalQtt(double.parse(doc["newLocalQtt"].toString()));
      tableModel.setVehicle(doc["vehicle"]);
      tableModel.setPlate(doc["plate"]);

      DateTime day = DateTime.fromMillisecondsSinceEpoch(
          doc["dateInput"].millisecondsSinceEpoch);
      tableModel.setDate(
          "${day.day.toString().padLeft(2, '0')}/${day.month.toString().padLeft(2, '0')}/${day.year}");

      tableModel.setHour(
          "${DateTime.fromMillisecondsSinceEpoch(doc["dateInput"].millisecondsSinceEpoch - 10800000).hour.toString().padLeft(2, '0')}:${DateTime.fromMillisecondsSinceEpoch(doc["dateInput"].millisecondsSinceEpoch - 10800000).minute.toString().padLeft(2, '0')}");

      tableModel.setUser(await userName.get(doc["user"]));
      tableModel.setLocal(doc["local"]);
      if (doc["local"] == "Cruzeiro") {
        dieselCruzeiro += double.parse(doc["quantity"].toString());
      } else if (doc["local"] == "Campinho") {
        dieselCampinho += double.parse(doc["quantity"].toString());
      } else if (doc["local"] == "Santa Terezinha") {
        dieselSantaTerezinha += double.parse(doc["quantity"].toString());
      } else if (doc["local"] == "Real") {
        dieselReal += double.parse(doc["quantity"].toString());
      } else if (doc["local"] == "São João") {
        dieselSaoJoao += double.parse(doc["quantity"].toString());
      } else if (doc["local"] == "São Jorge") {
        dieselSaoJorge += double.parse(doc["quantity"].toString());
      }
      fillReport.table.add(tableModel);
    }

    await db
        .collection("insumos")
        .doc("diesel")
        .collection("nivel1")
        .get()
        .then((value) {
      for (var doc in value.docs) {
        if (doc.data().isNotEmpty) {
          fillReport.setDieselSantaTerezinha(dieselSantaTerezinha);
          fillReport.setDieselReal(dieselReal);
          fillReport.setDieselSaoJoao(dieselSaoJoao);
          fillReport.setDieselSaoJorge(dieselSaoJorge);
          fillReport.setDieselCruzeiro(dieselCruzeiro);
          fillReport.setDieselCampinho(dieselCampinho);
          fillReport.setDieselCentral(dieselCentral);
          fillReport.setQtt(double.parse(doc.data()["quantity"].toString()));
        }
      }
    });
  }
}
